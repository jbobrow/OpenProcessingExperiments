
//hw4_2
//copyright jingjing chen jingjin1@andrew.cmu.edu

float x,y,easingCoef;
float dis = 120;
float rate;
PImage img;

void setup()
{
  background(255);
  size(400,400);
  smooth();
  img = loadImage("zbl.PNG");
  x = width/2;
  y = height/2;
  easingCoef = 0.1;
}

  void keyPressed()
{
  if (key == 'a')
  {
  stroke(255,0,0);
  strokeWeight(5);
    line(200,30,x,y);  
  }
  }
     
void draw()
{
  fill(0,100);
  textSize(12);
  text("try to press the left mouse button and then the a key...",20,380);
  stroke(0);
    strokeWeight(1);
  line(100,0,200,30);
  line(300,0,200,30);  
  line(200,30,x,y);  
  noStroke();
  fill(255,50);
  rect(0,0,400,400);
  float dx = mouseX - 200;
  float dy = mouseY - 30;
  rate = dis/dist(200, 30, mouseX, mouseY);
  dx *= rate;
  dy *= rate;
  float angle = atan2(dx, dy);
  x = 200 + dx;
  y = 30 + dy;
  

  pushMatrix();
  translate(x, y);
  rotate(-angle );
  image(img, -img.width + 12, -7);
  popMatrix();

}




