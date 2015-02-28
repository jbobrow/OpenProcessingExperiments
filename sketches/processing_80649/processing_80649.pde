
//Scribble by Evan White
import safari.javascript.*;
int x[];
int y[];
int pos=5;
int ellmove= 0;
void setup(){
  background(255);
  size(450,337);
  smooth();
  img= loadImage("18.jpg");
  noStroke();
  x= new int[pos];
  y=new int[pos];
   image(img,0,0);

}
void draw(){
for(int i=0; i<pos;i++){
fill(255);
stroke(0);
line(x[ellmove],y[ellmove],x[i],y[i]);
PImage img; 
}}
void mouseMoved(){
  x[ellmove]=mouseX;
  y[ellmove]=mouseY;
  ellmove++;
if(ellmove>=pos){
  ellmove=0;
}}
void keyPressed(){
  if(key==32){
    background(255);
    image(img,0,0);
  }}
PImage img; 


