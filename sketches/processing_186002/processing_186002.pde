
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

void setup()
{
  img = loadImage ("interrobang.jpg");
  currentTop = loadImage("domanda.png");
  currentBottom = loadImage("BaNBaN.png");
  
  outer[0] = "domanda.png";      //Assign
  outer[1] = "fragezeichen.png";
  outer[2] = "GiMoN.png";
  outer[3] = "preguntando.png";
  
  inner[0] = "BaNBaN.png";
  inner[1] = "Knall.png";
  inner[2] = "ruidofuerte.png";
  inner[3] = "scoppio.png";
  
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
  rect (275, 195, 105, 140);

  if (keyPressed == true || mousePressed == true)
  {
    int n = int(random(0, 4));
    int m = int(random(0, 4));
    
    switch (n)
    {
      case 0:
        image (prefix1, 280, 200, 100, 50);
        currentTop = prefix1;
        break;
      case 1:
        image (prefix2, 280, 200, 100, 50);
        currentTop = prefix2;
        break;
      case 2:
        image (prefix3, 280, 200, 100, 50);
        currentTop = prefix3;
        break;
      case 3:
        image (prefix4, 280, 200, 100, 50);
        currentTop = prefix4;
        break;
    }
    
    switch (m)
    {
      case 0:
        image (suffix1, 280, 270, 100, 60);
        currentBottom = suffix1;
        break;
      case 1:
        image (suffix2, 280, 270, 100, 60);
        currentBottom = suffix2;
        break;
      case 2:
        image (suffix3, 280, 270, 100, 60);
        currentBottom = suffix3;
        break;
      case 3:
        image (suffix4, 280, 270, 100, 60);
        currentBottom = suffix4;
        break; 
    }
  }
  else
  {    image(currentTop, 280, 200, 100, 50);
       image(currentBottom, 280, 270, 100, 60);
  }
}
