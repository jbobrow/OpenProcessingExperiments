
//Variables:
int mysize =100;
float xpos =350;
float ypos =200;
float theta =100;

void setup(){
  
  size(700,400);
  //background(255);
  smooth();
      
}
 
 
void draw(){
  
 background(0);
  
  noStroke();
 // fill(0,0,225,75);
  ellipse(xpos,ypos,mysize,100);
  
//  stroke(0,0,255);
  stroke(255);
  line(mouseX,mouseY, xpos,ypos);
  
  xpos= xpos + (mouseX - xpos)/30.0;
  ypos = ypos + (mouseY - ypos)/30.0;
  
  translate(xpos,ypos);
  rotate(theta);
   
 theta=theta+dist(mouseX,mouseY,xpos,ypos)/1000+0.01; 
}

 
void mousePressed()
{  
}
 
void mouseMoved()
{
}

