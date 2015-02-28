
//computer arts for processing 60-257
//hw #6 creating a function 
//copyright kyree 2012


float x, y, d, speedh,speedv;
float qx, qy, qd, qx2;

void setup()
{
  size(400,400);
  smooth();
  noStroke();
  x = 200;
  y = 250;
  d = 225;
  speedh = 2; //horizontal speed
  speedv = 2; //vertical speed
  
  
  qx = random( width );
  qy = random( height );
  qx2 = qx + 120;
  //qx = 120;
  //qy = 110;
  qd = 1;
}

void draw()
{
  background(#66B7A3, 200);
  drawNerd(x,y,d);
  moveNerd();  
  
  drawQues(qx, qy, qd);
  //moveQues();
  
  //drawQues(qx2, qy,qd);
  //moveQues();
}

void drawNerd(float x, float y, float d)
{
  //draw ellipse
  noStroke(); 
  fill(255);
  ellipse(x, y, d, d);

  //glasses
  stroke(151, 60, 0);
  strokeWeight(10);
  beginShape();
    vertex(x-(d*.5), y);
    vertex(x-(d*.25), y+(d*.25));
    vertex(x, y);
    vertex(x+(d*.25), y+(d*.25));
    vertex(x+d*.5, y);
    vertex(x-(d*.5), y);
  endShape();

  //eyes
  stroke(0);
  point(x-(d*.25), y*1.1);
  point(x+(d*.25), y*1.1);

//teeth
  strokeWeight(3);
  rect(x-(d*.1), y+(d*.25),d/12,d/10);
  rect(x+(d*.01), y+(d*.25),d/12,d/10);
}


void moveNerd()
{
  x = x + speedh;
  if(x > width - .5*d)
    {
    speedh = -speedh;
    }
    else if (x < d* .5)
    {
      speedh = -speedh;
    }
   y = y + speedv;
   if(y > height - .5*d)
   {
     speedv = -speedv;
   }
   if (y < 0 + .5*d)
   {
     speedv = -speedv;
   }
    
}

void drawQues(float qx, float qy, float qd)

{
  textAlign(CENTER);
  fill(0,0,0,157);
  textSize(qx*.25);
  text( "?", qx, qy);
  moveQues();
}


void moveQues()
{
  qx = qx + qd;
  if(qx > width)
    {
    qx = 0;
    //qd = -qd;
    }
    else if (qx < 0)
    {
      qd =  -qd;
    }
}

