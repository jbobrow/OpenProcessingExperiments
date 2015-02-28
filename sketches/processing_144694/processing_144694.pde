
void setup()
{
  size(400, 400, P3D);
  frameRate(60);
}

void draw()
{
  background(0, 150, 255);

  float xPos = 50+750*cos(radians(.3*frameCount%360));
  float yPos = 50+750*sin(radians(.3*frameCount%360));

  camera(xPos, yPos, 200, 50, 50, 30, 0, 0, -1);
  //camera(200,200,40,50,50,30,0,0,-1);

  lights();

  fill(0, 255, 0);
  rect(-1000, -1000, 2000, 2000);
  noStroke();

  houses();
  street(0);
  street(450);
  street(-350);
}

void xyWall(int sx, int sy, int sz, int x, int y)
{
  beginShape();
  vertex(sx, sy, sz);
  vertex(sx+x, sy, sz);
  vertex(sx+x, sy+y, sz);
  vertex(sx, sy+y, sz);
  endShape();
}

void yzWall(int sx, int sy, int sz, int y, int z, int w)
{
  if (w==0) {
    beginShape();
    vertex(sx, sy, sz);
    vertex(sx, sy+y, sz);
    vertex(sx, sy+y, sz+z);
    vertex(sx, sy, sz+z);
    endShape();
  }
  if (w==1)
  {
    //    beginShape();
    //    vertex(sx, sy, sz);
    //    vertex(sx, sy+y, sz);
    //    vertex(sx, sy+y, sz+0.3*z);
    //    vertex(sx, sy+y*0.3, sz+0.3*z);
    //    vertex(sx, sy+y*0.3, sz+0.7*z);
    //    vertex(sx, sy+y*0.7, sz+0.7*z);
    //    vertex(sx, sy+y*0.7, sz+0.3*z);
    //    vertex(sx, sy+y, sz+0.3*z);
    //    vertex(sx, sy+y, sz+z);
    //    vertex(sx, sy, sz+z);
    //    endShape();
    beginShape();
    vertex(sx, sy, sz);
    vertex(sx, sy+y, sz);
    vertex(sx, sy+y, sz+z*.3);
    vertex(sx, sy, sz+z*.3);
    endShape();

    beginShape();
    vertex(sx, sy, sz+z);
    vertex(sx, sy+y, sz+z);
    vertex(sx, sy+y, sz+z*.7);
    vertex(sx, sy, sz+z*.7);
    endShape();

    beginShape();
    vertex(sx, sy, sz);
    vertex(sx, sy, sz+z);
    vertex(sx, sy+y*.3, sz+z);
    vertex(sx, sy+y*.3, sz);
    endShape();

    beginShape();
    vertex(sx, sy+y, sz);
    vertex(sx, sy+y, sz+z);
    vertex(sx, sy+y*.7, sz+z);
    vertex(sx, sy+y*.7, sz);
    endShape();
  }
  if (w==2)
  {
    //    beginShape();
    //    vertex(sx, sy, sz);
    //    vertex(sx, sy+0.3*y, sz);
    //    vertex(sx, sy+0.3*y, sz+0.7*z);
    //    vertex(sx, sy+0.7*y, sz+0.7*z);
    //    vertex(sx, sy+0.7*y, sz);
    //    vertex(sx, sy+y, sz);
    //    vertex(sx, sy+y, sz+z);
    //    vertex(sx, sy, sz+z);
    //    endShape();

    beginShape();
    vertex(sx, sy, sz+z);
    vertex(sx, sy+y, sz+z);
    vertex(sx, sy+y, sz+z*.7);
    vertex(sx, sy, sz+z*.7);
    endShape();

    beginShape();
    vertex(sx, sy, sz);
    vertex(sx, sy, sz+z);
    vertex(sx, sy+y*.3, sz+z);
    vertex(sx, sy+y*.3, sz);
    endShape();

    beginShape();
    vertex(sx, sy+y, sz);
    vertex(sx, sy+y, sz+z);
    vertex(sx, sy+y*.7, sz+z);
    vertex(sx, sy+y*.7, sz);
    endShape();
  }
}

