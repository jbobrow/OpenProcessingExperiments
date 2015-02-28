
Tetris[] tetris = new Tetris[300];

void setup() {
  size(800, 800, P3D);
  
  for(int i=0; i<tetris.length; i++) {
    
    // TESTING //
    tetris[i] = new Tetris(random(-width, width), random(-width, width), random(-width, width)); 
  }
}

void draw() {
  
  background(0);  
  fill(0);
  stroke(255);
  
  if (key == 'a') {
  background(0);
  fill(0);
  stroke(255);
}
if (key == 'q') {
  background(255);
  fill(255);
  stroke(0);
}
  
  //float mX = map(mouseX, 0, width, 100, 2000);
  //camera(0, 0, mX, 0, 0, 0, 0, 1, 0);
  camera(0, 0, 1000, 0, 0, 0, 0, 1, 0);
  
  float mmX = map(mouseX, 0, width, -1, 1);
  float mmY = map(mouseY, 0, height, -1, 1);
  rotateX(mmY);
  rotateY(mmX);
  
  /*pushMatrix();
 translate(0, 0, 0);
 fill(#FFFFFF);
 sphere(40);
 sphereDetail(10);
 popMatrix();*/
  
  for(int i=0; i<tetris.length; i++) {

    tetris[i].be(50); 
   }  
}

// KEY PERSPECTIVE //
void keyReleased(){
if (key == 'o') {
  ortho();
}
if (key == 'p') {
  perspective();
}
}
float clock = 0;
int shape;





class Tetris {
 float x;
 float y;
 float z;
 
 Tetris(float tetrisX, float tetrisY, float tetrisZ) {
 x = tetrisX;
 y = tetrisY;
 z = tetrisZ; 
 }
 
