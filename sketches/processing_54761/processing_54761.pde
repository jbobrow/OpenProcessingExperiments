
//Ayako Matsuda
//DESMA 28 Workshop 7

class Robots
{
  //"Fields"
  float px, py;
  float movx;
  float curves;
  float bodyheight;
  float toppoint; 
  float changex;
  float feet;
  float ring;
  float hat;
  float r, g, b ;
  float armspeed1;
  float army1;
  float armspeed2;
  float army2;
  float armspeed3;
  float army3;
  float armspeed4;
  float army4;
  float armspeed5;
  float army5;
  float armspeed6;
  float army6;

  //Constructor
  Robots (float x, float y, float vx) 
  {
    px = x;
    py = y;
    movx = vx;
    curves= random (25.0, 120);
    bodyheight = random (100, 200);
    toppoint = random (-10.0, 20.0);
    changex= random (100);
    feet = random (-20, 20);
    ring = random (10, 50);
    hat = random (20, 50);
    r = random (255);
    g = random (255);
    b = random (255);
    armspeed1 = random(0.02, 0.3);
    army1 = 0;
    armspeed2 = random(0.02, 0.3);
    army2 = 0;
    armspeed3 = random(0.02, 0.3);
    army3 = 0;
    armspeed4 = random(0.02, 0.3);
    army4 = 0;
    armspeed5 = random(0.02, 0.3);
    army5 = 0;
    armspeed6 = random(0.02, 0.3);
    army6 = 0;
  }

  void process()
  {
    // Move the robot
    px = px + movx;
    if (px > 2.7*width) 
    {
      px = px % (2.7*width);
      curves= random (25.0, 120);
      bodyheight = random (100, 200);
      toppoint = random (-10.0, 20.0);
      changex= random (100);
      feet = random (-20, 20);
      ring = random (10, 50);
      hat = random (20, 50);
      r = random (255);
      g = random (255);
      b = random (255);  
    }

    if (px < 0)
    {
      px = px + 2.7*width;
      curves= random (25.0, 120);
      bodyheight = random (100, 200);
      toppoint = random (-10.0, 20.0);
      changex= random (100);
      feet = random (-20, 20);
      ring = random (10, 50);
      hat = random (20, 50);
      r = random (255);
      g = random (255);
      b = random (255);
    }
    float jump = abs(10*sin(px));
    army1 = army1 + armspeed1;
    army2 = army2 + armspeed2;
    army3 = army3 + armspeed3;
    army4 = army4 + armspeed4;
    army5 = army5 + armspeed5;
    army6 = army6 + armspeed6;

    pushMatrix();
    scale (0.4);
    translate (-120, height/2);
    translate (px, py-jump);
    float y = 100.0;
    strokeWeight(6);
    noFill();
    beginShape();
    vertex(100 - changex, y);
    bezierVertex(0.0, y-curves, 20.0, 10.0+toppoint, 100.0, toppoint);
    bezierVertex(180.0, 10.0+toppoint, 200.0, y-curves, 100+changex, y);
    endShape(CLOSE);

    if (changex>=75)
    {
      ellipse (55, 70, 15, 15);
      ellipse (145, 70, 15, 15);
    }
    else if (changex<75 && changex> 10)
    {
      ellipse (55, toppoint+(y-toppoint)/2, 15, 15);
      ellipse (145, toppoint+(y-toppoint)/2, 15, 15);
    }

    else 
    {
      ellipse (55, toppoint+(y-toppoint)/3, 15, 15);
      ellipse (145, toppoint+(y-toppoint)/3, 15, 15);
    }

    //head
    beginShape();
    vertex (100 - hat, toppoint-5);
    vertex (100+ hat, toppoint-5);
    vertex (100+ hat, toppoint);
    vertex (100- hat, toppoint);
    endShape (CLOSE);

    beginShape();
    vertex (90, toppoint-5);
    vertex (100, toppoint-50);
    vertex (110, toppoint-5);
    endShape (CLOSE);

    fill (r, g, b);
    ellipse (100, toppoint-70, ring, ring); 

    //body
    beginShape();
    vertex (100 - changex, y);
    vertex (100+changex, y);
    vertex (200.0, y + bodyheight);
    vertex (0.0, y + bodyheight);
    endShape (CLOSE);

    strokeWeight(20);
    stroke (200);
    noFill();
    //arm
    //right
    beginShape();
    vertex(100+changex, y);
    bezierVertex(y + bodyheight, y + bodyheight/3 +bodyheight/3*sin(army1), 
    y + changex*2, y + bodyheight/3 +bodyheight/3*sin(army2), 
    150 + changex*2, y+ bodyheight/2 +bodyheight/2*sin(army5));
    endShape();

    //left
    beginShape();
    vertex (100 - changex, y);
    bezierVertex(y -bodyheight, y + bodyheight/3 +bodyheight/3*sin(army3), 
    y- changex*2, y+ bodyheight/4 +bodyheight/3*sin(army4), 
    50 - changex*2, y+ bodyheight/2 +bodyheight/2*sin(army6));
    endShape();

    stroke (0);
    strokeWeight (6);
    fill(r, g, b);
    //shoulder
    ellipse (100 - changex, y, 30, 20);
    ellipse (100+changex, y, 30, 20);

    popMatrix();
  }
}

Robots robot11;
Robots robot12;
Robots robot13;
Robots robot14;
Robots robot15;
Robots robot16;
Robots robot17;
Robots robot18;
Robots robot21;
Robots robot22;
Robots robot23;
Robots robot24;
Robots robot25;
Robots robot26;
Robots robot27;
Robots robot28;

void setup()
{
  size (800, 400);
  smooth ();

  robot11 = new Robots(0, 0, 3);
  robot12 = new Robots(300, 0, 3);
  robot13 = new Robots(600, 0, 3);
  robot14 = new Robots(900, 0, 3);
  robot15 = new Robots(1200, 0, 3);
  robot16 = new Robots(1500, 0, 3);
  robot17 = new Robots(1800, 0, 3);
  robot21 = new Robots(0, 300, -3);
  robot22 = new Robots(300, 300, -3);
  robot23 = new Robots(600, 300, -3);
  robot24 = new Robots(900, 300, -3);
  robot25 = new Robots(1200, 300, -3);
  robot26 = new Robots(1500, 300, -3);
  robot27 = new Robots(1800, 300, -3);

}

void draw()
{
  background (255);

  robot11.process();
  robot12.process();
  robot13.process();
  robot14.process();
  robot15.process();
  robot16.process();
  robot17.process();
  robot21.process();
  robot22.process();
  robot23.process();
  robot24.process();
  robot25.process();
  robot26.process();
  robot27.process();
}




