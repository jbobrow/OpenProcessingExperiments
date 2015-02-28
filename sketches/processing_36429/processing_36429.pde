
int mysize = 100;
int xpos = 350;
int ypos = 200;
float theta = 0;

void setup(){

size (700,400);
background (239,236,205);
  
  noFill();
  
  
}





void draw ()
{
   float haha=random(255);
 float hehe=random(80);

 if (mousePressed ==true ) {
  stroke(0);
  stroke (0,20);
   pushMatrix();
  translate (xpos,ypos);
  rotate (theta);
  rect (-mouseX/10,-mouseY/10,hehe,hehe);
  fill(haha,random(mouseX/5,mouseY/5),random(mouseX/5,mouseY/5),15);
  smooth();
 }
 if (mousePressed && (mouseButton == LEFT)) {
    fill (239,236,205);
    noStroke();
    rect (-50,-50,hehe,hehe);
  

  

  popMatrix();
 theta = theta + dist(mouseX,mouseY,xpos,ypos)/1000.0 + 0.01;
 xpos = mouseX;
 ypos = mouseY;
 }
}
void mousePressed() {

  
}

void mouseMoved() {
  

 
  
}
                
                
