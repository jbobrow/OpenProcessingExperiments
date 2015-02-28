
import ddf.minim.*;
AudioPlayer player; 
Minim minim;
PImage img;
PImage img2;
int a=600;
int b=200;
int c=100;
int d=100;
int e=0;
int f=0;
int g=0;
int h=450;
int i=0;
int j=400;
int k=200;
int l=400;
int m=400;
void setup()
{
  size(800, 500);
  img = loadImage("SF.jpg");
  img2 = loadImage("Alcatraz.jpg");
  smooth();
  minim = new Minim(this);
  player = minim.loadFile("Audio.mp3", 2048);
  player.play();
}
void draw()
{
  background(255);
  int s= millis()/1000;
  if ((s<25) && (s>=10))
  {
    tint(50);
    image(img, 0, 0);
  }
  if (((s>=0) && (s<=10))||(s>=24) && (s<=26))
  {
    tint(255);
    image(img, 0, 0);
  }
  floor();
  portal();
  keyman();
  pokeball();
  voltorb();
  explosion();
  ninja();
  shield();
  stage();
  narrator();
  flash();
  nemesis();
}
void stage()
{
  int s= millis()/1000;
  if (s>=0 && s<=26)
  {
    fill(0, 255, 0);
    stroke(175);
    strokeWeight(5);
    rect(50, 50, 300, 25);
    fill(255, 0, 0);
    rect(450, 50, 300, 25);
    stroke(255, 0, 0);
    strokeWeight(1);
    rect(200, 52, 147, 20);
    textSize(40);
    text("26", 375, 40);
    if (s>=0 && s<=26)
    {
      fill(252, 245, 15);
      textSize(20);
      text("PAPYRUSD-NINJACUS", 55, 70);
      text("KEYMAN", 455, 70);
      textSize(30);
      text("02 WINS", 50, 40);
      text("01 WIN", 630, 40);
    }
  }
}
void floor()
{
  int s= millis()/1000;
  if (s>=0 && s<=26)
  {
    fill(162);
    stroke(162);
    rect(0, 430, 800, 70);
  }
}
void narrator()
{
  int s= millis()/1000;
  if (s<3)
  {
    fill(255, 0, 0);
    textSize(50);
    text("FINISH HIM!", 260, 190);
  }
  if ((s>23) && (26>=s))
  {
    fill(255);
    textSize(30);
    text("PAPYRUSD-NINJACUS WINS!", 200, 130);
    fill(255, 0, 0);
    textSize(40);
    text("FATALITY!", 305, 180);
  }
}
void ninja()
{
  fill(0);
  strokeWeight(1);
  stroke(230);
  //LEFT LEG//
  beginShape();
  vertex(b+5, 390);
  vertex(b+20, 430);
  vertex(b+25, 470);
  vertex(b+45, 470);
  vertex(b+40, 430);
  vertex(b+25, 390);
  endShape();
  //LEFT ARM//
  beginShape();
  vertex(b-15, 290);
  vertex(b+15, 340);
  vertex(b+60, 370);
  vertex(b+60, 345);
  vertex(b+27, 315);
  vertex(b+7, 290);
  endShape();
  //HEAD & BODY//
  rect(b-15, 290, 40, 100);
  ellipse(b+5, 270, 60, 60);
  //RIGHT LEG//
  beginShape();
  vertex(b-15, 390);
  vertex(b-20, 430);
  vertex(b-30, 470);
  vertex(b-5, 470);
  vertex(b+05, 430);
  vertex(b+10, 390);
  endShape();
  //SASH//
  fill(255, 0, 0);
  stroke(255, 0, 0);
  beginShape();
  vertex(b-15, 360);
  vertex(b+25, 295);
  vertex(b+25, 300);
  vertex(b-10, 360);
  endShape();
  //RIGHT ARM//
  fill(0);
  stroke(230);
  beginShape();
  vertex(b-15, 300);
  vertex(b+15, 340);
  vertex(b+60, 380);
  vertex(b+60, 355);
  vertex(b+27, 325);
  vertex(b+7, 300);
  vertex(b-15, 300);
  endShape();
  //SWORD//
  fill(62);
  stroke(62);
  rect(b-30, 295, 14, 80);
  //BELTS//
  fill(255, 0, 0);
  stroke(255, 0, 0);
  rect(b-15, 360, 40, 5);
  rect(b-25, 260, 58, 4);
  ellipse(b-25, 260, 10, 10);
  rect(b-27, 260, 3, 40);
  //FACE//
  fill(250, 193, 140);
  stroke(250, 193, 140);
  rect(b, 265, 35, 10);
  fill(255);
  stroke(0);
  ellipse(b+30, 270, 10, 5);
  strokeWeight(4);
  point(b+34, 270);
  b=b-1;
  int s= millis()/1000;
  if (s<4)
  {
    b=200;
  }
  if (s>=4)
  {
    if (b<35)
    {
      b=35;
    }
  }
  if (s>=27)
  {
    b=-100;
  }
  if ((s<=10) && (s>=7))
  {
    b=b+int(random(-4, 4));
  }
}
void keyman()
{
  int s= millis()/1000;
  if (s>=0 && s<=22)
  {
    noFill();
    stroke(0);
    strokeWeight(5);
    ellipse(a+5, 270, 60, 60);
    line(a+5, 300, a+05, 390);
    line(a+5, 390, a-15, 470);
    line(a+5, 390, a+15, 470);
    line(a+5, 330, a-15, 390);
    line(a+5, 330, a+20, 390);
    stroke(252, 245, 15);
    ellipse(a+30, 400, 20, 20);
    line(a+33, 410, a+40, 440);
    line(a+37, 435, a+32, 437);
    line(a+40, 440, a+35, 443);
    if (s<=22)
    {
      a=a+int(random(-2, 2));
      if (a<600)
      {
        a=a+int(random(0, 2));
      }
      if (a>610);
      {
        a=a+int(random(-2, 0));
      }
    }
  }
}
void portal()
{
  int s= millis()/1000;
  if ((s<=14)&&(s>=12))
  {
    fill(255);
    strokeWeight(3);
    stroke(255, 97, 5);
    ellipse(450, 5, e, f);
    if (e<110)
    {
      e=e+1;
    }
    if (f<10)
    {
      f=f+1;
    }
    if (s>=52)
    {
      e=0;
      f=0;
    }
  }
}
void pokeball()
{
  int s= millis()/1000;
  if ((s<=15) && s>=13)
  {
    loop();
    fill(255, 0, 0);
    stroke(0);
    strokeWeight(2);
    ellipse(450, g, 50, 50);
    fill(255);
    arc(450, g, 50, 50, 0, PI);
    stroke(0);
    line(425, g, 475, g);
    fill(255);
    ellipse(450, g, 10, 10);
    g=g+5;
    if (g>=450)
    {
      g=450;
    }
  }
  if ((s<=18) && (s>=16))
  {
    fill(255, 0, 0);
    stroke(0);
    strokeWeight(2);
    ellipse(h, 450, 50, 50);
    fill(255);
    arc(h, 450, 50, 50, 0, PI);
    stroke(0);
    line(h-25, 450, h+25, 450);
    fill(255);
    ellipse(h, 450, 10, 10);
    h=h+int(random(-2, 2));
  }
}
void flash()
{
  int s= millis()/1000;
  if ((s<=18) && s>16)
  {
    fill(255);
    stroke(255);
    rect(0, 0, 800, 500);
  }
}
void voltorb()
{
  int s= millis()/1000;
  if ((s<=21) && s>=18)
  {
    fill(255, 0, 0);
    stroke(0);
    strokeWeight(2);
    ellipse(h, 450, 50, 50);
    fill(255);
    arc(h, 450, 50, 50, 0, PI);
    stroke(0);
    line(h-25, 450, h+25, 450);
    fill(255);
    strokeWeight(1);
    triangle(h-15, 437, h, 447, h-15, 442);
    triangle(h+20, 437, h+10, 447, h+20, 442);
    fill(0);
    ellipse(h-9, 443, 1, 1);
    ellipse(h+17, 443, 1, 1);
    h=h+int(random(-2, 2));
  }
}
void explosion()
{
  int s= millis()/1000;
  if ((s<=22) && s>=20)
  {
    fill(255);
    stroke(255);
    ellipse(h, 450, i, i);
    h=h+int(random(-2, 2));
    i=i+5;
    if (i>=1000)
    {
      i=0;
    }
  }
}
void shield()
{
  int s= millis()/1000;
  if ((s<=23) && s>=21)
  {
    fill(80, 185, 195, 50);
    stroke(80, 185, 195, 10);
    ellipse(35, 350, 300, 300);
  }
}
void nemesis()
{
  int s= millis()/1000;
  if (s>=27)
  {
    image(img2, 0, 0, 800, 600);
    tint(100);
    //ROBE//
    fill(70);
    stroke(70);
    quad(l-25, m-200, l-35, m+200, l+35, m+200, l+25, m-200);
    beginShape();
    vertex(l-25, m-185);
    vertex(l-40, m-130);
    vertex(l+40, m-130);
    vertex(l+25, m-185);
    endShape();
    ellipse(l, m-200, 50, 100);
    strokeWeight(5);
    stroke(120);
    line(l-35, m-25, l+35, m-25);
    ellipse(l+10, m-25, 10, 5);
    line(l+5, m-25, l+5, m-5);
    line(l+15, m-25, l+15, m-5);
    //HANDS//
    fill(255);
    stroke(255);
    strokeWeight(1);
    ellipse(l-45, m+25, 20, 50);
    ellipse(l+45, m+25, 20, 50);
    strokeWeight(3);
    //RIGHT//
    line(l-55, m+20, l-55, m+60);
    line(l-50, m+30, l-50, m+70);
    line(l-45, m+35, l-45, m+75);
    line(l-40, m+30, l-40, m+70);
    line(l-35, m+20, l-30, m+45);
    //LEFT//
    line(l+55, m+20, l+55, m+60);
    line(l+50, m+30, l+50, m+70);
    line(l+45, m+35, l+45, m+75);
    line(l+40, m+30, l+40, m+70);
    line(l+35, m+20, l+30, m+45);
    //ARMS//
    strokeWeight(1);
    fill(100);
    stroke(100);
    ellipse(l-35, m-100, 25, 100);
    ellipse(l+36, m-100, 25, 100);
    //LEFT//
    beginShape();
    vertex(l+23, m-100);
    vertex(l+33, m+25);
    vertex(l+56, m+25);
    vertex(l+49, m-100);
    endShape();
    //RIGHT//
    beginShape();
    vertex(l-23, m-100);
    vertex(l-33, m+25);
    vertex(l-59, m+25);
    vertex(l-49, m-100);
    endShape();
    //HEAD//
    fill(50);
    stroke(50);
    ellipse(l, m-200, 40, 70);
    fill(255, 0, 0);
    ellipse(l-10, m-205, 15, 5);
    ellipse(l+10, m-205, 15, 5);
    l=l+int(random(-6,6));
    m=m+int(random(-2,2));
    if(l>=900)
    {
      l=-100;
    }
    if(l<=-100)
    {
      l=900;
    }
  }
}  
void stop()
{
  player.close();
  minim.stop();
  super.stop();
}


