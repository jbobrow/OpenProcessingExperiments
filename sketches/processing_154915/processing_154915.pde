
int x;
//make sure you clik the mouse it will change the color to a random color!!
void setup(){
  size(500,400);
 background(255,0,0);
x=100; 
}
void draw(){
  if(mousePressed){
  fill(random(255),random(255),random(255));
  }
if(x<height/2){
triangle(width/2,height/2,mouseX,300,mouseX,mouseY);
}  
}
