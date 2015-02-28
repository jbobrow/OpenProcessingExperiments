


void setup(){
size(500,500);
background(0);
smooth();
}
int x= -1;
int y=-1;
void draw(){
  if(x != -1 && y != -1){
  triangle(x,y,x+10,y-10,x+10,y+10);
  }
}

void mouseMoved(){
   x= mouseX;
   y= mouseY;
   int colorR = (int) random(0,255);
   int colorG = (int) random(0,255);
   int colorB = (int) random(0,255);
   noStroke();
  fill(colorR,colorG,colorB);
  
  
  

}

