
void setup() {
  size(500, 375);
smooth();
}

float a;
float d=5;
float r=0;
float b=320;
float c=150;

void mouseMoved() {
  if((mouseX-pmouseX)>0) {
  r=mouseX-pmouseX;
}
  else{
    r=pmouseX-mouseX;
  }
}

void raindrop() {
  fill(#CAE1FF);
  if(d>390) {
    d=0;
    a=random(10, 200);
  }
  else {
    d=d+r+r+2;
  }
  ellipse(a, d, 20, 30);
}

void drainpipe() {
  PImage img;
  img=loadImage("Drain pipe.jpg");
  image(img, 0, 0);
}

void spider(){
 fill(0);
 ellipse(b, c, 20, 15);
 if(c<-5) {
   c=155;
 }
 else {
   c=c-r;
 }
 noFill();
 strokeWeight(3);
 stroke(0);
 arc(b-13, c+5, 10, 10, PI, TWO_PI);
 arc(b+13, c+5, 10, 10, PI, TWO_PI);
 arc(b-15, c, 10, 10, PI+.7, TWO_PI+.7);
 arc(b+15, c, 10, 10, PI-.7, TWO_PI-.7);
 arc(b-12, c-5, 12, 10, PI+1.2, TWO_PI+1.5);
 arc(b+12, c-5, 12, 10, PI-1.5, TWO_PI-1.2);
}

void strng(){
  if (mousePressed==true){
    if(mouseX<340&&mouseX>300&&mouseY<160){
   b=mouseX;
   c=mouseY+200;
   stroke(#EED2EE);
   strokeWeight(1);
   line(b, mouseY, b, c);
 }
 else{
   b=320;
   c=150;
 }
  }
}

void draw() {
  background(#CDCDB4);
  drainpipe();
  raindrop();
  spider();
  strng();
}



