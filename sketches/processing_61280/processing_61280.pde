
void setup(){
size(400,400);
smooth();
rectMode(CENTER);
}
 
void draw(){
  background(0);
  
  
for(int i = 60; i < 360; i = i + 25){
for(int j = 60; j < 360; j = j +25){
  
  fill(255);
  stroke(0);
  
 rect(i, j, 20, 20);
 
}}}
