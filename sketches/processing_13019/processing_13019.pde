
import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup()
{
  size(512, 512, P2D);
  frameRate(10);
  minim = new Minim(this);
  // load a file, give the AudioPlayer buffers that are 2048 samples long
  player = minim.loadFile("Falltan.mp3", 2048);
  // play the file
  player.play();
  background(0);
  stroke(0,64);
  strokeWeight(3);
  noCursor();
}

int lChannel, rChannel, i, sphoff;

void draw()
{
  sphoff = int(random(-25,25));
  lChannel = int((player.left.get(i) + 1.0)%99*900000000);
  rChannel = int((player.right.get(i) + 1.0)%77*700000000);
  fill(lChannel,160);
  triangle(0,0,mouseX/2,mouseY/2,0,height/2);
  fill(rChannel,160);
  triangle(0,0,width/2,0,mouseX/2,mouseY/2);
  fill(rChannel*2,160);
  triangle(width/2,0,width,0,mouseX,mouseY);
  fill(lChannel*2,160);
  triangle(width/2,0,mouseX/2,mouseY/2,mouseX,mouseY);
  fill(rChannel*3,160);
  triangle(0,height/2,mouseX/2,mouseY/2,0,height);
  fill(lChannel*3,160);
  triangle(0,height,mouseX,mouseY,width/2,height);
  fill(lChannel*3/2,160);
  triangle(0,height,mouseX,mouseY,mouseX/2,mouseY/2);
  fill(rChannel*3/2,160);
  triangle(width/2,height,mouseX,mouseY,width,height);
  fill(rChannel*4/3,160);
  triangle(width,height,mouseX,mouseY,width,height/2);
  fill(lChannel*4/3,160);
  triangle(width,0,mouseX,mouseY,width,height/2);
  i++;
  fill(0,1);
  rect(0,0,width,height);
/*  for(int i = 0; i < width+1; i+=16)
  {
    lChannel = int((player.left.get(i) + 1.0)*200000000);
    stroke(lChannel);
    curve(float(i), 0.0, float(mouseX/2), float(mouseY/2),20,20,50,60);
    curve(float(width), float(i), float(mouseX/2), float(mouseY/2),20,20,50,60);
    rChannel = int((player.right.get(i) + 1.0)*200000000);
    stroke(rChannel);
    curve(float(width), float(i), float(mouseX/2), float(mouseY/2),20,20,50,60);
    line(i, height, 128, 128);
  }*/
}

void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();
  
  super.stop();
}

