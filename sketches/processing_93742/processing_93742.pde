
PImage myImage;
int col;
int row;
boolean rednewcircle, rednewcirclerowtwo = false;
boolean blacknewcircle, blacknewcirclerowtwo = false;

void setup()
{
  size(700,700);
  myImage = loadImage ("connectfour.png");
}

void draw()
{
  background (0,0,255);
  image (myImage, 200, 0, 300, 20);
  drawGrid ();
  playerChip();
  mainPlayerchip ();
  
  if (rednewcircle)
  {
    fill(255,0,0);
    ellipse (50, 650, 90, 90);
  }
  if (blacknewcircle)
  {
    fill(0);
    ellipse (50, 650, 90, 90);
  }
  if (rednewcirclerowtwo)
  {
    fill(255,0,0);
    ellipse (150,650, 90, 90);
  }
  if (blacknewcirclerowtwo)
  {
    fill(0);
    ellipse (150,650, 90, 90);
  }
  
  
}

void drawGrid () // grid sqaures
{
  for (int col = 0; col <= 700; col = col + 100)
  {
    for (int row = 100; row <= 600; row = row + 100)
    {
     stroke(167,167,206);
     strokeWeight(3);
     fill (0,0,255);
     rect (col, row, 95, 95);
    }
  }
}

void playerChip() // grid circles
{
  for (int playcirclex = 50; playcirclex <= 700; playcirclex = playcirclex + 100)
  {
    for (int playcircley = 150; playcircley <= 700; playcircley = playcircley + 100)
    {
      fill(255);
      ellipseMode (CENTER);
      ellipse (playcirclex, playcircley, 90,90);
    }
  }
}

void mainPlayerchip () //moving player chip on y axis
{
  fill (246, 250, 63);
  ellipse (mouseX, 50, 90,90);

}

void mousePressed()
{
  if (mouseX > 0 && mouseX < 100 && blacknewcircle != true)
 {
   rednewcircle = true;
 }
 else
 {
   rednewcircle = false;
 }
 if (mouseX > 100 && mouseX < 200 && blacknewcirclerowtwo != true)
 {
   rednewcirclerowtwo = true;
 }
 else
 {
   rednewcirclerowtwo = false;
 }
 
 
}

void keyPressed()
{
  if (mouseX > 0 && mouseX < 100 && rednewcircle != true)
 {
   blacknewcircle = true;
 }
 else
 {
   blacknewcircle = false;
 }
 if (mouseX > 100 && mouseX < 200 && rednewcirclerowtwo != true)
 {
   blacknewcirclerowtwo = true;
 }
 else
 {
   blacknewcirclerowtwo = false;
 }
   
}



