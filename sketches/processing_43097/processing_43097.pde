
float var1, r, g, b, sx1, sy1, swd1, sht1, x, x1, x1a, z1, z1a, ax, a, dx, dy;
float depth;
void setup()
{
  size(800,600, P3D);
  depth = 600;
  smooth();
  frameRate(60);
  ellipseMode(CENTER);
}
void draw()
{
  lights();
  background(0);
  fill(127);
  noStroke();  
  rect(.75*width, 0, .25*width, height);
  fill(255);
  drawslider(.9*width, .1*height, .0125*width, .25*height, var1);
  drawslider2(.9*width +20, .1*height, .0125*width, .25*height, r, r, g, b);
  drawslider3(.9*width +40, .1*height, .0125*width, .25*height, g, r, g, b);
  drawslider4(.9*width +60, .1*height, .0125*width, .25*height, b, r, g, b);
  drawslider5(.9*width, .1*height + .3*height, .0125*width, .25*height, x1a);
  drawslider6(.9*width + 20, .1*height + .3*height, .0125*width, .25*height, z1a);
  drawslider7(.9*width + 40, .1*height + .3*height, .0125*width, .25*height, a);
  rotatesystem();
  drawsun();
  drawplanet(var1, r, g, b, x1a, z1a, a);
}
void drawslider(float sx1, float sy1, float swd1, float sht1, float x)
{
  x = var1;
  noStroke();
  fill(0,0,255);
  rect(sx1, sy1, swd1, sht1);
  fill(255,0,0);
  rect(sx1, sy1, swd1, x*sht1);
}
void drawslider2(float sx1, float sy1, float swd1, float sht1, float x, float r, float g, float b)
{
  x = r;
  fill(255);
  noStroke();
  fill(0,0,255);
  rect(sx1, sy1, swd1, sht1);
  fill(255*r, 255*g, 255*b);
  rect(sx1, sy1, swd1, x*sht1);
}
void drawslider3(float sx1, float sy1, float swd1, float sht1, float x, float r, float g, float b)
{
  x = g;
  fill(255);
  noStroke();
  fill(0,0,255);
  rect(sx1, sy1, swd1, sht1);
  fill(255*r, 255*g, 255*b);
  rect(sx1, sy1, swd1, x*sht1);
}
void drawslider4(float sx1, float sy1, float swd1, float sht1, float x, float r, float g, float b)
{
  x = b;
  fill(255);
  noStroke();
  fill(0,0,255);
  rect(sx1, sy1, swd1, sht1);
  fill(255*r, 255*g, 255*b);
  rect(sx1, sy1, swd1, x*sht1);
}
void drawslider5(float sx1, float sy1, float swd1, float sht1, float x)
{
  x = x1a;
  noStroke();
  fill(0,0,255);
  rect(sx1, sy1, swd1, sht1);
  fill(255,0,0);
  rect(sx1, sy1, swd1, x*sht1);
}
void drawslider6(float sx1, float sy1, float swd1, float sht1, float x)
{
  x = z1a;
  noStroke();
  fill(0,0,255);
  rect(sx1, sy1, swd1, sht1);
  fill(255,0,0);
  rect(sx1, sy1, swd1, x*sht1);
}
void drawslider7(float sx1, float sy1, float swd1, float sht1, float x)
{
  x = a;
  noStroke();
  fill(0,0,255);
  rect(sx1, sy1, swd1, sht1);
  fill(255,0,0);
  rect(sx1, sy1, swd1, x*sht1);
}
void mouseDragged()
{
    sy1 = .1*height;
    sht1 = .25*height;
    sx1= .9*width;
    swd1= .0125*width;
    if (mouseY > sy1 && mouseY < sht1+sy1)
  { if (mouseX > sx1 && mouseX < sx1+swd1)
     { var1 = map (mouseY, sy1, sy1+ sht1, 0, 1);}
    else if (mouseX > sx1 + 20 && mouseX < sx1+swd1+20)
     { r = map (mouseY, sy1, sy1+ sht1, 0, 1);}
    else if (mouseX > sx1 + 40 && mouseX < sx1+swd1+40)
     { g = map (mouseY, sy1, sy1+ sht1, 0, 1);}
    else if (mouseX > sx1 + 60 && mouseX < sx1+swd1+60)
     { b = map (mouseY, sy1, sy1+ sht1, 0, 1);}
  }
   else if (mouseY > sy1 + .3*height && mouseY < sht1 + sy1 + .3*height)
    { if (mouseX > sx1 && mouseX < sx1+swd1)
     { x1a = map (mouseY, sy1 + .3*height, sy1+ sht1 + .3*height, 0, 1);}
    else if (mouseX > sx1 + 20 && mouseX < sx1+swd1+20)
     { z1a = map (mouseY, sy1 + .3*height, sy1+ sht1 + .3*height, 0, 1);}
    else if (mouseX > sx1 + 40 && mouseX < sx1+swd1+40)
     { a = map (mouseY, sy1 + .3*height, sy1+ sht1 + .3*height, 0, 1);}
    }
}
void drawplanet(float var, float r, float g, float b, float x1a, float z1a, float a)
{
  x1 = width*.5*sin(radians(frameCount*5*a));
  z1 = depth*.5* cos(radians(frameCount*5*a));
 pushMatrix();
  translate(.375*width, .5*height, -.5*depth);
  rotateX(dx);
  rotateY(dy);
  pushMatrix();
   rotateX(PI/2);
      stroke(255);
      strokeWeight(2);
      noFill();
   ellipse(0,0, x1a*width, z1a*depth);
  popMatrix();
  pushMatrix();
   translate( x1*x1a, 0, z1*z1a); 
   noStroke();
   fill( 255*r, 255*g, 255*b);
    sphere(25*var);
  popMatrix();
 popMatrix();
}
void drawsun() 
{
 pushMatrix();
 translate(.375*width, .5*height, -.5*depth);
 rotateX(dx);
 rotateY(dy);
 noStroke();
 fill(255, 255, 0);
 sphere (50);
 popMatrix();
}
void rotatesystem()
{
  if (keyPressed==true)
  {
    if(keyCode == UP)
    { dx=dx+.05;}
    if(keyCode == DOWN)
    { dx=dx-.05;}
    if(keyCode == LEFT)
    { dy=dy+.05;}
    if(keyCode == RIGHT)
    { dy=dy-.05;}
    if(key == ' ')
    {dx=0; dy=0;}
  }
}

