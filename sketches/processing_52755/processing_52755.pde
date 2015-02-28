
/*
 * Four Modes
 *
 * 1) Left click - Positions the square on the canvas
 * 2) Right click (or ctrl + left click)  - Drags the square
 * 3) C key - turns off the collision mode - square disappears off the canvas
 * 4) Up arrow - square rotates upwards / clockwise motion
 * Down arrow - square rotates downwards / counter-clockwise motion
 * Esc - Exits the window
 *
 * Reference
 *
 * Processing: A Programming Handbook for Visual Designers and Artists
 *
 * pg 38, 106-109 - Boolean functions, data conversion
 * pg 133-143 - Rotate, Translation
 * pg 233-234 - KeyPressed
 * pg 395-409 - Using Classes and Objects
 *
 *
 */
 
 
MySquare mys;
int canv_w = 400;
int canv_h = 400;
 
void setup()
{
  size(400, 400);
  background(255);
  mys = new MySquare(50,50,20,20);
}
 
void draw()
{
  if(mys.drag == false){ background(255);}
   
  mys.animate();
  
 if( mousePressed == true )
 {
  if(mouseButton == LEFT){mys.y = mouseY;}
  else{mys.drag = true;}
 }
}
 
 
class MySquare
{
  float x,y,w,h;
  float speed;
  float angle,rads;
   
  boolean collide, demo, translate, drag;
   
  MySquare(float x,float y, float w, float h)
  {
    this.x=x;this.y=y; this.w=w;this.h=h;

    this.speed = 3.0;
    this.angle = 0.0;
    this.collide = true;
    this.demo = false;
    this.drag = false;
  }
   
  void animate()
  {
    if( this.demo == false )
    {
      this.rads = radians(this.angle);
      rotate(this.rads);
       
      if(this.translate == true )
      {
        translate(0,50);
      }
             
      rect(this.x, this.y, this.w, this.h);
       
      this.x+=this.speed;
       
      if( this.collide == true ){ this.bounce();}
      else{
        delay(10);
        fill(0);
      }
    }
    else{
       
      this.x+=this.speed;   
      this.angle++;
      this.rads = radians(this.angle);
       
      rotate(this.rads);
      rect(this.x, this.y, this.w, this.h);
      this.bounce();
       
    }
  }
   
  void bounce()
  {
    if( this.x + this.w > canv_w )
    {
      this.speed*=-1;
    }else if( this.speed < 0 )
    {
      if( this.x <= 0 )
      {
        this.speed*=-1;
      }
    }
  }
   
   
}
 
void keyPressed()
{
  if( key == CODED )
  {
    if( keyCode == UP )
    {   mys.angle-=2;}
    else if( keyCode == DOWN )
    {   mys.angle+=2;}
    else if( keyCode == ESC )
    {  if(mys.collide == false){exit();}}
  }
  else{
    if( key == 'c' )
    {  mys.collide = false;}
    else if(key == ENTER)
    {  mys.angle = 0;}
    else if( key == 't')
    {
      if( mys.translate == true )
      {
        mys.translate = false;
      }else
      {
        mys.translate = true;
      }
    }
  }
}


