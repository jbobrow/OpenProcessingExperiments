
PImage img;
PImage currentTop;
PImage currentBottom;

String[] outer = new String[4]; //Declare, create

String[] inner = new String[4]; //Declare, create

PImage prefix1;
PImage prefix2;
PImage prefix3;
PImage prefix4;

PImage suffix1;
PImage suffix2;
PImage suffix3;
PImage suffix4;

boolean clicked = false;

void setup()
{
  img = loadImage ("wence.jpg");
  currentTop = loadImage ("hohovazatshoda.png");
  currentBottom = loadImage ("confine.png");
  
  outer[0] = "hohovazatshoda.png";      //Assign
  outer[1] = "tenda.png";
  outer[2] = "vt.png";
  outer[3] = "yort.png";
  
  inner[0] = "confine.png";
  inner[1] = "gdr.png";
  inner[2] = "koima.png";
  inner[3] = "koima.png";
  
  prefix1 = loadImage (outer[0]);
  prefix2 = loadImage (outer[1]);
  prefix3 = loadImage (outer[2]);
  prefix4 = loadImage (outer[3]);
  
  suffix1 = loadImage (inner[0]);
  suffix2 = loadImage (inner[1]);
  suffix3 = loadImage (inner[2]);
  suffix4 = loadImage (inner[3]);
  
}
void draw()
{
    size (600, 600);
    image (img, 0, 0);
    rect (250, 210, 105, 140);

  if ((keyPressed == true || mousePressed == true) && clicked == false)
  {
    int n = int(random(0, 4));
    int m = int(random(0, 4));
    clicked = true;
    
    switch (n)
    {
      case 0:
        image (prefix1, 251, 215, 100, 50);
        currentTop = prefix1;
        break;
      case 1:
        image (prefix2, 251, 215, 100, 50);
        currentTop = prefix2;
        break;
      case 2:
        image (prefix3, 251, 215, 100, 50);
        currentTop = prefix3;
        break;
      case 3:
        image (prefix4, 251, 215, 100, 50);
        currentTop = prefix4;
        break;
    }
    
    switch (m)
    {
      case 0:
        image (suffix1, 255, 285, 100, 60);
        currentBottom = suffix1;
        break;
      case 1:
        image (suffix2, 255, 285, 100, 60);
        currentBottom = suffix2;
        break;
      case 2:
        image (suffix3, 255, 285, 100, 60);
        currentBottom = suffix3;
        break;
      case 3:
        image (suffix4, 255, 285, 100, 60);
        currentBottom = suffix4;
        break; 
    }
  }
  
  else
  {
      clicked = false;
      image (currentTop, 251, 215, 100, 50);
      image (currentBottom, 255, 285, 100, 60);
      }
}




