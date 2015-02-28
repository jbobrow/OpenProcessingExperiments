
//variables for position
int x=50;
int y=50;
 
void setup () {
  println (x);
  size(300,300);
  smooth();
  noStroke();
}
 
void draw () {
  //background(255,226,106);
  x=mouseX;
  y=mouseY;
  
  if (mousePressed==true&&mouseX;>width/2) {
    background(mouseX+40,mouseX+30,mouseX+30);
  }
  
  else if (mousePressed==true&&mouseX;<=width/2) {
    background(mouseY+30,mouseY+100,mouseY+10);
  }
    
  //body
  fill(mouseX,89,173);
  float r=map(mouseX,0,width,0,255);
  float g=map(mouseY,0,height,0,255);
  ellipse(x,y,70,70);
  ellipse(x-20,y-35,15,15);
  ellipse(x+20,y-35,15,15);
  
  //eyes
  fill(255,89,173);
  ellipse(x-10,y-22,5,5);
  ellipse(x+10,y-22,5,5);
  
  //teeth
  fill(255);
  arc(x-5,y-15,10,10,0,PI);
  arc(x+5,y-15,10,10,0,PI);
}
