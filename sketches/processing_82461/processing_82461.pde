
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage sf, ggp, img, img2, img3, vortex;
int a=400;
int m=int(random(10));
int b=0;
int d=1;
Ball ace=new Ball();
Ball king=new Ball();
Ball queen=new Ball();
Ball jack=new Ball();
Ball joker=new Ball();
boolean mode=true;
void setup()
{
  size(800, 600); 
  sf=loadImage("Ferry Building.png");
  ggp=loadImage("Centrivil.png");
  img=loadImage("Luigi's Mansion.png");
  img2=loadImage("Termina Bay.png");
  img3=loadImage("M.png");
  vortex=loadImage("Vortex.png");
  minim = new Minim(this);
  player = minim.loadFile("Instrumental.mp3");
  player.loop();
  ace.x=500;
  ace.y=400;
  king.x=100;
  king.y=100;
  queen.x=700;
  queen.y=100;
  jack.x=200;
  jack.y=200;
  joker.x=350;
  joker.y=450;
}
void draw()
{
  background(0);
  hundred();
  two();
  tron();
  magic();
  noFill();
  strokeWeight(5);
  stroke(255, 0, 0);
  rect(0, 0, 800, 600);
  ace.move();
  ace.bounce();
  ace.show();
  king.move();
  king.bounce();
  king.show();
  queen.move();
  queen.bounce();
  queen.show();
  jack.move();
  jack.bounce();
  jack.show();
  joker.move();
  joker.bounce();
  joker.show();
}
class Ball
{
  int x, y;
  boolean up, right;
  void move()
  {
    if (up==true)
    {
      y=y-10;
    }
    if (up==false)
    {
      y=y+10;
    }
    if (right==true)
    {
      x=x+10;
    }
    if (right==false)
    {
      x=x-10;
    }
  }
  void bounce()
  {
    if ((y<=15)||(get(x, y-10) ==color(255, 0, 0)))
    {
      up=!up;
    }
    if ((y>=585)||(get(x, y+10) ==color(255, 0, 0)))
    {
      up=!up;
    }
    if ((x<=15)||(get(x-10, y) ==color(255, 0, 0)))
    {
      right=!right;
    }
    if ((x>=785)||(get(x+10, y) ==color(255, 0, 0)))
    {
      right=!right;
    }
    int t=second();
    if (t>=40 &&t<=50)
    {
      if (get(x, y-30) !=color(0))
      {
        up=!up;
      }
      if (get(x, y+30) !=color(0))
      {
        up=!up;
      }
      if (get(x-30, y) !=color(0))
      {
        right=!right;
      }
      if (get(x+30, y) !=color(0))
      {
        right=!right;
      }
    }
  }
  void show()
  {
    strokeWeight(1);
    fill(int(random(256)), int(random(256)), int(random(256)));
    stroke(int(random(256)), int(random(256)), int(random(256)));
    ellipse(x, y, 30, 30);
  }
}
void hundred()
{
  int t=second();
  if (t>=0 &&t<=10)
  {
    image(sf, 0, 0);
    //MECHANICS//
    float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
    float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
    float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
    //HANDS//
    stroke(0);
    strokeWeight(2);
    line(a, 255, a + cos(m) * 25, 255 + sin(m) * 25);
    strokeWeight(3);
    line(a, 255, a + cos(h) * 17.5, 255 + sin(h) * 17.5);
  }
  if (t>=10 &&t<=20)
  {
    image(ggp, 0, 0);
  }
  if (t>=0 &&t<=20)
  {
    rain();
  }
}
void rain()
{
  fill(20, 180, 245);
  noStroke();
  int b=1;
  while (b<=500)
  {
    ellipse(int(random(801)), int(random(701)), 2, 8);
    b++;
  }
}
void two()
{
  int t=second();
  if (t>=20 &&t<=30)
  {
    image(img2, 0, 0);
  }
  if (t>=20 && t<=30)
  {
    int e=1;
    while (e<=d)
    {
      float b=random(width);
      float c=random(height);
      fill(140, 177, 193);
      stroke(140, 177, 193);
      triangle(b-10, c-5, b-30, c-50, b-30, c-25);
      triangle(b+10, c, b+70, c-20, b+45, c);
      triangle(b-10, c+10, b-30, c+10, b-15, c+20);
      triangle(b+5, c+10, b+25, c+25, b+10, c+25);
      stroke(82, 162, 198);
      fill(82, 162, 198);
      ellipse(b, c, 30, 30);
      stroke(20, 175, 245);
      fill(20, 175, 245);
      ellipse(b, c, 25, 25);
      fill(255);
      stroke(255);
      ellipse(b, c, 20, 20);
      e++;
    }
    d=d*2;
    if (d>8)
    {
      d=1;
    }
  }
  if (t>=30 &&t<=40)
  {
    image(img, 0, 0, width, height);
  }
  if (t>=30 && t<=40)
  {
    int a=1;
    while (a<=d)
    {
      float b=random(width);
      float c=random(height);
      fill(255);
      stroke(255);
      ellipse(b, c, 50, 50);
      //ARMS//
      beginShape();
      curveVertex(b+20, c-5);
      curveVertex(b+20, c-5);
      curveVertex(b+40, c);
      curveVertex(b+20, c+5);
      curveVertex(b+20, c+5);
      endShape();
      beginShape();
      curveVertex(b-20, c-5);
      curveVertex(b-20, c-5);
      curveVertex(b-40, c);
      curveVertex(b-20, c+5);
      curveVertex(b-20, c+5);
      endShape();
      //EYES//
      stroke(0);
      beginShape();
      curveVertex(b, c-5);
      curveVertex(b, c-5);
      curveVertex(b-5, c);
      curveVertex(b-10, c-5);
      curveVertex(b-10, c-5);
      endShape();
      beginShape();
      curveVertex(b, c-5);
      curveVertex(b, c-5);
      curveVertex(b+5, c);
      curveVertex(b+10, c-5);
      curveVertex(b+10, c-5);
      endShape();
      fill(0);
      ellipse(b+5, c+2, 2, 5);
      ellipse(b-5, c+2, 2, 5);
      //MOUTH//
      fill(245, 65, 65);
      stroke(245, 65, 65);
      arc(b, c+10, 20, 35, 0, PI);
      fill(255);
      stroke(0);
      beginShape();
      curveVertex(b+4, c+10);
      curveVertex(b+4, c+10);
      curveVertex(b+6, c+15);
      curveVertex(b+8, c+10);
      curveVertex(b+8, c+10);
      endShape();
      beginShape();
      curveVertex(b-4, c+10);
      curveVertex(b-4, c+10);
      curveVertex(b-6, c+15);
      curveVertex(b-8, c+10);
      curveVertex(b-8, c+10);
      endShape();
      a++;
    }
    d=d*2;
    if (d>8)
    {
      d=1;
    }
  }
}
void tron()
{
  int t=second();
  if (t>=40 &&t<=50)
  {
    image(img3, 0, 0, width, height);
  }
}
void magic()
{
  int t=second();
  if (t>=50 &&t<=60)
  {
    image(vortex, b, b, width, height);
    b=b+int(random(-3, 3));
    if (b<0)
    {
      b=b+4;
    }
    if (b>=16)
    {
      b=b-4;
    }
    fill(0);
    stroke(0);
    rect(0, 500, 800, 100);
    String answers[]=loadStrings("TOO MUCH DERP!.txt");
    if (mode == true)
    {
      fill(5, 30, 130);
      stroke(5, 30, 130);
      ellipse(400, 400, 150, 150);
      fill(255);
      stroke(255);
      ellipse(400, 400, 100, 100);
      fill(0);
      textAlign(CENTER);
      textSize(100);
      text(8, 400, 435);
      fill(255);
      textSize(25);
      text("Ask any question, and I shall respond appropriately.", 400, 550);
    }
    else
    {
      fill(5, 30, 130);
      stroke(5, 30, 130);
      ellipse(400, 400, 150, 150);
      fill(255);
      textAlign(CENTER);
      textSize(25);
      if (m==0)
      {
        text(answers[0], 400, 550);
      }
      else if (m==1)
      {
        text(answers[1], 400, 550);
      }
      else if (m==2)
      {
        text(answers[2], 400, 550);
      }
      else if (m==3)
      {
        text(answers[3], 400, 550);
      }
      else if (m==4)
      {
        text(answers[4], 400, 550);
      }
      else if (m==5)
      {
        text(answers[5], 400, 550);
      }
      else if (m==6)
      {
        text(answers[6], 400, 550);
      }
      else if (m==7)
      {
        text(answers[7], 400, 550);
      }
      else if (m==8)
      {
        text(answers[8], 400, 550);
      }
      else if (m==9)
      {
        text(answers[9], 400, 550);
      }
      else {
        text(answers[10], 400, 550);
      }
      fill(127, 0, 255);
      stroke(127, 0, 255);
      triangle(375, 375, 425, 375, 400, 425);
    }
  }
}
void mousePressed()
{
  int t=second();
  if (t>=50 &&t<=60)
  {
    mode= !mode;
    m=int(random(10));
    ace.x=500;
    ace.y=400;
    king.x=100;
    king.y=100;
    queen.x=700;
    queen.y=100;
    jack.x=200;
    jack.y=200;
    joker.x=350;
    joker.y=450;
    redraw();
  }
  else
  {
    mode=true;
    ace.x=500;
    ace.y=400;
    king.x=100;
    king.y=100;
    queen.x=700;
    queen.y=100;
    jack.x=200;
    jack.y=200;
    joker.x=350;
    joker.y=450;
  }
}


