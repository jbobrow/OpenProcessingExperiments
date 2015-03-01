
PImage maxi;
PImage maxizunge;
PImage cursor;


void setup()
{
  size (600,500);
 
maxi = loadImage ("maxi.jpg");
 mouseCursor = loadImage ("fliege.png");
  maxizunge = loadImage ("maxizunge.png");
 // background (0);
  //image (maxi,0,0);

  //mouseCursor = loadImage("fliege.png");
}

void draw()

{ 
  
background (0);
 image (maxi,0,0);
 if (mouseX >= 127 && mouseX <=280 &&mouseY >= 225 && mouseY<=300)
{
  image (maxizunge,0,0);
}
 image (mouseCursor,mouseX,mouseY);


pushMatrix();
translate(127,225);
noFill();
noStroke();
rect(0,0,163,100);
popMatrix();


}

  


