import saito.objloader.*;

OBJModel model;

float DEG_TO_RAD = 3.14 / 180;

void setup() {
  size( int( displayWidth*0.85), int( displayHeight*0.85), P3D);
  smooth();

  model = new OBJModel(this, "hemiSphere_smooth.obj", TRIANGLES);
  noStroke();
}

void draw() {
  background( 192, 128);

  pointLight(255, 255, 255, 0, 10, 50);
  lights();

  translate( width/2, height/2, 0);
  
  rotateX(QUARTER_PI/8);
  rotateY(  QUARTER_PI/6 * millis() / 500);
  
  scale( 10.0);

  pushMatrix();
    rotateZ(-45 * DEG_TO_RAD);
    model.draw();
  popMatrix();
  pushMatrix();
    rotateZ(45 * DEG_TO_RAD);
    model.scale(1, -1, 1);
    model.draw();
    model.scale(1, -1, 1);
  popMatrix();
}
