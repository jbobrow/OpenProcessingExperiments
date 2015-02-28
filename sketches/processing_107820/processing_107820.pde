
Star[] stars = new Star[2000];
//Star[] stars = new Star[1000];
float x = 0;
float y = 0;


void setup() {
  size(800, 800, P3D);
  background(255);
  
  for(int i=0; i<stars.length; i++) {
    //stars[i] = new Star(random(-1600, 1600), random(-1600, 1600), random(-1600, 0)); 
    
// LARGE SPAWN ZONE //
    //stars[i] = new Star(random(-(width*2), (width*2)), random(-(height*2), (height*2)), random(-(height*2), 0)); 
// SMALL SPAWN ZONE //
    stars[i] = new Star(random(-width, width), random(-height, height), random(-height, 0)); 
  }
}

void draw() {
 noCursor();
 
 // CAMERA //
 //camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, -800, 0, 1, 0);
 camera(width/2, height/2, (height/2) / tan(PI/6), width/2, height/2, -800, 0, 1, 0);
 //camera(x, y, (height/2) / tan(PI/6), width/2, height/2, -800, 0, 1, 0);
 
 // ROTATE //
 rotateX(y);
 rotateY(x);
 x = x + 0.005;
 y = y + 0.002; 
 
 //translate(mouseX, mouseY); // HORIZONTAL & VERTICAL
 //translate(mouseX, 0); // HORIZONTAL ONLY
   for(int i=0; i<stars.length; i++) {
    stars[i].fly(0); 
   }
}

/*
// FULLSCREEN PLAY //
boolean sketchFullScreen() {
  return true;
} */


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
   colorMode(HSB, 360, 100, 100, 100);
   
   // DEPTH IS HUE //
   //float k = map(z, -height, 0, 0, 360);
   // manual color pick //
   float k = map(z, -height, 0, 0, 160);
   fill(k, 100, 100, 100);
   
   // WIDTH IS BRIGHTNESS //
   float w = map(x, 0, width, 50, 100);
   fill(k, 100, w, 100);
   
   // DEPTH IS ALPHA //
   //float c = map(z, -1600, 0, 20, 100);
   //fill(0, 0, 100, c);
   
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

