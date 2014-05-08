class HalfSphere {

  final static int SCALE_X = 15; 
  final static int SCALE_Y = 15; 

  float radius;
  PVector[] edges;
  PShape hs;

  HalfSphere( float radius) {
    this.radius = radius;
    this.edges = initEdges();
    this.hs = initShape( this.edges);
  }

  PVector[] initEdges() {
    PVector[] edges = new PVector[ SCALE_X * SCALE_Y];
    for( int i = 0; i < SCALE_X; ++i) {
      for( int j = 0; j < SCALE_Y; ++j) {
        edges[ i * SCALE_Y + j] = new PVector(
          radius * cos( j * TWO_PI / SCALE_Y) * cos( i * PI / (2 * SCALE_X)),
          radius * sin( i * PI / (2 * SCALE_X)),
          radius * sin( j * TWO_PI / SCALE_Y) * cos( i * PI / (2 * SCALE_X))
        );
      }
    }
    return edges;
  }

  PShape initShape( PVector[] edges) {
    PShape s = createShape();
    PVector v;
    s.setFill( color( 128, 128));
    s.setStroke( color( 255, 128));
    s.setStrokeWeight( 2);
    s.beginShape( QUADS);
    for( int i = 0; i < SCALE_X-1; ++i) {
      for( int j = 0; j < SCALE_Y; ++j) {
        v = edges[ i*SCALE_Y + j]; vertex( v.x, v.y, v.z);
        v = edges[ i*SCALE_Y + (j+1) % SCALE_Y]; vertex( v.x, v.y, v.z);
        v = edges[ (i+1)*SCALE_Y + (j+1) % SCALE_Y]; vertex( v.x, v.y, v.z);
        v = edges[ (i+1)*SCALE_Y + j]; vertex( v.x, v.y, v.z);
      }
    }
    s.endShape();
    return s;
  }

  void display() {
    shape( this.hs, 0, 0);
  }

}
