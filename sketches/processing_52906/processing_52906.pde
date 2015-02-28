
float angle = 0.0;
void setup()
{
   size(500,500);
   smooth();
}
void draw()
{
   background(50);
   //Draw the references lines...
   noFill(); stroke(255);
   line(width/2,0, width/2,height);
   line(0,height/2, width, height/2);
   ellipse(width/2,height/2, 200,200);
    
   //Translate the coordinate system to the center
   translate(width/2,height/2);
   //Calculate the sin and cos values. Scale them up.
   float x = cos(angle) * 100;
   float y = sin(angle) * 100;
    
   //Use them to position 3 ellipses.
   fill(255);
   ellipse(x, 0, 20,20);
   ellipse(0, y, 20,20);
    
   fill(255,0,0);
   ellipse(x,y,  20,20);
    
   //Increment the angle by a bit each frame
   angle += 0.08;
}



