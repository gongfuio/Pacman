class HalfSphere {

  final int SCALE_X = 12; 
  final int SCALE_Y = 16;
  final color PACMAN_COLOR = color( 255, 192, 0); 

  float radius;
  PVector[] vertices;
  PShape hs;

  HalfSphere( float radius) {
    this.radius = radius;
    this.vertices = initvertices();
    this.hs = initShape( this.vertices);
  }

  PVector[] initvertices() {
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

  PShape initShape( PVector[] vertices) {
    PShape s = createShape( GROUP);
    PShape dome = createShape();
    PShape top = createShape();
    PVector v;

    dome.beginShape( QUADS);
    dome.stroke( color( 255));
    dome.strokeWeight( 2);
    dome.fill( PACMAN_COLOR);
    for( int i = 0; i < SCALE_X-1; ++i) {
      for( int j = 0; j < SCALE_Y; ++j) {
        v = vertices[ i*SCALE_Y + j];
        dome.vertex( v.x, v.y, v.z);
        v = vertices[ i*SCALE_Y + (j+1) % SCALE_Y];
        dome.vertex( v.x, v.y, v.z);
        v = vertices[ (i+1)*SCALE_Y + (j+1) % SCALE_Y];
        dome.vertex( v.x, v.y, v.z);
        v = vertices[ (i+1)*SCALE_Y + j];
        dome.vertex( v.x, v.y, v.z);
      }
    }    
    dome.endShape();

    top.beginShape( TRIANGLE_FAN);
    top.stroke( color( 255));
    top.strokeWeight( 2);
    top.fill( PACMAN_COLOR);
    for( int j = 0; j < SCALE_Y; ++j) {
        v = vertices[ j];
        top.vertex( v.x, v.y, v.z);
    }
    top.endShape();

    s.addChild( dome);
    s.addChild( top);
    return s;
  }

  void display() {
    shape( this.hs, 0, 0);
  }

}
