
/**
 * Magic cube class
 * Arrived at by several iterations of manipulations to Ira's code
 * and with the assistance of an interactive TRIANGLE_STRIP testing
 * sketch written to determine a workable vertex ordering.
 */

class Cube {
  float w, h, d;

  // subpixel's magic vertex order
  private int[] spxlMagicOrder = new int[] {0,1,3,5,7,6,3,2,0,6,4,5,0,1};

  Cube(){ }

  Cube(float w, float h, float d){
    this.w = w;
    this.h = h;
    this.d = d;
  }

  void create(){
    pushMatrix();
    scale(w,h,d);
    translate(-0.5f,-0.5f,-0.5f);
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<spxlMagicOrder.length; i++){
      int v = spxlMagicOrder[i];
      vertex(v&1, (v>>1)&1, v>>2); // subpixel's magic vertex!
    }
    endShape();
    popMatrix();
  }
} 

