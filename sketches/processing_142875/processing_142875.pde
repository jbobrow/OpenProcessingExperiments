
int l = 50;
int w = 50;
int x1 = 150;
int y1 = 150;
int x2 = 200;
int x3 = 250;
int y2 = 200;
int y3 = 250;
int x;
int y;


void setup(){
  size(400, 400);
  background(255);
  smooth();
  
  x = x1;
  y= y1;
}

void draw(){
  background(255);
  
  strokeWeight(5);
  stroke(0);
  
  if(mouseX > x){ //|| (mouseX< x +w){
  
  if (mousePressed){
    x1 = mouseX; //if mouse is pressed, then the rectangle will follow the mouse
  }
  }
  
  
  if(mouseY > y){ //|| (mouseY < y + l){
  if(mousePressed){
    y1 = mouseY;
  }
  }
  
  rect(x1, y1, l, w);//black rectangle
  
  stroke(255);
  fill(255);
  rect(x2,y2,l,w); //invisible square
 

}



