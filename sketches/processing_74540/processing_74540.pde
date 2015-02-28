
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage img;
float b=-50;
float c=900;
float d=0;
float e=0;
float f=500;
float g=125;
float h=4;
float i=540;
float j=.5;
float k=800;
float l=0;
float m=850;
float n=0;
int o=676;
int p=5;
float q=540;
float r=.5;
float t=1;
float u=1;
int v=600;
int w=500;
void setup()
{
  size(800, 600);
  img=loadImage("Music Concourse.png");
  minim = new Minim(this);
  player = minim.loadFile("Audio 3.mp3");
  player.play();
}
void draw()
{
  background(100);
  image(img, 0, 0, width, 550);
  tint(120);
  fill(50, 120, 30);
  strokeWeight(1);
  stroke(50, 120, 30);
  rect(0, 550, 800, 50);
  centrivil();
  tail();
  jennifer();
  energy();
  strokeWeight(1);
  caroline();
  strokeWeight(1);
  speech();
  shield();
  poison();
  ice();
  rain();
}
void centrivil()
{
  int sa=millis()/1000;
  if (sa>=4)
  {
    fill(175);
    strokeWeight(2);
    stroke(150);
    //BODY//
    rect(493, c-260, 30, 50, 5,5);
    rect(493, c-210, 30, 50, 5,5);
    rect(493, c-160, 30, 50, 5,5);
    rect(493, c-110, 30, 50, 5,5);
    rect(493, c-60, 30, 50, 5,5);
    ellipse(500, c-260, 45, 45);
    stroke(0);
    line(517, c-260, 517, c-10);
    //HEAD//
    fill(175);
    stroke(150);
    ellipse(500, c-260, 45, 45);
    stroke(0);
    //EYES,ANTENNA,MOUTH//
    fill(255, 0, 0);
    stroke(255, 0, 0);
    arc(500, c-265, 15, 20, 0+sin(-25), PI+sin(10));
    arc(485, c-267, 10, 15, 0-sin(-45), PI-sin(-45));
    line(515, c-280, 530, c-310);
    line(485, c-280, 500, c-310);
    arc(465, c-255, 25, 15, PI+sin(-25), TWO_PI-sin(10));
    arc(505, c-225, 12, 33, PI+cos(-25), TWO_PI-cos(10));
    stroke(0);
    line(520, c-273, 490, c-260);
    line(480, c-275, 490, c-260);
    line(490, c-240, 485, c-237);
    line(483, c-245, 477, c-242);
    fill(50, 120, 30);
    stroke(50, 120, 30);
    rect(300, 590, 300, 10);
    c=c-d;
    d=d+.01;
    if (c<=600)
    {
      c=600;
    }
  }
}
void tail()
{
  int sb=millis()/1000;
  if (sb>=36 && sb<=75)
  {
    //TAIL//
    fill(0);
    strokeWeight(2);
    stroke(0);
    translate(433, k-72);
    rotate(PI/5);
    rect(0, 0, 50, 30, 5,5);
    rotate(-PI/5);
    translate(-433, -k+72);
    rect(393, k-70, 40, 25, 5,5);
    rect(363, k-68, 30, 20, 5,5);
    translate(450, k-40);
    rotate(-PI/12);
    rect(0, 0, 25, 50, 5,5);
    rotate(PI/12);
    translate(-450, -k+40);
    fill(175);
    strokeWeight(2);
    stroke(175);
    translate(433, k-72);
    rotate(PI/5);
    rect(0, 5, 50, 20, 5,5);
    stroke(255, 0, 0);
    strokeWeight(5);
    line(27, -2, 52, -18);
    line(27, 27, 52, 47);
    rotate(-PI/5);
    translate(-433, -k+72);
    fill(175);
    strokeWeight(2);
    stroke(175);
    rect(393, k-65, 40, 15, 5,5);
    rect(363, k-63, 30, 10, 5,5);
    translate(455, k-40);
    rotate(-PI/12);
    rect(0, 0, 15, 50, 5,5);
    rotate(PI/12);
    translate(-455, -k+40);
    //SPIKES//
    stroke(255, 0, 0);
    strokeWeight(5);
    line(410, k-70, 435, k-90);
    line(410, k-45, 435, k-25);
    line(380, k-70, 405, k-90);
    line(380, k-45, 405, k-25);
    stroke(0);
    line(360, k-58, 330, k-75);
    line(360, k-58, 330, k-41);
    fill(50, 120, 30);
    stroke(50, 120, 30);
    rect(300, 590, 300, 10);
    k=k-l;
    l=l+.01;
    if (k<=590)
    {
      k=590;
    }
    if (sb>=63)
    {
      k=k+l;
      l=l+.09;
    }
  }
}
void poison()
{
  float sc=millis()/1000;
  if (sc>=12&& sc<=70)
  {
    fill(150, 40, 180);
    stroke(50, 10, 60);
    int cd = 1;
    while (cd < 101)
    {
      ellipse(int(random(529, 531)), int(random(291)), 5, 5);
      ellipse(int(random(499, 501)), int(random(291)), 5, 5);
      cd++;
    }
  }
  if (sc>=14 && sc<=71)
  {
    fill(150, 40, 180);
    stroke(50, 10, 60);
    int cb = 1;
    while (cb < 101)
    {
      ellipse(int(random(801)), int(random(601)), 5, 5);
      cb++;
    }
  }
  if (sc>=43&& sc<=62)
  {
    fill(150, 40, 180);
    stroke(50, 10, 60);
    int ca = 1;
    while (ca < 101)
    {
      ellipse(int(random(162, 361)), int(random(534, 536)), 5, 5);
      ca++;
    }
  }
}
void jennifer()
{
  noStroke();
  //LEFT LEG//
  fill(0);
  beginShape();
  vertex(b+1, f+46);
  vertex(b+5, f+70);
  vertex(b+12, f+70);
  vertex(b+9, f+46);
  endShape();
  fill(50);
  beginShape();
  vertex(b+5, f+70);
  vertex(b+5, f+95);
  vertex(b+12, f+95);
  vertex(b+12, f+70);
  endShape();
  arc(b+12, f+95, 10, 10, PI, TWO_PI);
  //LEFT ARM//
  fill(250, 193, 140);
  ellipse(b+20, f+37, 4, 4);
  fill(70);
  beginShape();
  vertex(b-6, f+14);
  vertex(b+10, f+30);
  vertex(b+20, f+40);
  vertex(b+20, f+35);
  vertex(b+15, f+30);
  vertex(b+4, f+14);
  endShape();
  //HEAD & BODY//
  fill(20);
  rect(b-5, f+14, 13, 15);
  ellipse(b+7, f+20, 5, 10);
  rect(b-5, f+29, 13, 15);
  fill(250, 193, 140);
  ellipse(b+3, f+4, 13, 20);
  fill(0);
  arc(b+3, f, 13, 20, PI, TWO_PI);
  rect(b-4, f, 4, 14);
  //RIGHT LEG//
  beginShape();
  vertex(b-5, f+46);
  vertex(b-7, f+70);
  vertex(b, f+70);
  vertex(b+4, f+46);
  endShape();
  fill(50);
  beginShape();
  vertex(b-8, f+70);
  vertex(b-14, f+95);
  vertex(b-8, f+95);
  vertex(b, f+70);
  endShape();
  arc(b-7, f+95, 9, 9, PI, TWO_PI);
  //RIGHT ARM//
  fill(250, 193, 140);
  ellipse(b+20, f+46, 4, 4);
  fill(70);
  beginShape();
  vertex(b-4, f+16);
  vertex(b+5, f+32);
  vertex(b+20, f+50);
  vertex(b+20, f+42);
  vertex(b+10, f+32);
  vertex(b+2, f+16);
  endShape();
  stroke(0);
  strokeWeight(1);
  line(b, f+16, b+6, f+30);
  line(b+6, f+30, b+19, f+46);
  fill(255);
  stroke(0);
  triangle(b-2, f+16, b, f+12, b+1, f+16);
  //SKIRT//
  fill(80);
  noStroke();
  quad(b-5, f+43, b-8, f+65, b+13, f+65, b+8, f+43);
  //BELTS//
  fill(10, 60, 15);
  rect(b-5, f+40, 13, 3);
  rect(b+8, f+37, 2, 6);
  //FACE//
  stroke(0);
  strokeWeight(1);
  line(b+8, f+1, b, f+1);
  fill(0, 0, 0, 200);
  strokeWeight(1);
  rect(b+6, f+1, 3, 2);
  line(b+5, f+9, b+8, f+9);
  //CAPE//
  fill(0);
  stroke(0);
  triangle(b-5, f+14, b-10, f+50, b-5, f+50);
  b=b+e;
  e=e+.1;
  if (b>=100)
  {
    b=100;
  }
  int sd=millis()/1000;
  if (sd>=100)
  {
    f=f-5;
  }
}
void shield()
{
  int se=millis()/1000;
  if (se>=13 && se<=74)
  {
    fill(100, 100);
    stroke(80, 100);
    ellipse(100, 540, 120, 120);
  }
}
void speech()
{
  int sf=millis()/1000;
  if (sf>=2 && sf<=3)
  {
    noStroke();
    fill(255);
    triangle(140, 430, 140, 435, 110, 500);
    rect(135, 400, 150, 35, 5,5);
    fill(0);
    textSize(15);
    text("Where is everyone?", 140, 425);
  }
  if (sf>=6 && sf<=7)
  {
    noStroke();
    fill(255);
    triangle(140, 430, 140, 435, 110, 500);
    rect(135, 400, 170, 35, 5,5);
    fill(0);
    textSize(15);
    text("What the heck is that?", 140, 425);
  }
  if (sf>=16 && sf<=17)
  {
    noStroke();
    fill(255);
    triangle(140, 430, 140, 435, 110, 500);
    rect(135, 400, 160, 35, 5,5);
    fill(0);
    textSize(15);
    text("This should be easy!", 140, 425);
  }
  if (sf>=32 && sf<=33)
  {
    noStroke();
    fill(255);
    triangle(140, 430, 140, 435, 110, 500);
    rect(135, 400, 260, 35, 5,5);
    fill(0);
    textSize(15);
    text("My powers don't seem to affect it.", 140, 425);
  }
  if (sf>=34 && sf<=35)
  {
    noStroke();
    fill(255);
    triangle(140, 430, 140, 435, 110, 500);
    rect(135, 400, 100, 35, 5,5);
    fill(0);
    textSize(15);
    text("I'm screwed!", 140, 425);
  }
  if (sf>=10 && sf<=11)
  {
    noStroke();
    fill(255);
    triangle(540, 330, 540, 335, 530, 340);
    rect(535, 300, 145, 35, 5,5);
    fill(0);
    textSize(15);
    text("RAAAAAAAAAAAA!", 540, 325);
  }
  if (sf>=40 && sf<=41)
  {
    noStroke();
    fill(255);
    triangle(140, 430, 140, 435, 110, 500);
    rect(135, 400, 80, 35, 5,5);
    fill(0);
    textSize(15);
    text("What the?", 140, 425);
  }
  if (sf>=45 && sf<=46)
  {
    noStroke();
    fill(255);
    triangle(140, 430, 140, 435, 110, 500);
    rect(135, 400, 230, 35, 5,5);
    fill(0);
    textSize(15);
    text("Where's the rest of the Team?", 140, 425);
  }
  if (sf>=54 && sf<=55)
  {
    noStroke();
    fill(255);
    triangle(640, 430, 640, 435, 690, 500);
    rect(535, 400, 130, 35, 5,5);
    fill(0);
    textSize(15);
    text("What did I miss?", 540, 425);
  }
  if (sf>=56 && sf<=57)
  {
    noStroke();
    fill(255);
    triangle(140, 430, 140, 435, 110, 500);
    rect(135, 400, 240, 35, 5,5);
    fill(0);
    textSize(15);
    text("Just defeat this thing, Caroline!", 140, 425);
  }
  if (sf>=58 && sf<=59)
  {
    noStroke();
    fill(255);
    triangle(640, 430, 640, 435, 690, 500);
    rect(535, 400, 170, 35, 5,5);
    fill(0);
    textSize(15);
    text("Don't push it, Jennifer!", 540, 425);
  }
  if (sf>=96 && sf<=97)
  {
    noStroke();
    fill(255);
    triangle(640, 430, 640, 435, 690, 500);
    rect(535, 400, 150, 35, 5,5);
    fill(0);
    textSize(15);
    text("Well,that was easy.", 540, 425);
  }
  if (sf>=98 && sf<=99)
  {
    noStroke();
    fill(255);
    triangle(140, 430, 140, 435, 110, 500);
    rect(135, 400, 160, 35, 5,5);
    fill(0);
    textSize(15);
    text("That's it! I'm leaving!", 140, 425);
  }
  if (sf>=102 && sf<=103)
  {
    noStroke();
    fill(255);
    triangle(640, 430, 640, 435, 690, 500);
    rect(535, 400, 160, 35, 5,5);
    fill(0);
    textSize(15);
    text("What's her problem?", 540, 425);
  }
}
void energy()
{
  int sg=millis()/1000;
  //DARKNESS//
  if (sg>=16 && sg<=31)
  {
    fill(50);
    stroke(50);
    strokeWeight(3);
    line(125, 540, g, i);
    g=g+h;
    if (g>=500)
    {
      g=500;
    }
    if (sg>=23)
    {
      i=i-j;
    }
    if (i<=340)
    {
      i=i+j;
    }
  }
  //ICE//
  if (sg>=60 && sg<=95)
  {
    fill(150, 250, 250);
    stroke(150, 250, 250);
    strokeWeight(3);
    line(676, 540, o, q);
    o=o-p;
    if (o<=515)
    {
      o=515;
    }
    if ((sg>=64 && sg<=72) ||(sg>=79 && sg<=88))
    {
      q=q-r;
    }
    if ((sg>=72 && sg<=79) || (sg>=88 && sg<=92))
    {
      q=q+.70;
    }
  }
}
void caroline()
{
  int sh=millis()/1000;
  if (sh>=100)
  {
    //PYROSKIN//
    noStroke();
    //LEFT LEG//
    fill(195, 60, 15);
    beginShape();
    vertex(v+99, w+46);
    vertex(v+95, w+70);
    vertex(v+88, w+70);
    vertex(v+92, w+46);
    endShape();
    beginShape();
    vertex(v+95, w+70);
    vertex(v+95, w+95);
    vertex(v+88, w+95);
    vertex(v+88, w+70);
    endShape();
    arc(v+88, w+95, 10, 10, PI, TWO_PI);
    //LEFT ARM//
    fill(230, 95, 45);
    ellipse(v+80, w+37, 4, 4);
    beginShape();
    vertex(v+106, w+14);
    vertex(v+90, w+30);
    vertex(v+80, w+39);
    vertex(v+80, w+35);
    vertex(v+85, w+30);
    vertex(v+96, w+14);
    endShape();
    //HEAD & BODY//
    fill(195, 60, 15);
    rect(v+92, w+14, 13, 15);
    ellipse(v+93, w+20, 5, 10);
    rect(v+92, w+29, 13, 17);
    fill(250, 70, 10);
    ellipse(v+97, w+4, 13, 20);
    fill(250, 160, 10);
    arc(v+97, w, 13, 16, PI, TWO_PI);
    quad(v+104, w, v+99, w, v+100, w+14, v+105, w+14);
    //RIGHT LEG//
    fill(195, 60, 15);
    beginShape();
    vertex(v+105, w+46);
    vertex(v+107, w+70);
    vertex(v+100, w+70);
    vertex(v+96, w+46);
    endShape();
    beginShape();
    vertex(v+107, w+70);
    vertex(v+114, w+95);
    vertex(v+108, w+95);
    vertex(v+100, w+70);
    endShape();
    arc(v+107, w+95, 9, 9, PI, TWO_PI);
    //RIGHT ARM//
    fill(230, 95, 45);
    ellipse(v+80, w+46, 4, 4);
    beginShape();
    vertex(v+104, w+16);
    vertex(v+95, w+32);
    vertex(v+80, w+49);
    vertex(v+80, w+43);
    vertex(v+90, w+32);
    vertex(v+98, w+16);
    endShape();
    //FACE//
    stroke(0);
    strokeWeight(1);
    line(v+95, w+9, v+92, w+9);
    fill(255);
    ellipse(v+93, w+3, 3, 2);
    strokeWeight(2);
    point(v+92, w+3);
    if (sh>=104)
    {
      w=w-5;
    }
  }
  if (sh>=50 && sh<=103)
  {
    //CYROSKIN//
    noStroke();
    //LEFT LEG//
    fill(100, 250, 250);
    beginShape();
    vertex(m+99, 546);
    vertex(m+95, 570);
    vertex(m+88, 570);
    vertex(m+92, 546);
    endShape();
    beginShape();
    vertex(m+95, 570);
    vertex(m+95, 595);
    vertex(m+88, 595);
    vertex(m+88, 570);
    endShape();
    arc(m+88, 595, 10, 10, PI, TWO_PI);
    //LEFT ARM//
    fill(125, 250, 250);
    ellipse(m+80, 537, 4, 4);
    beginShape();
    vertex(m+106, 514);
    vertex(m+90, 530);
    vertex(m+80, 539);
    vertex(m+80, 535);
    vertex(m+85, 530);
    vertex(m+96, 514);
    endShape();
    //HEAD & BODY//
    fill(100, 250, 250);
    rect(m+92, 514, 13, 15);
    ellipse(m+93, 520, 5, 10);
    rect(m+92, 529, 13, 17);
    fill(190, 240, 240);
    ellipse(m+97, 504, 13, 20);
    fill(220, 240, 240);
    arc(m+97, 500, 13, 16, PI, TWO_PI);
    quad(m+104, 500, m+99, 500, m+100, 514, m+105, 514);
    //RIGHT LEG//
    fill(100, 250, 250);
    beginShape();
    vertex(m+105, 546);
    vertex(m+107, 570);
    vertex(m+100, 570);
    vertex(m+96, 546);
    endShape();
    beginShape();
    vertex(m+107, 570);
    vertex(m+114, 595);
    vertex(m+108, 595);
    vertex(m+100, 570);
    endShape();
    arc(m+107, 595, 9, 9, PI, TWO_PI);
    //RIGHT ARM//
    fill(125, 250, 250);
    ellipse(m+80, 546, 4, 4);
    beginShape();
    vertex(m+104, 516);
    vertex(m+95, 532);
    vertex(m+80, 549);
    vertex(m+80, 543);
    vertex(m+90, 532);
    vertex(m+98, 516);
    endShape();
    //FACE//
    stroke(0);
    strokeWeight(1);
    line(m+95, 509, m+92, 509);
    fill(255);
    ellipse(m+93, 503, 3, 2);
    strokeWeight(2);
    point(m+92, 503);
    m=m-n;
    n=n+.03;
    if (m<=600)
    {
      m=600;
    }
  }
}
void ice()
{
  int si=millis()/1000;
  if (si>=64)
  {
    fill(150, 250, 250, 100);
    noStroke();
    rect(475, 540, 50, -t);
    t=t+.5;
    if (t>=260)
    {
      t=260;
    }
  }
  if (si>=78)
  {
    fill(150, 250, 250, 100);
    rect(475, 540, 50, u);
    u=u+.5;
    if (u>=55)
    {
      u=55;
    }
  }
}
void rain()
{
  int sj=millis()/1000;
  if (sj>=110)
  {
    fill(20, 180, 245);
    noStroke();
    int bj=1;
    while (bj<=500)
    {
      ellipse(int(random(801)), int(random(701)), 2, 8);
      bj++;
    }
  }
}


