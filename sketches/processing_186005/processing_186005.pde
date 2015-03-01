
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
  img = loadImage ("pixel.jpg");
  currentTop = loadImage("E.png");
  currentBottom = loadImage("element.png");
  
  outer[0] = "E.png";      //Assign
  outer[1] = "imagem.png";
  outer[2] = "picture.png";
  outer[3] = "tuxiang.png";
  
  inner[0] = "element.png";
  inner[1] = "iChiBu.png";
  inner[2] = "pedaco.png";
  inner[3] = "zufen.png";
  
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
  rect (270, 215, 105, 140);

  if (keyPressed == true || mousePressed == true)
  {
    int n = int(random(0, 4));
    int m = int(random(0, 4));
    
    switch (n)
    {
      case 0:
        image (prefix1, 271, 220, 100, 50);
        currentTop = prefix1;
        break;
      case 1:
        image (prefix2, 271, 220, 100, 50);
        currentTop = prefix2;
        break;
      case 2:
        image (prefix3, 271, 220, 100, 50);
        currentTop = prefix3;
        break;
      case 3:
        image (prefix4, 271, 220, 100, 50);
        currentTop = prefix4;
        break;
    }
    
    switch (m)
    {
      case 0:
        image (suffix1, 275, 290, 100, 60);
        currentBottom = suffix1;
        break;
      case 1:
        image (suffix2, 275, 290, 100, 60);
        currentBottom = suffix2;
        break;
      case 2:
        image (suffix3, 275, 290, 100, 60);
        currentBottom = suffix3;
        break;
      case 3:
        image (suffix4, 275, 290, 100, 60);
        currentBottom = suffix4;
        break; 
    }
  }
  else
  {    image(currentTop, 271, 220, 100, 50);
       image(currentBottom, 275, 290, 100, 60);
  }
}
