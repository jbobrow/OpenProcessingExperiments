
float katsinusa=random(80);


void setup()
{
  size(400, 400);  
  background(0);
  fill(200);
  noStroke();
  frameRate(25);
}

void draw()
{
  katsinusa+=0.2;
  background(0);

  ellipse(width-frameCount*2, 


  height/2-(

  sin ( katsinusa ) * 60 
    +  
    sin ( katsinusa/2 ) * 40 
    +
    cos ( katsinusa/4 ) * 80

    )
    , 40, 20);
}

