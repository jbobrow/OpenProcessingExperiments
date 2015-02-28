
Poop rect1;
Poop rect2;
Poop rect3;
Poop rect4;
Poop rect5;
Bed Tyler;

float poopX;
float poopY;

void setup()
{
  size(700,700);
  poopX = 350;
  poopY = 350;
  rect1 = new Poop (random(width),random(height),5,2);
    rect2 = new Poop (random(width),random(height),7,1);
      rect3 = new Poop (random(width),random(height),9,3);
        rect4 = new Poop (random(width),random(height),10,4);
          rect5 = new Poop (random(width),random(height),12,12);
          Tyler = new Bed (random(width),random(height),5,3);
}
void draw()
{
    background(0,0,0);
    fill(0,146,255);
    ellipse(poopX,poopY,60,60);
rect1.move();
rect1.draw();
rect2.move();
rect2.draw();
rect3.move();
rect3.draw();
rect4.move();
rect4.draw();
rect5.move();
rect5.draw();
Tyler.move();
Tyler.draw();
  if(sqrt(pow(rect1.x - Tyler.x, 2) + pow(rect1.y - Tyler.y, 2)) < 80)
  {
   rect1.x = poopX;
   rect1.y = poopY; 
  }
  
  if(sqrt(pow(rect2.x - Tyler.x, 2) + pow(rect2.y - Tyler.y, 2)) < 80)
  {
   rect2.x = poopX;
   rect2.y = poopY; 
  }
  
  if(sqrt(pow(rect3.x - Tyler.x, 2) + pow(rect3.y - Tyler.y, 2)) < 80)
  {
   rect3.x = poopX;
   rect3.y = poopY; 
  }
  
  if(sqrt(pow(rect4.x - Tyler.x, 2) + pow(rect4.y - Tyler.y, 2)) < 80)
  {
   rect4.x = poopX;
   rect4.y = poopY; 
  }
  
  if(sqrt(pow(rect5.x - Tyler.x, 2) + pow(rect5.y - Tyler.y, 2)) < 80)
  {
   rect5.x = poopX;
   rect5.y = poopY; 
  }
}

//class Who
class Poop
{
  public float x;
  public float y;
  float x_speed;
  float y_speed;

Poop (float X,float Y,float X_Speed,float Y_Speed)
{
x = X;
y = Y;
x_speed = X_Speed;
y_speed = Y_Speed;
}
void draw()
{
    fill(116,71,2);
rect(x,y,20,20);
}

void move()
{
if (x > width || x < 0) {
x_speed = -x_speed;
}
if (y < 350) {
y_speed += .05;
}
if (y > 350) {
y_speed -= .05;
}
x += x_speed;
y += y_speed;
}
}
class Bed
{
  public float x;
  public float y;
  float x_speed;
  float y_speed;
  Bed (float X,float Y,float X_Speed,float Y_Speed)
{
x = X;
y = Y;
x_speed = X_Speed;
y_speed = Y_Speed;
}
void draw()
{
    fill(230,74.98);
ellipse(x,y,80,80);
}

void move()
{
if (x > width || x < 0) {
x_speed = -x_speed;
}
if (y < 350) {
y_speed += 1;
}
if (y > 350) {
y_speed -= 1;
}
x += x_speed;
y += y_speed;
}
}


