
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Ball b;
float target = 200;
float x1, y1, x2, y2;
float r1 = 20, r2 = 30;
float rSum = r1+r2;
float speed = 1.5, directionX = .4, directionY = .75, velocityX, velocityY;
float gravity = 0.1;
float c = 25;
float d = 50;
Minim m;
AudioPlayer p;
AudioPlayer q;
AudioPlayer j;
AudioPlayer l;
float k = 200;

void setup()
{
  size(700, 400);
  frameRate(100);
  background(0);
  smooth();
  b = new Ball(350,400, 0, 0);
  fill(255);
  x1 = width/2;
  y1 = height/2;
    m = new Minim(this);
  p = m.loadFile("4magnusn.mp3");
  q = m.loadFile("multi-plier-close-1.wav");
  j = m.loadFile("gun_ricochet_single_shot_2.wav");
  l = m.loadFile("impact_wrench_removing_nut.mp3");
}

void draw(){
  background(255);
 fill(255);
  velocityX = directionX*speed;
  velocityY = directionY*speed;
  x1+=velocityX;
  y1+=velocityY;
  rect(width,height,0,0);
      fill(200);
    rect(0,390,700,10); 
{
  //target
 fill(0);
  ellipse(x1, y1, 50, 100);
  fill(255);
  ellipse(x1, y1, c, d);
}
//target boundries
  float d = dist(x1, y1, x2, y2);
  if (d < rSum){
    directionX = (x1-x2)/d;
    directionY = (y1-y2)/d;
  
    x1 = x2+(rSum)*directionX;
    y1 = y2+(rSum)*directionY;
   
  }

  if (x1 > width-r1) {
  
    x1 = width-r1;
    directionX *= -1;
  } 
  else if (x1 < r1) {

    x1 = r1;
    directionX *= -1;
  } 
  else if (y1 > height-r1) {
  
    y1 = height-r1;
    directionY *= -1;
  } 
  else if (y1 < r1) {
    
    y1 = r1;
    directionY *= -1;
  }
 
  b.update();
  stroke(0);
  fill(255);
  if (mousePressed)
  {
    line(xPos, yPos, mouseX, mouseY);
  }
  noStroke();
  b.draw();
  
}

int xPos;
int yPos;


void mousePressed()
{
  xPos = mouseX;
  yPos = mouseY;
   q.loop(0);

}

void mouseReleased()
{
  b = new Ball(xPos, yPos, (mouseX - xPos) / 5, (mouseY - yPos) / 5);
  p.loop(0);
  
}

class Ball
{
  float x;
  float y;
  float dx, dy;
  float px, py;

  float strength = 0.85;

  Ball(float x, float y, float dx, float dy)
  {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
  }

  void draw()
  {
 fill(0);
    ellipse(x, y,10, 10);
    //bullet boundry
    if( x > 684)
      j.loop(0);
      
       if( x < width - width/1.029)
      j.loop(0);
      {
        //target red flash
        if(x <= c + d)
        fill(255,0,0);
         ellipse(x1, y1, c, d);
      
      }
   
  }

  void update()
  {
    px = x;
    py = y;

    dy = dy+gravity;
    y = y+dy;
    if (y >= height - 15)
    {
      dy = (-dy) * 0.8;
      y = height - 15;
    }

    x = x+dx;
    if (y == height - 15)
      dx = dx*strength;

    if ((x < 15) || (x >= width - 15))
    {
      dx = -dx * strength;
      if(x<15)
      x=15;
      else
      x = width - 15;      
    } 
  }
}




