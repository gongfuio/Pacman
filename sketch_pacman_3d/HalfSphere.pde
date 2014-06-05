class HalfSphere {

  final int SCALE_X = 12;  // Nbre de méridiens (latitude)
  final int SCALE_Y = 24; // Nbre de méridiens (longitude)
  final color PACMAN_COLOR = color( 255, 192, 0); 

  float radius;
  PVector[] vertices;
  PShape hs;

  HalfSphere( float radius) {
    this.radius = radius;
    this.vertices = createVertices();
    this.hs = createHalfSphere( this.vertices);
  }

  PVector[] createVertices() {
    PVector[] vertices = new PVector[ SCALE_X * SCALE_Y];
    // cf. https://www.opengl.org/discussion_boards/showthread.php/159402-half-sphere
    for( int i = 0; i < SCALE_X; ++i) {
      for( int j = 0; j < SCALE_Y; ++j) {
        vertices[ i * SCALE_Y + j] = new PVector(
          radius * cos( j * TWO_PI / SCALE_Y) * cos( i * PI / (2 * SCALE_X)),
          radius * sin( i * PI / (2 * SCALE_X)),
          radius * sin( j * TWO_PI / SCALE_Y) * cos( i * PI / (2 * SCALE_X))
        );
      }
    }
    return vertices;
  }

  PShape createHalfSphere( PVector[] vertices) {
    PShape s = createShape( GROUP);
    PShape dome = createShape();
    PShape top = createShape();
    PVector v, n;

    dome.beginShape( QUADS);
    dome.fill( PACMAN_COLOR);
    for( int i = 0; i < SCALE_X-1; ++i) {
      for( int j = 0; j < SCALE_Y; ++j) {
        // We have to build the Quad clockwise, with normals before vertices
        // 1. TOP RIGHT
        v = vertices[ i*SCALE_Y + j];
        n = v.normalize(null);
        dome.normal( n.x, n.y, n.z);
        dome.vertex( v.x, v.y, v.z);

        // 2. BOTTOM RIGHT
        v = vertices[ (i+1)*SCALE_Y + j];
        n = v.normalize(null);
        dome.normal( n.x, n.y, n.z);
        dome.vertex( v.x, v.y, v.z); 

        // 3. BOTTOM LEFT
        v = vertices[ (i+1)*SCALE_Y + (j+1) % SCALE_Y];
        n = v.normalize(null);
        dome.normal( n.x, n.y, n.z);
        dome.vertex( v.x, v.y, v.z);
        
        // 4. TOP LEFT
        v = vertices[ i*SCALE_Y + (j+1) % SCALE_Y];
        n = v.normalize(null);
        dome.normal( n.x, n.y, n.z);
        dome.vertex( v.x, v.y, v.z);
      }
    }    
    dome.endShape();

    top.beginShape( TRIANGLE_FAN);
    top.fill( PACMAN_COLOR);
    for( int j = 0; j < SCALE_Y; ++j) {
        v = vertices[ j];
        top.normal(0, 1, 0);
        top.vertex( v.x, v.y, v.z);
    }
    top.endShape();

    s.addChild( dome);
    s.addChild( top);
    return s;
  }
  
  void drawNormals() {
    PVector v, n;

    strokeWeight( 0.5);
    stroke( 0, 128);
    for( int i = 0; i < SCALE_X-1; ++i) {
      for( int j = 0; j < SCALE_Y; ++j) {
        v = vertices[ i * SCALE_Y + j];
        n = v.normalize( null);
        n.mult( 10.0);
        n.add( v);        
        line( v.x, v.y, v.z, n.x, n.y, n.z);
      }
    }    
  }

  void display() {
    shape( this.hs, 0, 0);
    // drawNormals();
  }

}
