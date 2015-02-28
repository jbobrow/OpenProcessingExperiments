
float x=200, y=280, time=11;
float x2[]= {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
, y2[]= {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
float x3[]= {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
, y3[]= {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
int score=0, bness=0;
boolean gameover=false, win=false;

void setup()
{
  size(800, 600);
  noStroke();
  for (int i=0;i<10;i++)
  {
    x2[i]=random(400, 1500);
    y2[i]=random(275, 550);
  }
  for (int i4=0;i4<10;i4++)
  {
    x3[i4]=random(400, 1500);
    y3[i4]=random(275, 550);
  }
}

void draw()
{
  background(50, 50, 255);
  for (int i6=0;i6<10;i6++)
  {
    if (x3[i6]+37<=x+75&&
      x3[i6]+37>=x&&
      y3[i6]+25>=y&&
      y3[i6]+25<=y+55&&
      !gameover&&
      !win||win)
    {
      background(random(255), random(255), random(255));
    }
  }
  fill(255);
  ellipse(150, 100, 100, 50);
  ellipse(200, 75, 100, 50);
  ellipse(225, 100, 100, 50);
  ellipse(650, 100, 100, 50);
  ellipse(700, 75, 100, 50);
  ellipse(725, 100, 100, 50);
  ellipse(450, 75, 100, 50);
  ellipse(475, 50, 100, 50);
  ellipse(525, 75, 100, 50);
  fill(50, 255, 50);
  rect(0, 250, width, 25);
  fill(10);
  rect(0, 275, width, 300);
  fill(50, 255, 50);
  rect(0, 575, width, 25);
  fill(0);
  stroke(255);
  rect(x+13, y-15, 50, 25, 10);
  noStroke();
  fill(255, 50, 50);
  rect(x, y, 75, 25, 10);
  fill(0);
  stroke(255);
  ellipse(x+10, y+20, 25, 25);
  ellipse(x+65, y+20, 25, 25);
  noStroke();
  for (int i2=0;i2<10;i2++)
  {
    fill(0);
    stroke(255);
    rect(x2[i2]+13, y2[i2]-15, 50, 25, 10);
    noStroke();
    fill(0, 100, 0);
    rect(x2[i2], y2[i2], 75, 25, 10);
    fill(0);
    stroke(255);
    ellipse(x2[i2]+10, y2[i2]+20, 25, 25);
    ellipse(x2[i2]+65, y2[i2]+20, 25, 25);
    noStroke();
    if (x2[i2]+37<=x+75&&
      x2[i2]+37>=x&&
      y2[i2]+25>=y&&
      y2[i2]+25<=y+55&&!win)
    {
      gameover=true;
    }
    x2[i2]-=1;
  }
  for (int i5=0;i5<10;i5++)
  {
    fill(0, 255, 0);
    rect(x3[i5], y3[i5]-20, 75, 50);
    fill(0);
    textSize(20);
    text("$", x3[i5]+37, y3[i5]+10);
    noStroke();
    if (x3[i5]+37<=x+75&&
      x3[i5]+37>=x&&
      y3[i5]+25>=y&&
      y3[i5]+25<=y+55&&
      !gameover&&
      !win)
    {
      score+=150;
    }
    x3[i5]-=1;
  }
  textAlign(CENTER);
  textSize(50);
  fill(255);
  text(int(time), 50, 50);
  text(score, 700, 50);
  if (mousePressed&&!gameover&&!win)
  {
    if (x+(75/2)<mouseX)
    {
      x+=5;
    }
    if (x+(75/2)>mouseX)
    {
      x-=5;
    }
    if (y+(25/2)<mouseY&&y<=540)
    {
      y+=5;
    }
    if (y+(25/2)>mouseY&&y>=255)
    {
      y-=5;
    }
    for (int i3=0;i3<10;i3++)
    {
      x2[i3]-=1;
    }
  }
  if (gameover)
  {
    fill(0,0,0,bness);
    rect(0,0,width,height);
    textAlign(CENTER);
    textSize(20);
    fill(random(255), random(255), random(255));
    text("<<<<<                       >>>>>", width/2, height/2);
    fill(255, 0, 0);
    text("     YOUR DEAD     ", width/2, height/2);
    text(" Your Score: "+score, width/2, height/1.3);
    text("Press r to try again", width/2, height/1.5);
    noStroke();
    if (keyPressed&&key;=='r')
    {
      gameover=false;
      time=11;
      score=0;
      x=200;
      y=280;
      for (int i=0;i<10;i++)
      {
        x2[i]=random(400, 1500);
        y2[i]=random(275, 550);
      }
      for (int i7=0;i7<10;i7++)
  {
    x3[i7]=random(400, 1500);
    y3[i7]=random(275, 550);
  }
      bness=0;
    }
    bness++;
  }
  if (time>=0&&!gameover)
  {
    time-=.0138;
  }
  if (time<=0)
  {
    win=true;
  }
  if (win)
  {
    textAlign(CENTER);
    textSize(20);
    fill(random(255), random(255), random(255));
    text("<<<<<                       >>>>>", width/2, height/2);
    fill(255, 0, 0);
    text("     YOU  WIN!     ", width/2, height/2);
    text(" Your Score: "+score, width/2, height/1.3);
    text("Press r to try again", width/2, height/1.5);
    noStroke();
    if (keyPressed&&key;=='r')
    {
      win=false;
      time=11;
      score=0;
      x=200;
      y=280;
      for (int i=0;i<10;i++)
      {
        x2[i]=random(400, 1500);
        y2[i]=random(275, 550);
      }
      for (int i7=0;i7<10;i7++)
  {
    x3[i7]=random(400, 1500);
    y3[i7]=random(275, 550);
  }
    }
  }
}

