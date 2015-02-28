
int r = 30;
int g = 40;
int b = 190;
int angle = 0;

void setup () {
  size (400,400);
  background (255);
  frameRate (20);
  noStroke ();
  smooth();
}

void draw () {
  float wide = dist(mouseX, mouseY, pmouseX, pmouseY);

  fill (r,g,b,100);

 if (mousePressed) {
  if (mouseButton == LEFT) {
  beginShape();
   curveVertex(mouseX,mouseY);
   curveVertex(mouseX,mouseY);
   curveVertex(mouseX+wide/3,mouseY+wide/2);
   curveVertex (mouseX, mouseY+wide/1.2);
   curveVertex(mouseX-wide/3,mouseY+wide/2);
   curveVertex(mouseX,mouseY);
   curveVertex(mouseX,mouseY);
  endShape();
 
 }
 }
 
  if (keyPressed) {
    if (key == 'r') {
      r=255;
      g=50;
      b=70;
  } if (key == 'y'){
      r=255;
      g=249;
      b=0;
  } if (key == 'b') {
      r=30;
      g=40;
      b=190;
  } if (key == 'w') {
      r=255;
      g=255;
      b=255;     
  } if (key == 'g'){
      r = 30;
      g =160;
      b =40;
  } if (key == 't'){
      r= 0;
      g =0;
      b=0;

 }
  }

 if (keyPressed){
  if(key ==' '){
    background(255);
  }
 }
 if (mousePressed) {
   if (mouseButton == RIGHT){
     background (20,20,20);
   }
 }
 

}

