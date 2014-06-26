class SplicedSphere {

  final int URES = 12;  // Number of segments used longitudinally, per full circle revolution
  
  final int VRES = 24;  // Number of segments used latitudinally, from top to bottom   
  
  float radius;         // Radius of the sphere
  float start;          // Angle to start the splices (in radians)
  float stop;           // Angle to stop the splices (in radians)

  PVector[][] vertices;
  PShape sp;
  
  SplicedSphere( float radius, float start, float stop) {
    this.radius = radius;
    this.start = start;
    this.stop = stop;
    this.vertices = createSplices();
    this.sp = createSphere( start, stop);
  }

  PVector[][] createSplices() {
    return null;
  }

  PShape createSphere( float start, float stop) {
    return null;
  }

}
