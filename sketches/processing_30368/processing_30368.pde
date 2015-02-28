
float angle = 0.0;
 
void setup()
{
   size(500,500);
   smooth();
   rectMode(CENTER);
}
 
void draw()
{
  // background(200);
  fill(0,255,0);
  ellipse(400, 50, 20,20);
   
   fill(250);
   pushMatrix(); //add after
     translate(mouseX,mouseY);
     rotate(angle);
     rect(0,0,100,50);
   popMatrix(); //add after
    
   fill(255,0,0);
   ellipse(50,50, 20,20); //addafter
    
    
   angle += 0.1;
}



