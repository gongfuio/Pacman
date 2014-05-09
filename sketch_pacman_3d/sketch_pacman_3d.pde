
HalfSphere hs;

void setup() {
  size( int( displayWidth*0.85), int( displayHeight*0.85), P3D);
  smooth();
  lights();

  // frame.removeNotify();
  // frame.setUndecorated( true);
  hs = new HalfSphere( 50.0);  
}

void draw() {
  background( 192, 128);
  translate( width/2, height/2, 0);
  rotateX( -QUARTER_PI/3);
  rotateY(  QUARTER_PI/6 * millis() / 500);
  rotateZ( -QUARTER_PI/9);
  hs.display();
}