import codeanticode.syphon.*;

SyphonServer server;
HalfSphere hs;

void setup() {
  // size( int( displayWidth*0.85), int( displayHeight*0.85), P3D);
  size( displayWidth, displayHeight, P3D);
  smooth();
  // frame.removeNotify();
  // frame.setUndecorated( true);
  noStroke(); 
  hs = new HalfSphere( 50.0); 

  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
}

void draw() {
  background( 0);
  directionalLight( 255, 255, 255, -1, -1, -1);
  
  translate( width/2, height/2, 0);
  rotateX( -QUARTER_PI/3);
  rotateY(  QUARTER_PI/6 * millis() / 500);
  rotateZ( -QUARTER_PI/9);
  scale( 4.0);

  hs.display();
  scale( -0.99999);
  rotateZ( QUARTER_PI / 3 * 2 * (1 + sin( millis() / 80.0)));
  hs.display();
  server.sendScreen();
}
