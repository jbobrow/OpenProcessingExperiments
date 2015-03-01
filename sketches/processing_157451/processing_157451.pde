
import processing.video.*;
int tag=7;
int x1, y1;
int l=0;
int min;
boolean count=false;
boolean next=false;
int scoremin=0;
int score=0;
boolean printScore=false;
int sec;
int start;
int endSec=80;
PFont New;
int Stetus=1;


Capture cam;

color trackColor=color(255, 255, 0);
int suspend=50;//the gate for how long have color
int door=200;//the gate for the color

void setup() {
  size(640, 480);
  CamSetUp();
  New = loadFont("Ubuntu-Bold-120.vlw");
  textFont(New);
}

void draw() {
  switch(Stetus)
  {
  case 1:
    step1();
    break;
  case 2:
    step2();
    break;
  case 3:
    step3();
    break;
  }
}

void step1() {
  background(20);
  int countDown=10-int(millis()/1000);
  textAlign(CENTER, CENTER);
  fill(255, 255-l);
  textSize(100);
  if(countDown>0)
  {
  text(countDown, width/2, height/2);
  }else
  {
    Stetus=2;
  }
}

void step2() {
  DrawWhiteCircle();
  PrintScore();
  colorChange();
  drawSc();
  if (255-l>80)
  {
    fill(trackColor, 255-l);
  } else {
    fill(trackColor, 80);
  }  
  rect(x1, y1, width/3, height/3);
  l++;
  fill(255);
  textSize(30);
  text("score: "+score, width-80, height-30);
  start=int(millis()/1000)-10;
  textAlign(LEFT, CENTER);
  text("time: "+start+" sec", 10, height-30);
  if (start==endSec)
  {
    Stetus=3;
  }
}

void step3(){
  if (cam.available() == true) {
    cam.read();
  }
  cam.loadPixels();
  image(cam, 0, 0);
  fill(255);
  float sin=sin(millis()*0.007);
  float SizeOfText=map(sin,-1,1,80,100);
  textSize(SizeOfText);
  textAlign(CENTER,CENTER);
  text("score: "+score, width/2, height/2);
  
}

void CamSetUp() {

  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    cam = new Capture(this, width, height);

    cam.start();
  }
}

void DrawWhiteCircle() {
  if (cam.available() == true) {
    cam.read();
  }
  cam.loadPixels();
  image(cam, 0, 0);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);


  float worldRecord = 500;

  int closestX = 0;
  int closestY = 0;
  float d=0;

  for (int x=0; x<cam.width; x++)
  {
    for (int y=0; y<cam.height; y++)
    {
      int loc = x + y*cam.width;
      color currentColor = cam.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      // Using euclidean distance to compare colors
      d = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }
  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  if (worldRecord < door) { 
    // Draw a circle at the tracked pixel
    fill(trackColor);
    IfInside(closestX, closestY);
    noStroke();
    ellipse(closestX,closestY,50,50);
  }
}

void IfInside(int x, int y) {
  int a=0;
  if (x>0 && x<width/3 && y>0 && y<height/3)
  {
    a=1;
  }
  if (x>width/3 && x<width*2/3 && y>0 && y<height/3)
  {
    a=2;
  }
  if (x>width*2/3 && x<width && y>0 && y<height/3)
  {
    a=3;
  }
  if (x>0 && x<width/3 && y>height/3 && y<height*2/3)
  {
    a=4;
  }
  if (x>width/3 && x<width*2/3 && y>height/3 && y<height*2/3)
  {
    a=5;
  }
  if (x>width*2/3 && x<width && y>height/3 && y<height*2/3)
  {
    a=6;
  }
  if (x>0 && x<width/3 && y>height*2/3 && y<height)
  {
    a=7;
  }
  if (x>width/3 && x<width*2/3 && y>height*2/3 && y<height)
  {
    a=8;
  }
  if (x>width*2/3 && x<width && y>height*2/3 && y<height)
  {
    a=9;
  }

  if (a==tag)
  {    
    println("in");
    scoremin++;
    if (scoremin%suspend==0)
    {
      next=true;
      score++;
      printScore=true;
      scoremin=0;
    }

    println(scoremin);
    println("score now is "+score);
  }
}

void PrintScore() {
  if (printScore)
  {
    l=0;
  }
  println(printScore);
  textAlign(CENTER,CENTER);
  fill(255, 255-l);
  textSize(300);
  text(score, width/2, height/2);
  l+=0.9;
  printScore=false;
}

void colorChange() {

  sec++;

  if (sec%400==0 || next)
  {
    next=false;
    sec=0;
    scoremin=0;
    if (!count)
    {
      whatColor();//change the color
      count=true;
    }
    showNowColor();
  } else {
    count=false;
  }
}

void whatColor() {
  min=int(random(1000));
  switch(min%4)
  {
  case 0:
    trackColor=color(0, 0, 255);//blue

    break;
  case 1:
    trackColor=color(255, 0, 0);//red

    break;
  case 2:
    trackColor=color(0, 255, 0);//green

    break;
  case 3:
    trackColor=color(255, 255, 0);//yellow

    break;
  }
}

void drawSc() {
  strokeWeight(5);
  stroke(255, 80);
  line(width/3, 0, width/3, height);
  line(width*2/3, 0, width*2/3, height);
  line(0, height/3, width, height/3);
  line(0, height/3*2, width, height/3*2);
}

void showNowColor() {
  fill(trackColor);
  selectSc();
}

void selectSc() {

  x1=0;
  y1=0;
  switch(min%9)
  {
  case 0:
    x1=0;
    y1=0;
    break;
  case 1:
    x1=width/3;
    y1=0;
    break;
  case 2:
    x1=width*2/3;
    y1=0;
    break;
  case 3:
    x1=0;
    y1=height/3;
    break;
  case 4:
    x1=width/3;
    y1=height/3;
    break;
  case 5:
    x1=width*2/3;
    y1=height/3;
    break;
  case 6:
    x1=0;
    y1=height*2/3;
    break;
  case 7:
    x1=width/3;
    y1=height*2/3;
    break;
  case 8:
    x1=width*2/3;
    y1=height*2/3;
    break;
  }

  tag=min%9+1;
  //                          println("now "+min%9+" tag "+tag);
}



