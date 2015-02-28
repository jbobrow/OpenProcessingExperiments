

int x;
int y;
int r;
int g;
int b;

boolean colorchange;
PImage img;

void setup() {
   size(600,600);
   background(50,70,47,70);
   noStroke();
   r=255;
   g=255;
   b=255;
   colorchange = false;
  textSize(15);
  String pc = "Hi guys,lets start drawing!";
  fill(255); 
  text(pc, 50, 60, 90, 80);
  textSize(15);
  String txt = "Press spacebar to start!";
  fill(255); 
  text(pc, 50, 60, 90, 80);
  
  
  
}


void draw()
{
  fill(r,g,b);
  x=mouseX;
  y=mouseY;
  
if(mousePressed == true) {
  noStroke();
     fill(random(255),random(255),random(255),80);
  ellipse(x,y,mouseX,mouseY);
//  if(!colorchange) {

//    r--;
//    g--;
//    b--;
    
  }
  
  if(keyPressed == true)
  {
    if(key == ' ')
    {
      fill(0);
      rect(0,0,600,600);
       textSize(20);
      String pc = "Oops, try again!";
       fill(255); 
  text(pc, 50, 60, 90, 100);
      
    }
  }
//  
//  if(b <=0 || b>=225){
//    colorchange = !colorchange;
    
  }


 
  




