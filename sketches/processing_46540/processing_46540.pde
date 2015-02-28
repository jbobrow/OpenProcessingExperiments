
void setup()
    {
    size(500,500);
    smooth ();
    }
   //set up things that you would only want to input once

void draw()
    {
    fill(0,0,0,10);
    rect(0,0,width,height)
    ellipse(random(0,500), random(0,500), random(10,50), random(10,50));
    }

