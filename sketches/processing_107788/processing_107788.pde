
Star[] stars = new Star[2000];
float z = 0;

void setup() {
  size(800, 800, P3D);
  
  for(int i=0; i<stars.length; i++) {
   
    stars[i] = new Star(random(-width, width), random(-width, width), random(-width, width)); 
  }
}

void draw() {
 //background(300); // LIGHT GREY
 background(20); // DARK GREY
 //background(#FF7BAC); // PINK
 //background(#3599BC); // Blue-ish
 //background(#FBB03B); // Orange
 //noCursor();
 
 // CAMERA //
  float mX = map(mouseX, 0, width, 100, width*2);
  camera(0, 0, mX, 0, 0, 0, 0, 1, 0);
 
 // SCENE CENTER TEST //
 /*pushMatrix();
 translate(0, 0, 0);
 fill(#FFFFFF);
 sphere(40);
 sphereDetail(10);
 popMatrix();*/

 
 // ROTATE //
 //float Y = map(mouseY, 0, height, -0.5, 0.5);
 //float X = map(mouseX, 0, width, -0.5, 0.5);
 //rotateX(Y);
 rotateY(z);
 rotateZ(z);
 z = z + 0.001;
 
 // TRANSLATE //
 //translate(mouseX, mouseY); // HORIZONTAL & VERTICAL
 //translate(mouseX, 0); // HORIZONTAL ONLY
   for(int i=0; i<stars.length; i++) {
    stars[i].fly(0); 
   }
}

// FULLSCREEN PLAY //
/*boolean sketchFullScreen() {
  return true;
}*/

class Star {
 float x;
 float y;
 float z;
 float s = random(2, 10);
 
 Star(float starX, float starY, float starZ) {
 x = starX;
 y = starY;
 z = starZ; 
 }
 
 void fly(int speed) {
   x = x - speed;
   y = y - speed;
     
   pushMatrix();
   translate(x, y , z);
   noSmooth();
   
   fill(255);
   
   noStroke();
   
     // BOX //
   //box(10);
   box(s);
   
     // SPHERE //
   //sphere(4);
   //sphereDetail(10);
   
   popMatrix();
 }
}

