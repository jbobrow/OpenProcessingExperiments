
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage img, img2;
int d=1;
void setup()
{
  size(1200, 900);
  img2=loadImage("Luigi's Mansion.png");
  img=loadImage("Professor E. Gadd & Luigi.png");
  minim = new Minim(this);
  player = minim.loadFile("Audio 4.mp3");
  player.loop();
}
void draw()
{
  frameRate(1);
  background(0);
  int t=millis()/1000;
  if (t<=5)
  {
    image(img, 0, 0);
    speech();
  }
  if (t>=5)
  {
    image(img2, -130, -100);
    boo();
  }
}
void speech()
{
  fill(255);
  stroke(255);
  rect(100, 50, 260, 60, 5,5);
  triangle(320, 110, 300, 110, 300, 150);
  fill(0);
  textSize(20);
  text("Ssss...so I should capture \nga-ga-ghosts?", 105, 70);
  fill(255);
  rect(500, 250, 260, 60, 5,5);
  triangle(720, 310, 700, 310, 700, 350);
  fill(0);
  textSize(20);
  text("Well, yeah, but here's the \nproblem. Look outside.", 505, 270);
}
void boo()
{
  int s=millis()/1000;
  if (s>=5)
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
    if (d>=8192)
    {
      d=1;
    }
  }
}