 void be(int tick) {
      
   pushMatrix();
   translate(x, y , z);
   noSmooth();

   //fill(0);
   scale(10);
   //stroke(255);
   
   if(clock > tick){
   int rand = int(random(5));
   shape = rand;
   clock = 0;
  }
  
  clock += 0.01;
   
    // I //                // I //
if(shape == 0) {
box(1, 4, 1);
}


    // L //                // L //
if(shape == 1) {
  beginShape();

  // RECTANGLE TOP //
  beginShape();
  vertex(0, 1, 0);
  vertex(2, 1, 0);
  vertex(2, 1, 1);
  vertex(0, 1, 1);
  endShape(CLOSE);

  // RECTANGLE BOTTOM //
  beginShape();
  vertex(0, 0, 0);
  vertex(3, 0, 0);
  vertex(3, 0, 1);
  vertex(0, 0, 1);
  endShape(CLOSE);

  // L FRONT //
  beginShape();
  vertex(0, 0, 1);
  vertex(3, 0, 1);
  vertex(3, 2, 1);
  vertex(2, 2, 1);
  vertex(2, 1, 1);
  vertex(0, 1, 1);
  endShape(CLOSE);

  // L BACK //
  beginShape();
  vertex(0, 0, 0);
  vertex(3, 0, 0);
  vertex(3, 2, 0);
  vertex(2, 2, 0);
  vertex(2, 1, 0);
  vertex(0, 1, 0);
  endShape(CLOSE);

  // SQUARE LEFT //
  beginShape();
  vertex(0, 0, 0);
  vertex(0, 0, 1);
  vertex(0, 1, 1);
  vertex(0, 1, 0);
  endShape(CLOSE);

  // SQUARE LEFT BOTTOM //
  beginShape();
  vertex(2, 1, 0);
  vertex(2, 1, 1);
  vertex(2, 2, 1);
  vertex(2, 2, 0);
  endShape(CLOSE);

  // SQUARE BOTTOM //
  beginShape();
  vertex(3, 2, 0);
  vertex(3, 2, 1);
  vertex(2, 2, 1);
  vertex(2, 2, 0);
  endShape(CLOSE);

  // RECTANGLE RIGHT //
  beginShape();
  vertex(3, 0, 0);
  vertex(3, 2, 0);
  vertex(3, 2, 1);
  vertex(3, 0, 1);
  endShape(CLOSE);

  endShape();
}


    // O //                // O //
   if(shape == 2) {
   box(2, 2, 1);
   }
   
   
    // T //                // T //
   if(shape == 3) {  
     beginShape();

  // SQUARE TOP RIGHT //
  beginShape();
  vertex(2, 1, 0);
  vertex(3, 1, 0);
  vertex(3, 1, 1);
  vertex(2, 1, 1);
  endShape(CLOSE);
  
  // SQUARE TOP MIDDLE //
  beginShape();
  vertex(1, 0, 0);
  vertex(2, 0, 0);
  vertex(2, 0, 1);
  vertex(1, 0, 1);
  endShape(CLOSE);
  
  // SQUARE TOP LEFT //
  beginShape();
  vertex(0, 1, 0);
  vertex(1, 1, 0);
  vertex(1, 1, 1);
  vertex(0, 1, 1);
  endShape(CLOSE);

  // T FRONT // 
  beginShape();
  vertex(0, 1, 0);
  vertex(1, 1, 0);
  vertex(1, 0, 0);
  vertex(2, 0, 0);
  vertex(2, 1, 0);
  vertex(3, 1, 0);
  vertex(3, 2, 0);
  vertex(0, 2, 0);
  endShape(CLOSE);

  // T BACK //
  beginShape();
  vertex(0, 1, 1);
  vertex(1, 1, 1);
  vertex(1, 0, 1);
  vertex(2, 0, 1);
  vertex(2, 1, 1);
  vertex(3, 1, 1);
  vertex(3, 2, 1);
  vertex(0, 2, 1);
  endShape(CLOSE);
  
  // SQUARE LEFT 1 //
  beginShape();
  vertex(1, 0, 0);
  vertex(1, 0, 1);
  vertex(1, 1, 1);
  vertex(1, 1, 0);
  endShape(CLOSE);
  
  // SQUARE LEFT 2 //
  beginShape();
  vertex(0, 1, 0);
  vertex(0, 1, 1);
  vertex(0, 2, 1);
  vertex(0, 2, 0);
  endShape(CLOSE);
  
  // SQUARE RIGHT 1 //
  beginShape();
  vertex(2, 0, 0);
  vertex(2, 0, 1);
  vertex(2, 1, 1);
  vertex(2, 1, 0);
  endShape(CLOSE);
  
  // SQUARE RIGHT 2 //
  beginShape();
  vertex(3, 1, 0);
  vertex(3, 1, 1);
  vertex(3, 2, 1);
  vertex(3, 2, 0);
  endShape(CLOSE);

  // RECTANGLE BOTTOM //
  beginShape();
  vertex(0, 2, 0);
  vertex(3, 2, 0);
  vertex(3, 2, 1);
  vertex(0, 2, 1);
  endShape(CLOSE);

  endShape(); 
   }
   
   
     // Z //                // Z //
   if(shape == 4) { 
    beginShape();

  // RECTANGLE TOP //
  beginShape();
  vertex(0, 0, 0);
  vertex(2, 0, 0);
  vertex(2, 0, 1);
  vertex(0, 0, 1);
  endShape(CLOSE);

  // RECTANGLE BOTTOM //
  beginShape();
  vertex(1, 2, 0);
  vertex(3, 2, 0);
  vertex(3, 2, 1);
  vertex(1, 2, 1);
  endShape(CLOSE);
  
  // SQUARE TOP //
  beginShape();
  vertex(2, 1, 0);
  vertex(3, 1, 0);
  vertex(3, 1, 1);
  vertex(2, 1, 1);
  endShape(CLOSE);
  
  // SQUARE BOTTOM //
  beginShape();
  vertex(0, 1, 0);
  vertex(1, 1, 0);
  vertex(1, 1, 1);
  vertex(0, 1, 1);
  endShape(CLOSE);

  // Z FRONT //
  beginShape();
  vertex(0, 0, 1);
  vertex(2, 0, 1);
  vertex(2, 1, 1);
  vertex(3, 1, 1);
  vertex(3, 2, 1);
  vertex(1, 2, 1);
  vertex(1, 1, 1);
  vertex(0, 1, 1);
  endShape(CLOSE);

  // Z BACK //
  beginShape();
  vertex(0, 0, 0);
  vertex(2, 0, 0);
  vertex(2, 1, 0);
  vertex(3, 1, 0);
  vertex(3, 2, 0);
  vertex(1, 2, 0);
  vertex(1, 1, 0);
  vertex(0, 1, 0);
  endShape(CLOSE);

  // SQUARE LEFT TOP //
  beginShape();
  vertex(0, 0, 0);
  vertex(0, 0, 1);
  vertex(0, 1, 1);
  vertex(0, 1, 0);
  endShape(CLOSE);

  // SQUARE LEFT BOTTOM //
  beginShape();
  vertex(1, 1, 0);
  vertex(1, 1, 1);
  vertex(1, 2, 1);
  vertex(1, 2, 0);
  endShape(CLOSE);

  // SQUARE RIGHT TOP //
  beginShape();
  vertex(2, 0, 0);
  vertex(2, 0, 1);
  vertex(2, 1, 1);
  vertex(2, 1, 0);
  endShape(CLOSE);

  // SQUARE RIGHT BOTTOM //
  beginShape();
  vertex(3, 1, 0);
  vertex(3, 1, 1);
  vertex(3, 2, 1);
  vertex(3, 2, 0);
  endShape(CLOSE);

  endShape();
   } 
   
   
   popMatrix();
 }
}

