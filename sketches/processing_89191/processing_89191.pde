
PFont myFont;
float x = 10;
float y = 40;
float vx = 100;
float vy = 0;
float dt = 1.0/30.0;
float gravity = 400;
float bval = .95;
String word = "bouncing";

void setup() {
  size(480, 600);
  frameRate(30);
  smooth();
  textSize(32);
  myFont = loadFont("CenturyGothic-Italic-48.vlw");
  textFont(createFont("Century Gothic",48));
}

void draw() {
  fill(0,0,0,60);
  rect(0,0,width,height);
  fill(147,17,17);
  ellipse(x + 10,y - 25,50,50);
  fill(5*y/100 + x * 2,25* y/100 + x * 2, 22*y/100 + x * 3,y * 10);
  text(word, x, y);
  vy += gravity*dt;
  x += vx*dt;
  y += vy*dt;
  if (x < 10){
    x = 10;
    vx *= -bval;
  } else if (x > width-220){
    x = width-220;
    vx *= -bval;
  }
  if (y > height){
    y = height;
    vy *= -bval;
  }
  else if(y < 0)
  {
    y = 0;
    vy *= -bval;
  }
}

void mouseClicked()
{
  y = 0;
}
 


