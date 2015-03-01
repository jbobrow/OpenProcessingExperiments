
PImage orange1;
PImage orange2;
PImage orange3;
PImage orange4;

int frame;

void setup()

{
  size(500,755);
  
  frameRate (2);
  frame = 1;
  
  orange1 = loadImage("orangeeins.JPG");
  orange2 = loadImage("orangezwei.jpg");
  orange3 = loadImage("orangedrei.jpg");
  orange4 = loadImage("orangevier.jpg");  
}

void draw()

{
 
  if (frame > 4) 
  {frame = 1;}
 
  if (frame == 1) 
  {image (orange1, 0, 0);}
  filter(POSTERIZE, 4);
  
  if (frame == 2) 
  {image (orange2, 0, 0);}
  filter(POSTERIZE, 4);
  
  if (frame == 3) 
  {image (orange3, 0, 0);}
  filter(POSTERIZE, 4);
  
  if (frame == 4) 
  {image (orange4, 0, 0);}
  filter(POSTERIZE, 4);
  
  frame = frame + 1;
}


