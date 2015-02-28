
float radius;



void setup()
 { 
  size(400, 600);
   background(255, 255, 255);
   smooth();
   frameRate(10); 

} 


 
 
void draw() 
{ 
  smooth();
  fill(193,114,39);
  triangle(175,height-30,width/2,height,width-175,height-30);
 rect(175,height-53,50,23);
  if(mousePressed)
  {
  fill(random(255),random(255),random(255));
 ellipse(mouseX,mouseY,radius,radius);
  radius=40;
  if(key=='s')
  {
   radius=radius+10;
    
  }
  }
  smooth();
  textAlign(CENTER);
  text("Fill the ice cream cone, left-click to place ice cream",200,100);
  text("press 's' to place bigger sizes",200,120);
  
}
 
 
 

