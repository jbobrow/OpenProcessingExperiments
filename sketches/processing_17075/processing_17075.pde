
float a=0;

void setup(){
  
  size(600,600);
  smooth();
  background(0);
  
}
  
  
void draw(){
  
  noStroke();
  while(a<=50){
  fill(255,0,0,random(20));
  rectMode(CENTER);
  rect(width/2, height/2, random(0,500), random(0,500));
  a = a+1;
  
}}