void zxWall(int sx, int sy, int sz, int z, int x, int w)
{

  if (w==0) {
    beginShape();
    vertex(sx, sy, sz);
    vertex(sx, sy, sz+z);
    vertex(sx+x, sy, sz+z);
    vertex(sx+x, sy, sz);
    endShape();
  }
  if (w==1)
  {
    //    beginShape();
    //    vertex(sx, sy, sz);
    //    vertex(sx, sy, sz+z);
    //    vertex(sx+0.3*x, sy, sz+z);
    //    vertex(sx+0.3*x, sy, sz+0.3*z);
    //    vertex(sx+0.7*x, sy, sz+0.3*z);
    //    vertex(sx+0.7*x, sy, sz+0.7*z);
    //    vertex(sx+0.3*x, sy, sz+0.7*z);
    //    vertex(sx+0.3*x, sy, sz+z);
    //    vertex(sx+x, sy, sz+z);
    //    vertex(sx+x, sy, sz);
    //    endShape();
    beginShape();
    vertex(sx, sy, sz);
    vertex(sx+x, sy, sz);
    vertex(sx+x, sy, sz+z*.3);
    vertex(sx, sy, sz+z*.3);
    endShape();

    beginShape();
    vertex(sx, sy, sz+z);
    vertex(sx+x, sy, sz+z);
    vertex(sx+x, sy, sz+z*.7);
    vertex(sx, sy, sz+z*.7);
    endShape();

    beginShape();
    vertex(sx, sy, sz);
    vertex(sx, sy, sz+z);
    vertex(sx+x*.3, sy, sz+z);
    vertex(sx+x*.3, sy, sz);
    endShape();

    beginShape();
    vertex(sx+x, sy, sz);
    vertex(sx+x, sy, sz+z);
    vertex(sx+x*.7, sy, sz+z);
    vertex(sx+x*.7, sy, sz);
    endShape();
  }
  if (w==2)
  {
    //    beginShape();
    //    vertex(sx, sy, sz);
    //    vertex(sx+0.3*x, sy, sz);
    //    vertex(sx+0.3*x, sy, sz+0.7*z);
    //    vertex(sx+0.7*x, sy, sz+0.7*z);
    //    vertex(sx+0.7*x, sy, sz);
    //    vertex(sx+x, sy, sz);
    //    vertex(sx+x, sy, sz+z);
    //    vertex(sx, sy, sz+z);
    //    endShape();

    beginShape();
    vertex(sx, sy, sz+z);
    vertex(sx+x, sy, sz+z);
    vertex(sx+x, sy, sz+z*.7);
    vertex(sx, sy, sz+z*.7);
    endShape();

    beginShape();
    vertex(sx, sy, sz);
    vertex(sx, sy, sz+z);
    vertex(sx+x*.3, sy, sz+z);
    vertex(sx+x*.3, sy, sz);
    endShape();

    beginShape();
    vertex(sx+x, sy, sz);
    vertex(sx+x, sy, sz+z);
    vertex(sx+x*.7, sy, sz+z);
    vertex(sx+x*.7, sy, sz);
    endShape();
  }
}

void grid()
{
  strokeWeight(5);
  stroke(255, 0, 0);//X-Axis
  line(0, 0, 0, 1000, 0, 0);
  stroke(0, 255, 0);//Y-Axis
  line(0, 0, 0, 0, 1000, 0);
  stroke(0);//Z-Axis
  line(0, 0, 0, 0, 0, 1000);
}

void house(int x, int y, int w1, int w2, int w3, int w4)
{
  fill(255);
  xyWall(x, y, 1, 100, 100); //floor
  xyWall(x, y, 100, 100, 100);
  fill(255, 0, 0);
  yzWall(x, y, 0, 100, 100, w1);
  fill(0, 0, 255);
  yzWall(x+100, y, 0, 100, 100, w2);
  fill(255, 255, 0);
  zxWall(x, y, 0, 100, 100, w3);
  fill(255, 0, 255);
  zxWall(x, y+100, 0, 100, 100, w4);
}

void hStreet(int x)
{
  if (x==-300||x==150||x==600)
  {
    house(0, x, 1, 1, 2, 0);
    house(150, x, 0, 1, 2, 1);
    house(300, x, 1, 1, 2, 0);
    house(450, x, 0, 1, 2, 1);
    house(-150, x, 0, 1, 2, 1);
    house(-300, x, 1, 1, 2, 0);
    house(-450, x, 0, 1, 2, 1);
  }

  if (x==-600||x==-150||x==300)
  {
    house(0, x, 1, 0, 1, 2);
    house(150, x, 1, 1, 0, 2);
    house(300, x, 1, 0, 1, 2);
    house(450, x, 1, 1, 0, 2);
    house(-150, x, 1, 1, 0, 2);
    house(-300, x, 1, 0, 1, 2);
    house(-450, x, 1, 1, 0, 2);
  }
}

void street(int x)
{
  fill(135, 135, 135);
  beginShape();
  vertex(-550, x, 1);
  vertex(-550, x+100, 1);
  vertex(550, x+100, 1);
  vertex(550, x, 1);
  endShape();
}

void houses()
{hStreet(-600);
  hStreet(-300);
  hStreet(-150);
  hStreet(600);
  hStreet(300);
  hStreet(150);}
