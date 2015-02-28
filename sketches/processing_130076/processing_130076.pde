
/*Background Music:
 "Sweet" by Sophonic
 http://www.youtube.com/watch?v=KbCmdkXzuKk&list=FLzccccOzciIoyFhf3MA53Xw
 */
PFont fonti, font, fontbig;
int c=100; //Main font color
int time;
int s=30;
float theta1=0, theta2=0, theta=0;
int rectx=300;
int ix=600, iy=300, iy2=300;
float ix3=400, iy3=340;
//Walk
int a=1, v=1;
int size=50;
import ddf.minim.*;
Minim minim;
AudioPlayer player;
void setup()
{
  size(1200, 600);
  textAlign(CENTER, CENTER);
  smooth(5);
  frameRate=30;
  //fonts
  fonti= loadFont("STLiti-80.vlw");
  font= createFont("HelveticaNeue", 100);
  fontbig= createFont("HelveticaNeue", 300);
  minim = new Minim(this);
  player = minim.loadFile("bk.mp3");
  player.play();
}

void draw()
{
  //background
  fill(255, 70);
  rect(0, 0, 1200, 600);
  fill(c);
  //Scene 1
  if (frameCount<=2*s)
  {
    textFont(font, 30);
    text("Everyday", 200, 100);
  }
  //Scene 2
  if (frameCount>2*s && frameCount<8.5*s) {
    textFont(fonti, 80);
    fill(255, 165, 0);
    text("i", width/2, height/2);
    if (frameCount>4*s && frameCount<8*s) {
      String eat="EAT";
      textFont(font, 30);
      if (frameCount>5*s && frameCount<8*s)
      {
        if (frameCount>5*s && frameCount<=6*s) eat="EA";
        if (frameCount>6*s && frameCount<=7*s) eat="E";
        if (frameCount>7*s && frameCount<=8*s) eat=" ";
      }
      for (int i=0;i<eat.length();i++)
      {
        fill(c);
        text(eat.charAt(i), width/2-textWidth(eat)+20*i, height/2-10);
      }
    }
  }
  //Scene 3
  if (frameCount>9*s && frameCount<12*s)
  {
    pushMatrix();
    translate(width/2, height/2);
    textAlign(CENTER, BOTTOM);
    textFont(fonti, 80);
    rotate(theta1);
    fill(255, 165, 0);
    text("i", 0, 45);
    popMatrix();
    if (frameCount>10*s && frameCount<12*s) {
      textFont(font, 30);
      rotate(0);
      fill(c);
      text("SLEEP", width/2, height/2+40);
      if (theta1>-1.57) 
        theta1-=.05;
    }
  }
  //Scene 4
  if (frameCount>13*s && frameCount<17*s)
  {
    fill(255, 165, 0);
    textAlign(CENTER, CENTER);
    textFont(fonti, 80);
    text("i", width/2, height/2);
    if (frameCount>15*s && frameCount<17*s) {
      fill(255);
      stroke(c);
      ellipse(width/2+55, height/2-40, 90, 40);
      fill(c);
      textFont(font, 30);
      text("TALK", width/2+51, height/2-40);
    }
  }
  //Scene 5
  if (frameCount>18*s && frameCount<22*s) {
    fill(255, 165, 0);
    textFont(fonti, 80);
    text("i", ix, height/2);
    if (frameCount>19*s && frameCount<22*s)
    { 
      textFont(font, 20);
      fill(c);
      text("WA    LK", ix, height/2+10);
      if (ix>=width/2-20 && ix<=width/2+20) ix= ix+a;
      if (ix==width/2-20 || ix==width/2+20) a=-a;
    }
  }
  //Scene 6
  if (frameCount>23*s && frameCount<=25*s)
  {
    fill(c);
    textFont(font, 30);
    text("Most of the time", 200, 100);
  }
  //Scene 7
  if (frameCount>25*s && frameCount<=30*s)
  {
    fill(255, 165, 0);
    textFont(font, 30);
    text("i", width/2, height/2);
    if (frameCount>26*s && frameCount<=30*s)
    {
      text("i", width/2-40, height/2);
      textFont(font, 50);
      text("U", width/2-20, height/2+30);
      textFont(font, 20);
      fill(c);
      text("'m Happy", width/2+50, height/2);
    }
  }
  //Scene 8
  if (frameCount>30*s && frameCount<=32*s)
  {
    textFont(font, 30);
    text("But sometimes...", 200, 100);
  }
  //Scene 9
  if (frameCount>32*s && frameCount<=37*s) {
    textFont(font, 30);
    text("i", width/2, height/2);
    if (frameCount>33*s && frameCount<=35*s)
    {
      textFont(font, 25);
      text("feel lost", width/2+60, height/2);
    }
    if (frameCount>35*s && frameCount<=37*s)
    {
      isea();
    }
  }
  //Scene 10
  if (frameCount>38*s && frameCount<=43*s) {
    textFont(font, 30);
    text("i", width/2, height/2);
    if (frameCount>39*s && frameCount<=43*s)
    {
      textFont(font, 25);
      text("feel traped", width/2+80, height/2);
    }
    if (frameCount>41*s && frameCount<=43*s)
    {
      noFill();
      stroke(0);
      strokeWeight(2);
      rectMode(CENTER);
      rect(width/2, height/2, 30, 30);
    }
    noStroke();
    rectMode(LEFT);
  }
  //Scene 11 I'm Sad
  fill(c);
  if (frameCount>44*s && frameCount<=49*s)
  {
    textFont(font, 30);
    text("i", width/2, height/2);
    if (frameCount>45*s && frameCount<=49*s)
    {
      textFont(font, 30);
      text("'m        ad", width/2+70, height/2);
      pushMatrix();
      translate(width/2+70, height/2+10);
      textAlign(CENTER, BOTTOM);
      textFont(font, 100);
      rotate(theta2);
      fill(17, 44, 144);
      text("S", 0, 20);
      popMatrix();      
      if (frameCount>46*s && theta2>-1.57) theta2-=.05;
    }
  }
  //Scene 12
  if (frameCount>50*s && frameCount<=55*s)
  {
    fill(c);
    textFont(font, 30);
    text("i", width/2, iy);
    if (frameCount>51*s && frameCount<=55*s)
    {
      fill(200, 0, 0);
      textFont(font, 30);
      text("fall", width/2, iy);
      iy+=5;
    }
  }

  //Scene 13
  if (frameCount>56*s && frameCount<=58*s)
  {
    fill(c);
    textFont(font, 30);
    text("But I know...", 200, 100);
  }
  //Scene 14 I am not alone
  if (frameCount>59*s && frameCount<=64*s)
  {
    fill(255, 165, 0);
    textFont(fonti, 40);
    text("i", width/2, height/2);
    if (frameCount>60*s && frameCount<=64*s)
    {
      textFont(font, 30);
      fill(c);
      text(" 'm not alone", width/2+90, height/2);
      for (int i=0;i<20;i++)
      {
        fill(255, 165, 0);
        textFont(fonti, 40);
        text("i", width/2, 50*i);
      }
    }
  }
  //Scene 15 Everyone has bad days
  fill(c);
  if (frameCount>65*s && frameCount<=76*s)
  {
    textFont(font, 30);
    if (frameCount>65*s && frameCount<=70*s) text("Everyone has bad days", 300, 100);
    if (frameCount>70*s && frameCount<=74*s) text("But there are also good times", 300, 100);
    if (frameCount>66*s && frameCount<=74*s)
    {
      textFont(fontbig);
      textAlign(CENTER, BOTTOM);
      text("U", width/2, height-50);
      pushMatrix();
      translate(width/2, iy2);
      textFont(font, 30);
      if (frameCount>65*s && frameCount<=70*s) {
        if (iy2<380) theta=theta+random(-.05, .05);
        else theta=theta;
        rotate(theta);  
        text("i", 40, iy2-300);
        if (iy2<380) 
        {
          iy2+=1;
        }
      }
      //Scene 16 
      if (frameCount>70*s && frameCount<=74*s)
      {
        fill(255, 165, 0);
        text("i", 40-0.5*a, iy2-300);
        if (iy2>300) 
        {
          iy2--;
          a++;
        }
      }
      popMatrix();
    }
  }
  translate(0, 0);
  textAlign(CENTER, CENTER);
  //Scene 16 Life has its ups and downs
  if (frameCount>75*s && frameCount<78*s)
  {
    fill(c);
    text("Life has its ups and downs", 300, 100);
  }
  //Scene 17 
  if (frameCount>78*s && frameCount<=86*s)
  {
    textFont(fontbig,100);
    fill(180);
    text("WWWWWW", width/2, height-200);
  }
  //Scene 18
  if (frameCount>78*s && frameCount<=86*s)
  {
    textFont(font, 30);
    fill(210, 210, 20);
    text("Just Keep Calm and Carry On ", 300, 100);
  }
  if (frameCount>79*s && frameCount<92*s)
  { 
    fill(255, 165, 0);
    textFont(fonti, size);
    text("i", ix3, iy3);
    ix3=ix3+0.5;
    if (iy3==400) v=-v;
    if(iy3>250)iy3=iy3+v;
    if(frameCount>90*s && frameCount<92*s) size++;
  }
  if(frameCount>92*s && frameCount<102*s)
    {
    fill(255, 165, 0);
    textFont(fonti, size);
    text("i", ix3, iy3);
    fill(255, 165, 0);
    textFont(font, 20);
    text("Made by: Chen Qianxun", 1000,500);
    }
    if(frameCount==104*s)
    {
      print(millis()/1000);
      exit();
    }
}

void isea() {
  for (int i=0;i<100;i++)
  {
    float theta=random(-1, 1);
    rotate(theta);
    textFont(font, random(30, 80));
    fill(random(0, 200));
    text("i", random(0, width), random(0, height));
  }
}


