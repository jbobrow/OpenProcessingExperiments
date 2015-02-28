
//hannah schmitt
//HW 6
//copyright hannah schmitt, carnegie mellon university, 2012

//press the 'up' arrow to restart the small circle bouncing 
//click, hold, and move around mouse for a surprise

float x, y, wd, ht, deltax, deltay, delta, theta;
color value, value2;


void setup ()
{
  size(400, 400);
  smooth();
  x=50;
  y=80;
  wd=140;
  ht=190;
  deltax= 5;
  deltay=2;
  delta=200;
  value = color(25, 40, 82, 130);
  value2 =color(20, 100, 100, 130);
  theta = 0;
}

void draw ()
{
  background(252, 173, 87, 10);
  circle2(x, y, wd, ht, value);
  circle(50, 50, width*.8, height*.8, value2);
  bounceCircle();
  circle(x, y, width*.2, height*.2, value2);
}

void bounceCircle() {
  x+= deltax;
  if (x>delta*2 || x< width-delta*2) {
    deltax= -deltax;
  }
  else if (x<0) {
    deltax= -deltax;
  }
  y+= deltay;
  if (y>delta*2 || y< height-delta*2) {
    deltay= -deltay;
  }
  else if (y<0) {
    deltay= -deltay;
  }
}


void circle (float x, float y, float wd, float ht, color value)
{
  theta++;
  fill(value);
  strokeWeight(8);
  stroke(191, 10, 106);
  line(x, y, x+80*cos(radians(theta)), y+80*sin(radians(theta)));
  arc(x, y, wd, ht, radians(0), radians (theta));
  if (theta == 360) {
    theta = 0;
  }
}

void circle2 (float x, float y, float wd, float ht, color value_)
{
  theta++;
  fill(value);
  strokeWeight(8);
  stroke(191, 10, 106);
  line(frameCount%width, 100, frameCount%width+70*cos(theta), 100+70*cos(theta));
  arc(frameCount%width, 100, width*.55, height*.55, radians(0), radians(theta));
  y= y+1;
  line(100, frameCount%height, 100+70*cos(theta), frameCount%height+70*cos(theta));
  arc(100,frameCount%height,width*0.3,height*.3,radians(0), radians(theta)); //1st horizontal
}

void mouseDragged()
{
//  value = color(62, 20, 118, 130);
background(random(255));
stroke(49,30,75);
line(200, 200, 70+140*cos(theta), 80+190*sin(theta));
line(200, 200, 40+140*cos(theta), 70+190*sin(theta));
line(200, 200, 30+140*cos(theta), 80+190*sin(theta));
line(200, 200, 70+140*cos(theta), 80+190*sin(theta));
line(200, 200, 30+140*cos(theta), 80+190*sin(theta));
line(200, 200, 100+140*cos(theta), 50+190*sin(theta));
line(200, 200, 90+140*cos(theta), 100+190*sin(theta));
line(200, 200, 110+140*cos(theta), 120+190*sin(theta));
line(200, 200, 40+100*cos(theta), 40+120*sin(theta));
line(200, 200, 100+120*cos(theta), 50+200*sin(theta));
line(200, 200, 50+150*cos(theta), 100+400*sin(theta));
line(200, 200, 80+160*cos(theta), 120+160*sin(theta));
}


void keyPressed ()
{ 
  if (key== CODED) {
    if (keyCode == UP) {
      x=x+40;
      y=x+40;
    } 
    if (x>45)
      x=0;
  } 
  if (y>45) {
    y=0;
  }
  
  if (key == 's') {
    deltax=20;
    deltay= 10;
    
  
}

}

void keyReleased ()
{
    if (key == 'g') {
    deltax=5;
    deltay= 2;
    }  
}


