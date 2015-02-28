
/* @pjs preload="random.jpg"; */

PImage myimage;
PImage myimage2;
PImage myimage3;
PImage myimage4;



void setup()

{
  size (600,500);
  
  myimage = loadImage ("Random.jpg");
  myimage2 = loadImage ("Rose.jpg");
  myimage3 = loadImage ("Gray.png");
  myimage4 = loadImage ("Balloons.jpg");
  
}

void draw()

{
  //first image
  image(myimage, 0,0, width, height);
  filter(INVERT);
  
  //grid
  for (int x = 0; x < width; x += 10)
    {
      stroke(255);
      line(x,0, x, height); 
    }
  for (int y=0; y < height; y += 20)
  { stroke(255);
    line(0,y,width,y );
  }
  
  //2nd Image
  image(myimage2, 0,0, width/3, height/3);
   
   
  //3rd Image
  image(myimage3,0,0, width, height);
  tint(255, 200);
  
  //4th Image
  image(myimage4, 400,0, width/3, height/3);
  
  //shaky lines
  float ly= 75.0;
  float lx= 200.0;
  while (lx < 380)
    {
      float nextX = lx + random(10);
      float nextY = ly+ random (10);
      line (lx, ly, nextX, nextY);
      ly= nextY;
      lx= nextX;
    }
  
}


