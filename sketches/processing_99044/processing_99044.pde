
float columnNumber;
 
void setup()
{
  size(900, 600);
  background(70, 0, 40);
  smooth();
  frameRate(20);
}
 
void draw()
{
  columnNumber = random(width);
 
  stroke(random(255), random(255), random(255));
  line(900, height, columnNumber, height/2);
  line(800, height, columnNumber, height/6);
  line(800, height, columnNumber, height/5);
  line(700, height, columnNumber, height/4);
  line(600, height, columnNumber, height/7);
  line(500, height, columnNumber, height/10);
  line(400, height, columnNumber, height/12);
  line(300, height, columnNumber, height/20);
  line(200, height, columnNumber, height/2);
  line(150, height, columnNumber, height/3);
  line(100, height, columnNumber, height/5);
  line(50, height, columnNumber, height/8);
  
}
