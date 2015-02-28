
float angle = 0.0;
 
void setup()
{
   size(500,500);
   smooth();
   rectMode(CENTER);
   background(0,255,0);
}
 
void draw()
{

   pushMatrix(); //add after
     translate(mouseX,mouseY);
     rotate(angle);
     fill(255,0,0);
     stroke(2);
     rect(20,20,20,20,100,100);
   popMatrix(); //add after
    angle += 0.2;
    
    
}

