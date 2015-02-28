
PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

float cometposX  = -50;
float cometposY = 200;
float cometposX2 = 380;
float cometposY2 = 200;

void setup() 
{
  size(500,500);
  img = loadImage("comet.png");
  img2 = loadImage("Ship.png");
  img3 = loadImage("Ship.png");
  img4 = loadImage("earth.png");
  img5 = loadImage("over.png");
}

void draw() {
 background(0);
 image(img4,225,225);
 if (mouseX<251) 
 {
  image(img2,mouseX-50,mouseY-25);
 }
  image(img,cometposX,cometposY);
  cometposX = cometposX + .25;
  image(img,cometposX2,cometposY2);
  cometposX2 = cometposX2 -.25;
  
  if (mouseX>250) 
  {
    image(img3,mouseX-50,mouseY-25);
  }
  
  
  if (mouseX-cometposX<150 && 200-mouseY<1) 
  {
    cometposX = cometposX-50;
  }
   if (cometposX2-mouseX<1 && 200-mouseY<1) 
   {
    cometposX2 = cometposX2+50;
  }

  
  if (cometposX<-100) 
  {
    cometposX = -100;
  }
  
  if (cometposX2>500) 
  {
    cometposX2 = 500;
  }

  
  if (cometposX > 225 || cometposX2 < 275) 
  { 
  image(img5,0,0);
  }
}

