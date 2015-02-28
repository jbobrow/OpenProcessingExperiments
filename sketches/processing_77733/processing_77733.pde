
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage img;
int a=400;
int b=200;
int c=DOWN;
int b1=400;
int c1=600;
int d=int(random(4));
int d1=600;
int e=400;
int f=400;
int g=200;
int h=200;
int i=600;
int j=600;
int k=600;
int l=200;
int m=200;
int n=600;
int q=500;
int s=60;
int r1=200;
int r=int(random(-1, 2));
int cpu1c=UP;
int cpu2c=UP;
int cpux1=300;
int cpuy1=600;
int cpux2=500;
int cpuy2=600;
int cpu3c=UP;
int cpu4c=UP;
int cpux3=300;
int cpuy3=200;
int cpux4=500;
int cpuy4=200;
int cpu5c=UP;
int cpu6c=UP;
int cpux5=210;
int cpuy5=400;
int cpux6=590;
int cpuy6=400;
boolean failure=false;
void setup()
{
  size(800, 800);
  background(0);
  img=loadImage("M.png");
  image(img, 0, 0);
  minim = new Minim(this);
  player = minim.loadFile("Audio 5.mp3");
  player.loop();
}
void draw()
{
  frameRate(s);
  if (failure==true)
  {
  }
  else
  {
    human();
    if (failure==false)
    {
      magic();
      computer1();
      computer2();
      computer3();
      computer4();
      computer5();
      computer6();
    }
  }
}
void keyPressed()
{
  if (key=='a' || key=='A')
  {
    c=LEFT;
  }
  if (key=='d' || key=='D')
  {
    c=RIGHT;
  }
  if (key=='w' || key=='W')
  {
    c=UP;
  }
  if (key=='s' || key=='S')
  {
    c=DOWN;
  }
  if (key=='1')
  {
    s=30;
    e=400;
    f=400;
    g=200;
    h=200;
    i=600;
    j=600;
    k=600;
    l=200;
    m=200;
    n=600;
  }
  if (key=='2')
  {
    s=60;
    e=400;
    f=400;
    g=200;
    h=200;
    i=600;
    j=600;
    k=600;
    l=200;
    m=200;
    n=600;
  }
  if (key=='3')
  {
    s=120;
    e=400;
    f=400;
    g=200;
    h=200;
    i=600;
    j=600;
    k=600;
    l=200;
    m=200;
    n=600;
  }
  if (key=='4')
  {
    s=240;
    e=400;
    f=400;
    g=200;
    h=200;
    i=600;
    j=600;
    k=600;
    l=200;
    m=200;
    n=600;
  }
  if (key=='p' || key=='P')
  {
    s=1;
  }
}
void human()
{
  if (get(a, b) !=color(0))
  {
    fill(255);
    textAlign(CENTER);
    textSize(50);
    if (d==0)
    {
      fill(0);
      rect(0, 0, 800, 800);
      fill(255);
      text("GAME OVER!\nYOU LOSE! YOU GET NOTHING!\n", 400, 400);
      fill(140, 177, 193);
      stroke(140, 177, 193);
      triangle(b1-10, c1-5, b1-30, c1-50, b1-30, c1-25);
      triangle(b1+10, c1, b1+70, c1-20, b1+45, c1);
      triangle(b1-10, c1+10, b1-30, c1+10, b1-15, c1+20);
      triangle(b1+5, c1+10, b1+25, c1+25, b1+10, c1+25);
      stroke(82, 162, 198);
      fill(82, 162, 198);
      ellipse(b1, c1, 30, 30);
      stroke(20, 175, 245);
      fill(20, 175, 245);
      ellipse(b1, c1, 25, 25);
      fill(255);
      stroke(255);
      ellipse(b1, c1, 20, 20);
    }
    else if (d==1)
    {
      fill(0);
      rect(0, 0, 800, 800);
      fill(255);
      text("GAME OVER!\nY U NO HAVE SKILL?\n", 400, 400);
      //CRAZY HAND//
      fill(255);
      stroke(0);
      quad(q, 540, q-70, 540, q-70, 660, q, 660);
      quad(q, 600, q+100, 600, q+100, 630, q, 630);
      quad(q, 660, q+100, 660, q+100, 630, q, 630);
      quad(q, 570, q+100, 570, q+100, 600, q, 600);
      quad(q, 540, q+100, 540, q+100, 570, q, 570);
      quad(q, 520, q-25, 520, q-25, 620, q, 620);
      //MASTER HAND//
      quad(r1, 540, r1+170, 540, r1+170, 660, r1, 660);
      quad(r1+100, 520, r1+125, 520, r1+125, 620, r1+100, 620);
      quad(r1, 600, r1+100, 600, r1+100, 630, r1, 630);
      quad(r1, 660, r1+100, 660, r1+100, 630, r1, 630);
      quad(r1, 570, r1+100, 570, r1+100, 600, r1, 600);
      quad(r1, 540, r1+100, 540, r1+100, 570, r1, 570);
    }
    else if (d==2)
    {
      fill(0);
      rect(0, 0, 800, 800);
      fill(255);
      text("GAME OVER!\nYOU LOST THE GAME!\n", 400, 400);
      fill(255, 0, 0);
      stroke(0);
      strokeWeight(2);
      ellipse(400, 570, 50, 50);
      fill(255);
      arc(400, 570, 50, 50, 0, PI);
      stroke(0);
      line(375, 570, 425, 570);
      fill(255);
      ellipse(400, 570, 10, 10);
      strokeWeight(1);
    }
    else 
    {
      fill(0);
      rect(0, 0, 800, 800);
      fill(255);
      text("GAME OVER!\nFISSION MAILED?\n", 400, 400);
      translate(55,0);
      fill(245, 230, 67);
      stroke(245, 230, 67);
      beginShape();
      curveVertex(320, d1);
      curveVertex(325, d1);
      curveVertex(350, d1-15);
      curveVertex(380, d1);
      curveVertex(375, d1-35);
      curveVertex(390, d1-65);
      curveVertex(363, d1-70);
      curveVertex(350, d1-105);
      curveVertex(333, d1-70);
      curveVertex(310, d1-65);
      curveVertex(325, d1-35);
      curveVertex(320, d1);
      curveVertex(330, d1);
      endShape();
      fill(211, 23, 39);
      stroke(211, 23, 39);
      ellipse(340, d1+70, 20, 60);
      ellipse(360, d1+70, 20, 60);
      fill(252, 189, 227);
      stroke(252, 189, 227);
      ellipse(350, d1+40, 70, 70);
      ellipse(320, d1+20, 15, 50);
      ellipse(380, d1+20, 15, 50);
      fill(240, 87, 181);
      stroke(240, 87, 181);
      ellipse(335, d1+40, 10, 5);
      ellipse(365, d1+40, 10, 5);
      fill(4, 22, 124);
      stroke(4, 22, 124);
      ellipse(344, d1+25, 5, 15);
      ellipse(356, d1+25, 5, 15);
      fill(0);
      stroke(0);
      ellipse(344, d1+25, 3, 7);
      ellipse(356, d1+25, 3, 7);
      fill(255);
      stroke(255);
      ellipse(344, d1+20, 1, 5);
      ellipse(356, d1+20, 1, 5);
      fill(211, 23, 39);
      stroke(211, 23, 39);
      ellipse(350, d1+50, 5, 5);
      translate(-55,0);
    }
    failure=true;
  } 
  stroke(0, 255, 0);
  point(a, b);
  if (c==RIGHT)
  {
    a++;
  }
  else if (c==LEFT)
  {
    a--;
  }
  else if (c==UP)
  {
    b--;
  }
  else if (c==DOWN)
  {
    b++;
  }
}
void computer1()
{
  if (get(cpux1, cpuy1) !=color(0))
  {
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER!\nYELLOW LOSES!\n", 400, 400);
    failure=true;
  } 
  stroke(255, 255, 0);
  point(cpux1, cpuy1);
  if (cpu1c==RIGHT)
  {
    cpux1++;
    if (get(cpux1+1, cpuy1) !=color(0))
    {
      cpu1c=UP;
    }
  }
  else if (cpu1c==LEFT)
  {
    cpux1--;
    if (get(cpux1-1, cpuy1) !=color(0))
    {
      cpu1c=DOWN;
    }
  }
  else if (cpu1c==UP)
  {
    cpuy1--;
    if (get(cpux1, cpuy1-1) !=color(0))
    {
      cpu1c=LEFT;
    }
  }
  else if (cpu1c==DOWN)
  {
    cpuy1++;
    if (get(cpux1, cpuy1+1) !=color(0))
    {
      cpu1c=RIGHT;
    }
  }
}
void computer2()
{
  if (get(cpux2, cpuy2) !=color(0))
  {
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER!\nBLUE-GREEN LOSES!\n", 400, 400);
    failure=true;
  } 
  stroke(0, 255, 255);
  point(cpux2, cpuy2);
  if (cpu2c==RIGHT)
  {
    cpux2++;
    if (get(cpux2+1, cpuy2) !=color(0))
    {
      cpu2c=DOWN;
    }
  }
  else if (cpu2c==LEFT)
  {
    cpux2--;
    if (get(cpux2-1, cpuy2) !=color(0))
    {
      cpu2c=UP;
    }
  }
  else if (cpu2c==UP)
  {
    cpuy2--;
    if (get(cpux2, cpuy2-1) !=color(0))
    {
      cpu2c=RIGHT;
    }
  }
  else if (cpu2c==DOWN)
  {
    cpuy2++;
    if (get(cpux2, cpuy2+1) !=color(0))
    {
      cpu2c=LEFT;
    }
  }
}
void computer3()
{
  if (get(cpux3, cpuy3) !=color(0))
  {
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER!\nBLUE LOSES!\n", 400, 400);
    failure=true;
  } 
  stroke(0, 0, 255);
  point(cpux3, cpuy3);
  if (cpu3c==RIGHT)
  {
    cpux3++;
    if (get(cpux3+1, cpuy3) !=color(0))
    {
      cpu3c=DOWN;
    }
  }
  else if (cpu3c==LEFT)
  {
    cpux3--;
    if (get(cpux3-1, cpuy3) !=color(0))
    {
      cpu3c=UP;
    }
  }
  else if (cpu3c==UP)
  {
    cpuy3--;
    if (get(cpux3, cpuy3-1) !=color(0))
    {
      cpu3c=RIGHT;
    }
  }
  else if (cpu3c==DOWN)
  {
    cpuy3++;
    if (get(cpux3, cpuy3+1) !=color(0))
    {
      cpu3c=LEFT;
    }
  }
}
void computer4()
{
  if (get(cpux4, cpuy4) !=color(0))
  {
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER!\nPURPLE LOSES!\n", 400, 400);
    failure=true;
  } 
  stroke(255, 0, 255);
  point(cpux4, cpuy4);
  if (cpu4c==RIGHT)
  {
    cpux4++;
    if (get(cpux4+1, cpuy4) !=color(0))
    {
      cpu4c=UP;
    }
  }
  else if (cpu4c==LEFT)
  {
    cpux4--;
    if (get(cpux4-1, cpuy4) !=color(0))
    {
      cpu4c=DOWN;
    }
  }
  else if (cpu4c==UP)
  {
    cpuy4--;
    if (get(cpux4, cpuy4-1) !=color(0))
    {
      cpu4c=LEFT;
    }
  }
  else if (cpu4c==DOWN)
  {
    cpuy4++;
    if (get(cpux4, cpuy4+1) !=color(0))
    {
      cpu4c=RIGHT;
    }
  }
}
void computer5()
{
  if (get(cpux5, cpuy5) !=color(0))
  {
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER!\nWHITE LOSES!\n", 400, 400);
    failure=true;
  } 
  stroke(255);
  point(cpux5, cpuy5);
  if (cpu5c==RIGHT)
  {
    cpux5++;
    if (get(cpux5+1, cpuy5) !=color(0))
    {
      cpu5c=UP;
    }
  }
  else if (cpu5c==LEFT)
  {
    cpux5--;
    if (get(cpux5-1, cpuy5) !=color(0))
    {
      cpu5c=DOWN;
    }
  }
  else if (cpu5c==UP)
  {
    cpuy5--;
    if (get(cpux5, cpuy5-1) !=color(0))
    {
      cpu5c=LEFT;
    }
  }
  else if (cpu5c==DOWN)
  {
    cpuy5++;
    if (get(cpux5, cpuy5+1) !=color(0))
    {
      cpu5c=RIGHT;
    }
  }
}
void computer6()
{
  if (get(cpux6, cpuy6) !=color(0))
  {
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER!\nGRAY LOSES!\n", 400, 400);
    failure=true;
  } 
  stroke(127);
  point(cpux6, cpuy6);
  if (cpu6c==RIGHT)
  {
    cpux6++;
    if (get(cpux6+1, cpuy6) !=color(0))
    {
      cpu6c=UP;
    }
  }
  else if (cpu6c==LEFT)
  {
    cpux6--;
    if (get(cpux6-1, cpuy6) !=color(0))
    {
      cpu6c=DOWN;
    }
  }
  else if (cpu6c==UP)
  {
    cpuy6--;
    if (get(cpux6, cpuy6-1) !=color(0))
    {
      cpu6c=LEFT;
    }
  }
  else if (cpu6c==DOWN)
  {
    cpuy6++;
    if (get(cpux6, cpuy6+1) !=color(0))
    {
      cpu6c=RIGHT;
    }
  }
}
void magic()
{
  fill(0);
  stroke(0);
  rect(e, f, 50, 50);
  rect(g, h, 60, 60);
  rect(i, j, 30, 30);
  rect(k, l, 60, 60);
  rect(m, n, 50, 50);
  e=e+int(random(-11, 11));
  f=f+int(random(-11, 11));
  g=g+int(random(-11, 11));
  h=h+int(random(-11, 11));
  i=i+int(random(-11, 11));
  j=j+int(random(-11, 11));
  k=k+int(random(-11, 11));
  l=l+int(random(-11, 11));
  m=m+int(random(-11, 11));
  n=n+int(random(-11, 11));
}
void mousePressed()
{
  if (mouseButton==LEFT)
  {
    background(0);
    img=loadImage("M.png");
    image(img, 0, 0);  
    a=400;
    b=200;
    c=DOWN;
    d=int(random(4));
    e=400;
    f=400;
    g=200;
    h=200;
    i=600;
    j=600;
    k=600;
    l=200;
    m=200;
    n=600;
    s=60;
    r=int(random(-1, 2));
    cpu1c=UP;
    cpu2c=UP;
    cpux1=300;
    cpuy1=600;
    cpux2=500;
    cpuy2=600;
    cpu3c=UP;
    cpu4c=UP;
    cpux3=300;
    cpuy3=200;
    cpux4=500;
    cpuy4=200;
    cpu5c=UP;
    cpu6c=UP;
    cpux5=210;
    cpuy5=400;
    cpux6=590;
    cpuy6=400;
    failure=false;
  }
}


