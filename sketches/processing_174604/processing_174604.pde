
int eSize; 
int x, y;  
int a;
 
void setup() {
  size(500, 500);
  noStroke();
  smooth();
  fill(0);
  background(0);
  textSize(20);
 
  eSize = 10; 
  x = width/2;
  y = height/2;
}
 
void draw() {
  rect(mouseX, mouseY, eSize, eSize);
}
 
void mousePressed(){  
  eSize = 100;
  stroke(255);
  fill(0,0,0,0);
}
void mouseReleased(){
  eSize=0;
  noStroke();
  fill(255);}

void keyPressed(){
  size(500,500);
  background(0);
  fill(255);
  
  switch(key){
    case'a':
    fill(255,0,0);
  text(key,460,40);
    break;}}
    
  


