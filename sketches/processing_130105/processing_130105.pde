
PImage myImage1;
PImage myImage2;

void setup()
{
  size(501,501);
  background(#000000);
  frameRate(30);
  
  myImage1 = loadImage("MarkProfilePic.jpg");
  myImage2 = loadImage("VulpixHead.png");
}

void draw()
{
  image(myImage1, 0,0,width,height); //loads first picture as the background
  noTint(); //making sure the second picture does not get tinted
  image(myImage2, 155,50, 275,210); //places second picture over my face
  
  if (myImage1.width > 0) //getting the first picture tinted
  {tint(#BD6F6B);}
  
  
  //placing a grid (20px squares) over the two images
  for (int x = 0; x < width; x += 20)
  {
    stroke(#000000);
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y += 20)
  {
    line(0, y, width, y);
  }
  
  
  
  //adding the lightning effect to my hand
  stroke(#FFFF00);
  strokeWeight(5);
  float lx = 60.0;
  float ly = 367.0;
  while (lx < width)
  {
    float nextX = lx + random(50);
    float nextY = ly + random(50);
    line(lx, ly, nextX, nextY);
    lx = nextX;
    ly = nextY;
  }
  strokeWeight(1); //making sure all other lines do not get affected with the previous strokeWeight
}


