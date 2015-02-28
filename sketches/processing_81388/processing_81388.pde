
PImage img;

void setup(){
size(363,242);
background(255);
  
img = loadImage("food.jpg");
}
void draw(){
  image (img,0,0);
  for(int g=0;g<400;g++)
  Squares(g*400, 400,5);
}//parameters 1 and 2 and 3 
void Squares(float rx, float ry, float rz) 
 
{
  frameRate(300);
  if(mousePressed){  
  float w=random(rx);
  float x=random(ry);
  float z=random(rz);
    float s1 = dist(mouseX,mouseY, pmouseX,pmouseY) + 3;
      float s2 = dist(mouseX,mouseY, pmouseX,pmouseY) + 2;
  float t=random(200);
  float u=random(255);
  float v=random(155);
  noStroke();
  fill(t,u,v,t);
  strokeWeight(z);
  stroke(t,u,v);
  for(int a=0;a<20;a++){
  rect(w+a,x-a, s1, s2);}
  }}
  
  //got code from openprocessing.org falling particles
  //what i changed was the size of the shapes, the colour, the speed, the direction, and how far the shapes extend to

