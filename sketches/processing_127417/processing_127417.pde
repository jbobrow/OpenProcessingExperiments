
int counter = 0;

float squareWidth = 200;
float squareHeight = 300;

float squareGreenColor = 0;



void setup()
{
  size(400, 400);

}

void draw()
{
  background(255);
  
  strokeWeight(10);
  stroke(255,0,0);
  line(0,0,400,400);
  
  strokeWeight(1);
  stroke(0,0,255);
  line(20,100,0,200);
  
  noStroke();
  
  // Animate green value by increasing it by 1 60 times a second
  squareGreenColor = squareGreenColor + 1;
  
  // If the squareGreenColor value becomes greater than 255 reset it back to 0
  if (squareGreenColor > 255)
  {
    squareGreenColor = 0;
  }
  fill(0, squareGreenColor, 0);
  
  // Animate squareWidth value by increasing it by 0.1 60 times a second
  squareWidth = squareWidth + 0.1;
  rect(50,50,squareWidth,squareHeight);
  
  ellipse(200, 200, 100, 100);
  
  fill(#3A3DC6);
  stroke(0);
  triangle(50, 50, 75, 0, 100, 50);
  
  strokeWeight(10);
  point(300, 300);
  
  quad(38, 31, 86, 20, 69, 63, 30, 76);
  
  arc(300, 300, 100, 100, radians(45), radians(90));
}


