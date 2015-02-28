
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage vortex;
int a=int(random(30));
int b=0;
boolean mode=true;
void setup()
{
  size(800, 600);
  minim = new Minim(this);
  player = minim.loadFile("Doctor Who Theme.mp3");
  player.loop();
  vortex=loadImage("Vortex.png");
}
void draw()
{
  background(0);
  image(vortex, b, b, width, height);
  b=b+int(random(-3, 3));
  if(b<0)
  {
    b=b+4;
  }
  if(b>=16)
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
    if (a==0)
    {
      text(answers[0], 400, 550);
    }
    else if (a==1)
    {
      text(answers[1], 400, 550);
    }
    else if (a==2)
    {
      text(answers[2], 400, 550);
    }
    else if (a==3)
    {
      text(answers[3], 400, 550);
    }
    else if (a==4)
    {
      text(answers[4], 400, 550);
    }
    else if (a==5)
    {
      text(answers[5], 400, 550);
    }
    else if (a==6)
    {
      text(answers[6], 400, 550);
    }
    else if (a==7)
    {
      text(answers[7], 400, 550);
    }
    else if (a==8)
    {
      text(answers[8], 400, 550);
    }
    else if (a==9)
    {
      text(answers[9], 400, 550);
    }
    else if (a==10)
    {
      text(answers[10], 400, 550);
    }
    else if (a==11)
    {
      text(answers[11], 400, 550);
    }
    else if (a==12)
    {
      text(answers[12], 400, 550);
    }
    else if (a==13)
    {
      text(answers[13], 400, 550);
    }
    else if (a==14)
    {
      text(answers[14], 400, 550);
    }
    else if (a==15)
    {
      text(answers[15], 400, 550);
    }
    else if (a==16)
    {
      text(answers[16], 400, 550);
    }
    else if (a==17)
    {
      text(answers[17], 400, 550);
    }
    else if (a==18)
    {
      text(answers[18], 400, 550);
    }
    else if (a==19)
    {
      text(answers[19], 400, 550);
    }
    else if (a==20)
    {
      text(answers[20], 400, 550);
    }
    else if (a==21)
    {
      text(answers[21], 400, 550);
    }
    else if (a==22)
    {
      text(answers[22], 400, 550);
    }
    else if (a==23)
    {
      text(answers[23], 400, 550);
    }
    else if (a==24)
    {
      text(answers[24], 400, 550);
    }
    else if (a==25)
    {
      text(answers[25], 400, 550);
    }
    else if (a==26)
    {
      text(answers[26], 400, 550);
    }
    else if (a==27)
    {
      text(answers[27], 400, 550);
    }
    else if (a==28)
    {
      text(answers[28], 400, 550);
    }
    else if (a==29)
    {
      text(answers[29], 400, 550);
    }
    else 
    {
      text(answers[30], 400, 550);
    }
    fill(127, 0, 255);
    stroke(127, 0, 255);
    triangle(375, 375, 425, 375, 400, 425);
  }
}
void mousePressed()
{
  mode= !mode;
  a=int(random(30));
  redraw();
}


