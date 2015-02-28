
// Oscar Gomez

// call cube class
Cube stage;

PFont fontA;

// cube size
float bounds = 200;

//initiate vibrate
int x,y;

void setup() {
  size(700, 360, P3D);
  
  // load font
  fontA = loadFont("Cambria-Bold-30.vlw");
  textFont(fontA, 20);
  
  // Instantiate the large cube
  stage =  new Cube(bounds, bounds, bounds);
}

void draw(){
  background(0,0,255);
  
  text("\"Pandoras box\" - Oscar\nLeft or Right Click", 10, 310);
  
  if (mousePressed == true) {
    
        // change colors based on left or right click
    	if (mouseButton == LEFT) {
		fill(0);
	}
        if (mouseButton == RIGHT) {
		fill(0,255,0);
	}
        
        // make cube appear to vibrate
	x += random(-10, 10);
	y += random(-10, 10);
        translate(mouseX+x, mouseY-y);
  } else {
	translate(mouseX, mouseY);
        fill(255, 255, 255);
  }
 
  
  // Rotate everything, including external large cube
  rotateX(frameCount * 0.01);
  rotateY(frameCount * 0.01);
  rotateZ(frameCount * 0.001);
  stroke(255, 0, 0);
  
  // Draw cube
  stage.create();

  
}

//main cube
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

    // 6 cube quads
    //front
    vertices[0] = new PVector(-w/2,-h/2,d/2);
    vertices[1] = new PVector(w/2,-h/2,d/2);
    vertices[2] = new PVector(w/2,h/2,d/2);
    vertices[3] = new PVector(-w/2,h/2,d/2);
    //left
    vertices[4] = new PVector(-w/2,-h/2,d/2);
    vertices[5] = new PVector(-w/2,-h/2,-d/2);
    vertices[6] = new PVector(-w/2,h/2,-d/2);
    vertices[7] = new PVector(-w/2,h/2,d/2);
    //right
    vertices[8] = new PVector(w/2,-h/2,d/2);
    vertices[9] = new PVector(w/2,-h/2,-d/2);
    vertices[10] = new PVector(w/2,h/2,-d/2);
    vertices[11] = new PVector(w/2,h/2,d/2);
    //back
    vertices[12] = new PVector(-w/2,-h/2,-d/2); 
    vertices[13] = new PVector(w/2,-h/2,-d/2);
    vertices[14] = new PVector(w/2,h/2,-d/2);
    vertices[15] = new PVector(-w/2,h/2,-d/2);
    //top
    vertices[16] = new PVector(-w/2,-h/2,d/2);
    vertices[17] = new PVector(-w/2,-h/2,-d/2);
    vertices[18] = new PVector(w/2,-h/2,-d/2);
    vertices[19] = new PVector(w/2,-h/2,d/2);
    //bottom
    vertices[20] = new PVector(-w/2,h/2,d/2);
    vertices[21] = new PVector(-w/2,h/2,-d/2);
    vertices[22] = new PVector(w/2,h/2,-d/2);
    vertices[23] = new PVector(w/2,h/2,d/2);
  }
  void create(){
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
      fill(quadBG[i]);
      beginShape(QUADS);
      for (int j=0; j<4; j++){
        vertex(vertices[j+4*i].x, vertices[j+4*i].y, vertices[j+4*i].z);
      }
      endShape();
    }
  }
}

