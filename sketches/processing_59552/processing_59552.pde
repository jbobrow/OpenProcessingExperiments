
float angle;
float grow = -15;
PImage masker;
  
void setup()
{
  masker = loadImage("mask.png");
  imageMode(CENTER);
  
  size(294,198);
  noFill();
  //ellipseMode(CENTER);
  stroke(255);
  strokeWeight(0.75);
  smooth();
}


void draw()
{
  background(141,198,63);
  image(masker, width/2,height/2);

// float x = cos(angle) * 100;
// float y = sin(angle) * 100;
 angle = grow;

  for (int i=0; i<24; i++)
  {
    pushMatrix(); 
    translate(width/2, height/2);
    rotate(radians(angle));
    triangle(30, 0, 0, 100, 0, -100);
    popMatrix();
    
    angle -= 15;
  }
  
  grow -= 0.3;
}

