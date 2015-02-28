
//Created By Stephen Wang
//Modified based on Riley Galloway's Laser Draw
//Credit to Riley Galloway
//http://www.openprocessing.org/visuals/?visualID=1915

float[][] a=new float[40][2];

void setup() { 
  size(400,400); 
  background(random(0,255),random(0,255),random(0,255),30); 
} 
 
void draw() { 
  lines(mouseX, mouseY, pmouseX, pmouseY); 
} 
 
void lines(int x, int y, int px, int py) { 
  if (mousePressed == true) { 
    stroke(random(0,255),random(0,255),random(0,255),20); 
    line(0,y,x,y); 
    line(x,0,x,y);
  }
  else if(mousePressed == true) { 
    stroke(random(0,255),random(0,255),random(0,255),20); 
    line(0,y,x,y); 
    line(0,0,x,y);
  }
   else {
    stroke(random(0,255),random(0,255),random(0,255),5); 
    line(0,0,x,y);
    line(400,0,x,y);
    line(0,400,x,y);
    line(400,400,x,y);
   
  } 
} 


