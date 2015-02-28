
int numFrames=14;
int numFrames1=7;
int frame=0;
int t=0;
int x= 0;
int frame1=0;
PImage[] images= new PImage[numFrames];
PImage[] images1=new PImage[numFrames1];
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PImage bg;

void setup () {
  size (640, 480);
  frameRate (30);
  bg=loadImage("stage.jpg");


  images[0] = loadImage("body1.png");
  images[1] = loadImage("body2.png");
  images[2] = loadImage("body3.png");
  images[3] = loadImage("body4.png");
  images[4] = loadImage("body5.png");
  images[5] = loadImage("body6.png");
  images[6] = loadImage("body7.png");
  images[7] = loadImage("body8.png");
  images[8] = loadImage("body9.png");
  images[9] = loadImage("body10.png");
  images[10] = loadImage("body11.png");
  images[11] = loadImage("body12.png");
  images[12] = loadImage("body13.png");
  images[13] = loadImage("body14.png");

  images1[0] = loadImage("head15.png");
  images1[1] = loadImage("head16.png");
  images1[2] = loadImage("head17.png");
  images1[3] = loadImage("head18.png");
  images1[4] = loadImage("head19.png");
  images1[5] = loadImage("head20.png");
  images1[6] = loadImage("head21.png");



  minim = new Minim(this);
  player= minim.loadFile("audio1.mp3", 1024);
  player.play();
}

void draw () {
  background(bg);
  
  
fill(200,0,0);
  rect (300,130,40,20);

  
  
 while(frame1<=3){
  fill(random(255),random(200) , random(255));
  ellipse (random(600), 10, 50, 50);
  frame1++;
}



  if (frame>=numFrames) {
    frame=0;
  }

  if (frame1>=numFrames1) {
    frame1=0;
  }
  
  for (int x=5; x<height; x+=5) {
    fill(random (200, 255));
  if (x<600) {
      ellipse(x*2, 480, 50, 50);
    }
  }


  image(images1[frame1], 0, 0);
  image(images[frame], 0, 0);


  
  if (frame<=6) {
    fill(20, 20, 200);
    ellipse(550, 100, 50, 50);
    fill(120, 50, 100);
    ellipse(150, 100, 50, 50);
    fill(200, 50, 50);
    ellipse(500, 100, 50, 50);
    fill(20, 100, 150);
    ellipse(100, 100, 50, 50);
    fill(20, 200, 20);
    ellipse(600, 100, 50, 50);
    fill(200, 20, 20);
    ellipse(200, 100, 50, 50);
  }
  else {
    fill(120, 50, 100);
    ellipse(550, 100, 50, 50);
    fill(20, 20, 200);
    ellipse(150, 100, 50, 50);
    fill(20, 100, 150);
    ellipse(500, 100, 50, 50);
    fill(200,50, 50);
    ellipse(100, 100, 50, 50);
    fill(200,20, 20);
    ellipse(600, 100, 50, 50);
     fill(20, 200, 20);
    ellipse(200,100, 50, 50);
  }

}


void keyPressed() {
  int keyIndex= -1;
  if (key>='A'&& key<='Z') {
    keyIndex =key - 'A';
  } 
  else if (key >='a' && key <='z') {
    keyIndex=key-'a';
  }
  if (keyIndex== -1) {
    frame1=frame1 +1;
  } 
  else {
    frame=frame +2;
  }
}

void stop()
{

  player.close();
  minim.stop();


  super.stop();
}


