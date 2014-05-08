
HalfSphere hs;

void setup() {
  size( int( displayWidth*0.85), int( displayHeight*0.85), P3D);
  // frame.removeNotify();
  // frame.setUndecorated( true);
  hs = new HalfSphere( 50.0);
}

void draw() {
  background( 192, 128);
  translate( width/2, height/2, 0);
  hs.display();
}
