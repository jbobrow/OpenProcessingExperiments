
//Copyright William Aldrich, October 8 2013, Pittsburgh, PA
// Homework 7

//Press SPACE to reset with different values
//Press UP Arrow to speed things up
//Press DOWN Arrow to slow things down

float x1,y1,wd,ht,dx1,dy1;
float x2,y2,wd2,ht2,dx2,dy2;
PImage ball;

void setup()
{
  size(600,600);
  
  rectMode(CENTER);
  
  x1 = 100;
  y1 = x1;
  wd = x1*2;
  ht = wd;
  dx1 = random(5,10);
  dy1 = random(5,10);
  
  x2 = random(200,width-200);  
  y2 = random(150,height-150);
  wd2 = random(80,200);
  ht2 = wd2*.75;
  dx2 = random(-15,15);
  dy2 = random(-15,15);
}

void draw()
{
  prepWindow();
  drawFig1();
  moveFig1();
  drawFig2();
  moveFig2();
  collision();
}

void prepWindow()
{
  fill(30,100);
  rect(width/2,height/2,width,height);
}

void drawFig1()
{
  noStroke();
  fill(240,196,121);
  ellipse(x1-50,y1-5,wd/(13+1/3),ht/10);
  ellipse(x1+50,y1-5,wd/(13+1/3),ht/10);

  stroke(0);
  strokeWeight(2);
  line(x1-55,y1-15,x1-40,y1-10);
  line(x1+55,y1-15,x1+40,y1-10);

  noStroke();
  fill(240,196,121);
  ellipse(x1,y1,wd/2,ht*.425);

  stroke(0);
  strokeWeight(2);
  line(x1-55,y1-15,x1+55,y1-15);

  noFill();
  beginShape();
  curveVertex(x1-37,y1-17);
  curveVertex(x1-35,y1-15);
  curveVertex(x1-30,y1);
  curveVertex(x1-10,y1);
  curveVertex(x1-5,y1-15);
  curveVertex(x1-3,y1-17);
  endShape();

  beginShape();
  curveVertex(x1+38,y1-17);
  curveVertex(x1+35,y1-15);
  curveVertex(x1+30,y1);
  curveVertex(x1+10,y1);
  curveVertex(x1+5,y1-15);
  curveVertex(x1+2,y1-17);
  endShape();

  stroke(130);
  line(x1-22.5,y1-47.5,x1-12.5,y1-30);
  line(x1-12.5,y1-30,x1,y1-47.5);
  line(x1,y1-47.5,x1+12.5,y1-30);
  line(x1+12.5,y1-30,x1+22.5,y1-47.5);

  fill(255);
  noStroke();
  ellipse(x1-20,y1-7.5,wd/(13+1/3),ht/20);
  ellipse(x1+20,y1-7.5,wd/(13+1/3),ht/20);

  fill(120,255,120);
  stroke(0);
  strokeWeight(2);
  ellipse(x1-20,y1-7.5,wd/40,ht/40);
  ellipse(x1+20,y1-7.5,wd/40,ht/40);

  noStroke();
  fill(130);
  beginShape();
  curveVertex(x1-22.5,y1+22.5);
  curveVertex(x1-20,y1+20);
  curveVertex(x1-10,y1+10);
  curveVertex(x1,y1+5);
  curveVertex(x1+10,y1+10);
  curveVertex(x1+20,y1+20);
  curveVertex(x1+22.5,y1+22.5);
  endShape();

  fill(240,196,121);
  stroke(0);
  strokeWeight(1);
  beginShape();
  curveVertex(x1-12.5,y1);
  curveVertex(x1-10,y1+5);
  curveVertex(x1-5,y1+7.5);
  curveVertex(x1+5,y1+7.5);
  curveVertex(x1+10,y1+5);
  curveVertex(x1+12.5,y1);
  endShape();
}

void moveFig1()
{
    x1+=dx1;
    if(x1 > width) x1=0;
    else if(x1 < 0) x1=width;
    
    y1+=dy1;
    if(y1 > height) y1=0;
    else if(y1 < 0) y1=height;
}

void drawFig2()
{
  imageMode (CENTER);
  ball = loadImage("SoccerBall.png");
  image(ball,x2,y2,wd2,ht2);
}

void moveFig2()
{
    x2+=dx2;
    if(x2+wd2/3 > width || x2-wd2/3 < 0) dx2=-dx2;
    y2+=dy2;
    if(y2+ht2/2 > height || y2-ht2/2 < 0) dy2=-dy2;
}

void collision()
{
  if (dist(x1,y1,x2,y2) <= (wd+wd2)/3)
  {
    fill(255,0,0);
    textSize(170);
    textAlign(CENTER);
    text("OUCH!",width/2,height/2);
    
    float tempX,tempY;
    
    tempX = dx1;
    dx1 = dx2;
    dx2 = tempX;
    
    tempY = dy1;
    dy1 = dy2;
    dy2 = tempY;
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    x1 = random(100,150);
    y1 = x1;
    wd = x1*2;
    ht = wd;
    dx1 = random(5,10);
    dy1 = random(5,10);
  
    x2 = random(200,width-200);  
    y2 = random(150,height-150);
    wd2 = random(80,200);
    ht2 = wd2*.75;
    dx2 = random(-15,15);
    dy2 = random(-15,15);
  }
  if (keyCode == UP)
  {
    dx1=dx1*2;
    dy1=dy1*2;
    dx2=dx2*2;
    dy2=dy2*2;
  }
  if (keyCode == DOWN)
  {
    dx1=dx1/2;
    dy1=dy1/2;
    dx2=dx2/2;
    dy2=dy2/2;
  }
}


