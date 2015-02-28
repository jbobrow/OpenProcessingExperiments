

// Custom Cube Class

class Cube{
  PVector[] vertices = new PVector[24];
  float w, h, d;

  // Default constructor
  Cube(){ }

  // Constructor 2
  Cube(float w, float h, float d) {
   
    this.w = w;
    this.h = h;
    this.d = d;

    // cube composed of 6 quads
    //front
    vertices[0] = new PVector();
    vertices[1] = new PVector();
    vertices[2] = new PVector();
    vertices[3] = new PVector();

    //left
    vertices[4] = new PVector(random(50),random(60),random(70));
    vertices[5] = new PVector(-w/2,0,-d/2);
    vertices[6] = new PVector(PI*mouseY/width,h/2,-d/2);
    vertices[7] = new PVector(10,10,10);
    //right
    vertices[8] = new PVector(PI*mouseY/width,PI*mouseX/height,d/2);
    vertices[9] = new PVector(w/2,0,-d/2);
    vertices[10] = new PVector(w/2,0,-d/2);
    vertices[11] = new PVector(random(70),random(60),random(50));
    //back
    vertices[12] = new PVector(PI*mouseY/width,PI*mouseX/height,d/2); 
    vertices[13] = new PVector();
    vertices[14] = new PVector(w/2,0,-PI*mouseY/width);
    vertices[15] = new PVector(-w/2,0,-d/2);
    //top
    vertices[16] = new PVector();
    vertices[17] = new PVector();
    vertices[18] = new PVector();
    vertices[19] = new PVector();
   
    //bottom
    vertices[20] = new PVector();
    vertices[21] = new PVector();
    vertices[22] = new PVector();
    vertices[23] = new PVector();
  }
  void create(){
    noStroke();
    // Draw cube
    for (int i=0; i<6; i++){
      beginShape(QUADS);
      for (int j=0; j<4; j++){
        vertex(vertices[j+4*i].x, vertices[j+4*i].y, vertices[j+4*i].z);
      }
      endShape();
    }
  }
  void create(color[]quadBG){
    // Draw cube
    for (int i=0; i<6; i++){
      beginShape(QUADS);
      for (int j=0; j<4; j++){
        vertex(vertices[j+4*i].x, vertices[j+4*i].y, vertices[j+4*i].z);
      }
      endShape();
    }
  }
}



