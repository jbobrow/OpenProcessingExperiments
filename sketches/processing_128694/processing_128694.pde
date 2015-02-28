
PImage Forest;

void setup()
{
  size(600,500);
  Forest = requestImage("wolfbg.jpg");
}
void draw()
{
  image(Forest, 0, 0, width, height);
  // Grid
  //int xoffset = 0;
  //int yoffset = 0;
  //for (int x = 0; x < width; x += 50)
  //{
  //  stroke(255,255,255);
  //  line(x, 0, x, height);
  //}
  //for (int y = 0; y < height; y += 50)
  //{
  //  stroke(255,255,255);
  //  line(0, y, width, y);
  //}
  // End Grid
  // Right Shoulder
  fill(64,54,54);
  stroke(0);
  quad(400,200, 300,400, 300,450, 450,300);
  // Center-face
  fill(64,54,54);
  stroke(0);
  rect(250,400, 50,50);
  // Left Shoulder
  quad(150,200, 250,400, 250,450, 100,300);
  quad(150,200, 400,200, 300,400, 250,400);
  // Face Detail
  fill(0);
  triangle(250,400, 300,400, 275,450);
  fill(255,255,255);
  quad(150,200, 250,400, 250,450, 100,250);
  quad(400,200, 450,250, 300,450, 300,400);
  fill(0);
  triangle(225,225, 250,225, 250,350);
  triangle(300,225, 325,225, 300,350);
  // Head Top
  fill(64,54,54);
  stroke(64,54,54);
  quad(150,200, 250,100, 300,100, 400,200);
  // Ears
  stroke(0);
  triangle(140,50, 250,100, 150,200);
  triangle(300,100, 410,50, 400,200);
  // Eyes
  fill(255,255,255);
  quad(250,225, 250,200, 200,200, 225,225);
  quad(300,200, 350,200, 325,225, 300,225);
  // Pupils
  fill(47,144,160);
  triangle(225,225, 235,200, 250,225);
  triangle(300,225, 315,200, 325,225);
}


