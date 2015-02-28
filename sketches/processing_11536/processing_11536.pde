
/* Calligraphy, for people with trackpads or general bad handwriting
Hybrid Visuals 2010
*/

//declare variables
float x, y, xD, yD, xVel, yVel,xOld, yOld, w, wOld, fade;
float spring = 0.01;
float damp = 0.95;

void setup(){
  size(1280,720);
  background(#FFFFFF);
  smooth();
}

void draw(){
//pass on previous position and line width
  xOld = x;
  yOld = y;
  wOld = w;
  
//calculate distance and springing  
  xD = (mouseX - x) * spring;
  yD = (mouseY - y) * spring;
  
//calculate velocity and damping
  xVel = (xVel + xD) * damp;
  yVel = (yVel + yD) * damp;
 
//calculate position; 
  x+=xVel;
  y+=yVel;
  
//only draw on mousedown, overall this part has some ugly code but it works 
  if(mousePressed == true){
    //fade in the line opacity
    fade+=5;
    fade=min(fade,100);
    //fade in the line width
    w+=0.5;
    w=min(w,xVel*fade/50); //should probably be based on window size to be fully dynamic
  }
  else{
    //fade out the line opacity
    fade-=3;
    fade=max(fade,0);
    //fade out the line width
    w=xVel*fade/50;
  }
  
  //draw the line
  fill(0,fade-50);
  noStroke();
  quad(xOld-wOld, yOld, x-w, y, x+w, y, xOld+wOld, yOld);
  
  //draw the outline
  stroke(0,fade);
  line(xOld-wOld, yOld, x-w, y);
  line(xOld+wOld, yOld, x+w, y);
  
  //clear on any key
  if(keyPressed == true){
    background(255);
  }
  
}

