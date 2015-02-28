
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage img, img2, img3, img4;
int d=1;
void setup()
{
  size(1200, 600);
  img=loadImage("Angry Mask Salesman.png");
  img2=loadImage("Termina Bay.png");
  img3=loadImage("Happy Mask Salesman.png");
  img4=loadImage("Angry Mask Salesman 2.png");
  minim = new Minim(this);
  player = minim.loadFile("Hey Listen!.mp3");
  player.play();
}
void draw()
{
  frameRate(1);
  background(0);
  smooth();
  int t=millis()/1000;
  if (t<=6)
  {
    image(img, 0, 0, width, height);
    speech();
  }
  if (t>=66 && t<=71)
  {
    image(img3, 0, 0, width, height);
  }
  if (t>=71)
  {
    image(img4, 0, 0, width, height);
  }
  navi();
}
void speech()
{
  fill(255);
  stroke(255);
  rect(100, 50, 320, 60, 5,5);
  triangle(420, 110, 400, 110, 530, 250);
  fill(0);
  textSize(20);
  text("Explain to me why you failed to \nsave Termina.", 105, 70);
}
void navi()
{
  int s=millis()/1000;
  if (s>=6 && s<=66)
  {
    image(img2, 0, 0);
  }
  if ((s>=6 && s<=66) || s>=71)
  {
    int a=1;
    while (a<=d)
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
      a++;
    }
    d=d*2;
    if (d>2048)
    {
      d=1;
    }
  }
  if (s>=6 && s<=66)
  {
    fill(0, 0, 255);
    stroke(0);
    rect(0, 0, 180, 30);
    fill(255);
    text("Earlier that day...", 5, 20);
  }
}


