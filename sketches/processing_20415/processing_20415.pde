
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

void setup(){
  size (640, 480, P3D);
  smooth();
  background (255);
    
img1=loadImage("gigapudding.jpg");
img2=loadImage("awesomeface.jpg");
img3=loadImage("ducreux.jpg");
img4=loadImage("ceilingcat.jpg");
img5=loadImage("advicedog.jpg");
}

  
 
void draw() {

  

  stroke(0);
   float a= (random(0, 640));
 float b= (random(0, 480));
 float c= (random(0, 640));
 float d= (random(0, 480));
 float e= (random(0, 640));
 float f= (random(0, 480));
 float g= (random(0, 640));
 float h= (random(0, 480));
 float i= (random(0, 640));
 float j= (random(0, 480));
 float k= (random(0, 640));
 float l= (random(0, 480));
 
 
if (mousePressed==true){
  
 int r = int(random(5));

if (r==0) {
   image(img1, 0, 0, width, height);
} 
if (r==1) {
   image(img2, 0, 0, width, height);
} 
if (r==2) {
   image(img3, 0, 0, width, height);
} 
if (r==3) {
   image(img4, 0, 0, width, height);
} 
if (r==4) {
   image(img5, 0, 0, width, height);
} 


 beginShape ();
fill (255);
  vertex (a, b);
  vertex (c, d);
  vertex (e, f);
vertex (g, h);
vertex (i, j);
vertex (k, l);
 vertex (a, b);
  endShape();
}
  
  }

