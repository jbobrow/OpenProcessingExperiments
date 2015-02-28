
//Copyright William Aldrich, October 18 2013, Pittsburgh, PA
// Homework 8

//DON'T GET HIT!!
//Use UP and DOWN arrow keys to move
//Hit SPACE to reset game


float x1,y1,wd,ht,dx1,dy1;
float x2,y2,wd2,ht2,dx2,dy2;
PImage ball;
float m;
int gooseEggs;

void setup()
{
  size(600,600);
  
  rectMode(CENTER);
  
  x1 = 100;
  y1 = x1;
  wd = x1*2;
  ht = wd;
  dx1 = 12;
  dy1 = 0;
  
  x2 = random(80,width-80);
  y2 = random(60,height-60);
  wd2 = 80;
  ht2 = wd2*.75;
  dx2 = 15;
  dy2 = 15;
  
  gooseEggs = 0;
}

void draw()
{
  prepWindow();
  drawFig1();
  moveFig1();
  drawFig2();
  moveFig2();
  time();
  gooseEggs();
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
  
  dx2=dx2*1.001;
  dy2=dy2*1.001;
}

void time()
{
  fill(150);
  textSize(25);
  textAlign(RIGHT);
  text("TIME: " + (millis()/1000),width-7,height-7);
}

void gooseEggs()
{
  fill(150);
  textSize(25);
  textAlign(LEFT);
  text("GOOSE-EGGS: " + gooseEggs, 7,height-7);
}

void collision()
{
  if (dist(x1,y1,x2,y2) <= (wd+wd2)/3)
  {
    fill(255,0,0);
    textSize(170);
    textAlign(CENTER);
    text("OUCH!",width/2,height/2);
    
    textSize(100);
    text("GAME OVER",width/2,105);
    
    fill(255);
    textSize(50);
    text("SPACEBAR TO RESET",width/2,height*.75);
    
    gooseEggs++;
    
    noLoop();
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    x1 = 100;
    y1 = x1;
    x2 = random(80,width-80);
    y2 = random(60,height-60);
    dx2 = 15;
    dy2 = 15;
    
    loop();
  }
  
  if (keyCode == LEFT) 
  { 
    dx1 = -12;
    dy1 = 0;
  }
  if (keyCode == RIGHT) 
  {
    dx1 = 12;
    dy1 = 0;
  }
  if (keyCode == UP) 
  {
    dy1 = -12;
    dx1 = 0;
  }
  if (keyCode == DOWN) 
  {
    dy1 = 12;
    dx1 = 0;
  }
}


