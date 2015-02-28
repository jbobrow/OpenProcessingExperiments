

float f=1/1.618033989; //value of golden ratio
float fAng; //golden ratio angle off inside circle
float radius = 7; //radius of inside circle
float rgrowth= 1.005; 
float c= 0;
float rotate = 0;
float x,y;
float w = 5;
float h = 5;


 
void setup() {
  size(1600,900);
  background(0);
  smooth();
  noFill();
  colorMode(HSB);
  strokeWeight(1);
  

  fAng = 360-360 * f + 0;


}
 
void draw() {
  c++;
  rotate +=fAng;
  rotate -= int(rotate/360) * 360;
  radius *= rgrowth;
  stroke(f*c/3,f*c/3,f*c/3);
  x = cos(rotate * PI/180) * radius + width/2;
  y = sin(rotate * PI/180) * radius + height/2;
  ellipse(x,y,w,h);
   
  w+=f/10;
  h+=f/10;
}


