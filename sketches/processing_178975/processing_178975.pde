
import ddf.minim.*;

AudioPlayer player;
Minim minim; //audio context

int dc;


void setup() {
  size(displayWidth, displayHeight);
  minim = new Minim(this);
  player = minim.loadFile("Home.mp3", 2048);
  player.play();
  frameRate(2);
}

void draw() {
fill(random(50,150)+dc%255, random(50)+dc%255,0);  
rect(0,0,width,height);
noStroke();
fill(random(150,255)+dc%255, random(50)+dc%255,0);
ellipse(random(width), random(height), 50, 50);
ellipse(random(width), random(height), 60, 60);
ellipse(random(width), random(height), 70, 70);
ellipse(random(width), random(height), 40, 40);
ellipse(random(width), random(height), 50, 50);

int i = (int)random(14);
if(i==0)
  image(loadImage("fluffy.jpg"), width/2+random(-600, 100), height/2+random(-400, 10));
if(i==1)
  image(loadImage("b1.jpg"), width/2+random(-600, 100), height/2+random(-400, 10));
if(i==2)
  image(loadImage("b2.jpg"), width/2+random(-600, 100), height/2+random(-400, 10));
if(i==3)
  image(loadImage("pillowsnuggle.gif"), width/2+random(-600, 100), height/2+random(-400, 10));
if(i==4)
  image(loadImage("lolpear.png"), width/2+random(-600, 100), height/2+random(-400, 10));
if(i==5)
  image(loadImage("sfid.jpg"), width/2+random(-600, 100), height/2+random(-400, 10));
if(i==7)
  image(loadImage("b3.jpg"), width/2+random(-600, 100), height/2+random(-400, 10));
if(i==8)
  image(loadImage("b4.jpg"), width/2+random(-600, 100), height/2+random(-400, 10));
if(i==9)
  image(loadImage("b5.jpg"), width/2+random(-600, 100), height/2+random(-400, 10));
if(i==10)
  image(loadImage("b6.jpg"), width/2+random(-600, 100), height/2+random(-400, 10));
if(i==11)
  image(loadImage("b7.jpg"), width/2+random(-600, 100), height/2+random(-400, 10));
if(i==12)
  image(loadImage("b8.jpg"), width/2+random(-600, 100), height/2+random(-400, 10));
if(i==13)
  image(loadImage("h1.jpg"), width/2+random(-600, 100), height/2+random(-400, 10));
dc++;  
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}


