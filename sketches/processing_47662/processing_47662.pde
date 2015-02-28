
void setup() {
size(640,480);
smooth();
}

PImage img02;
  
void draw() {
  frameRate (15);
   
background(#ffffff);

  smooth();
  img02 = loadImage("sailormoonyay.jpg");
  image(img02, 0, 0);
 
//liness
 
for (int y=105; y<1000; y=y+1){
  float b = random(50);
  float a = 10;
  stroke(random(670),random(70),random(80),15);
  strokeWeight(a/b);
  line(5,100+y+b,350,70);}
 
}


