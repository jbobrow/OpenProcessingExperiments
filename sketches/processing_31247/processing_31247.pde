
float angle = 0.0;
 
void setup()
{
   size(500,500);
   smooth();
   rectMode(CENTER);
   background(240,205,255);
}
 
void draw()
{

   pushMatrix(); //add after
     translate(mouseX,mouseY);
     rotate(angle);
     fill(255,0,0);
     stroke(2);
     ellipse(20, 20, 100, 100);
   popMatrix(); //add after
    angle += 0.5;
    
    
}

