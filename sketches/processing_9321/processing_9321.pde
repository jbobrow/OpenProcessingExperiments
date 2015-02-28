


int x ;
int y;
int v;
int w;
int boatx;
int boaty;
int boatx_w;
int fishx;
int fishy;
int birdx;
int birdy;
int [][] birdsArray;
int birdcounter = 0;
PFont font;

  
 

void setup()
{
  println("Tasha Thiebaut");
  println("Project 1: I'm on a boat!");
  println("Left and right keys move boat. Click on fish and drag. Click birds button to create flocks of birds!");
  size(600,600);
  background(255,160,100);
  smooth();
  x = 600;
  y = 450;
  v = -120;
  w = 460;
  boatx = 300;
  boaty= 350;
  boatx_w= boatx;
  fishx = 300;
  fishy = 500;
  birdx=500;
  birdy=200;
  birdsArray= new int[50][50];
  font=loadFont("ArialMT-48.vlw");
}

void draw()
{ 
  drawBackground();
  drawBirds();
  drawBoat();
  animateWaves();
  drawWaves2();
  drawFish();
  dragFish();
  drawBirdButton();
}

void animateWaves()
{
  x = x+1;
  v = v-1;
  if(x==720)
  {
     x = 600;
  }
   if (v ==530)
   {
     v = 650;
   }
   
}
void drawWaves2()
{
  drawWaves1();
  for (int p = v; p < 800;p = p+120)
  { 
    fill(100,200,255);
    beginShape();
    vertex(p,y);
    bezierVertex(p,w,p-100,w-100,p-150,w-50);
    bezierVertex(p-150,w-50,p-100,w-50,p-100,w);
    endShape();
  }
  rect(0,y,600,y);    
}

void drawWaves1()
{
  drawBoat();
  noStroke();
  for (int p = x; p > -300;p = p-120)
  { 
    fill(200,250,255);
    beginShape();
    vertex(p,y);
    bezierVertex(p,y,p+100,y-100,p+150,y-50);
    bezierVertex(p+150,y-50,p+100,y-50,p+100,y);
    endShape();  
  }
}

void drawBackground()
{
  fill(255,227,201);
  rect(0,0,600,600);
}

void drawBoat()
{
  drawBoatMast();
  drawBoatBase();
  drawBoatSail();
}
void drawBoatBase()
{
  fill(103,61,22);
  beginShape();
  vertex(boatx,boaty);
  arc(boatx,boaty,boatx_w+50, boaty,0,PI);
  endShape(CLOSE);
  fill(147,87,31);
  beginShape();
  vertex(boatx+10,boaty+10);
  arc(boatx-10,boaty,boatx_w+50,boaty,0,PI);
  endShape(CLOSE);
}

void drawBoatMast()
{
  fill(103,61,22);
  rect(boatx-5,boaty-200,10,200);
  fill(103,61,22);
  quad(boatx-45, boaty,boatx+45,boaty,boatx+40,boaty-10,boatx-40,boaty-10);
}

void drawBoatSail()
{
  fill(230,230,230);
  triangle(boatx,boaty-190,boatx+100,boaty-140,boatx,boaty-90);
  fill(255,255,255);
  triangle(boatx,boaty-200,boatx+100,boaty-150,boatx,boaty-100);
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      boatx = boatx+1;
    }
    if (keyCode == LEFT)
    {
      boatx = boatx-1;
    }
  }
}

void drawFish()
{
  fill(232,171,96);
  triangle(fishx,fishy,fishx-40,fishy-20,fishx-40,fishy+20);
  ellipse(fishx+10,fishy,50,30);
  stroke(27,108,51);
  strokeWeight(3);
  point(fishx+25,fishy);
  line(fishx+28,fishy+8,fishx+20,fishy+8);
  noStroke();
}

void dragFish()
{
  if(mouseX<600 && mouseX>0 && mouseY>y && mouseY<600)
    {
      if(mousePressed==true && mouseButton == LEFT)
      {
        fishy=mouseY;
        fishx=mouseX;
      }
    }
}

void drawBirdButton()
{
  fill(203,66,66);
  rect(500,10,90,45);
  textFont(font,20);
  strokeWeight(3);
  fill(0,0,0);
  text("BIRDS",515,40);
  noStroke();
  if(mouseX>500 && mouseX<590 && mouseY>10 && mouseY<55)
  {
    fill(253,255,157);
    rect(495,5,100,55);
    fill(203,66,66);
    rect(500,10,90,45);
    fill(0,0,0);
    text("BIRDS",515,40);
    cursor(HAND);
    if(mousePressed==true && mouseButton==LEFT)
    {
      randomizeBirds(); 
    }
  }
  else
  {
    cursor(ARROW);
  }
}

void randomizeBirds()
{
  birdcounter++;
  if(birdcounter==50)
  {
    birdcounter=0;
  }
  birdsArray[birdcounter][0]=int(random(20,580));
  birdsArray[0][birdcounter]=int(random(50,400));
}

void drawBirds()
{
  noFill();
  stroke(0,0,0);
  strokeWeight(2);
  for (int i = 0; i < birdcounter; i++) 
  {
    birdx=birdsArray[i][0];
    birdy=birdsArray[0][i];
    bezier(birdx-10,birdy,birdx-7,birdy-10,birdx-4,birdy-10,birdx,birdy);
    bezier(birdx,birdy,birdx+4,birdy-10,birdx+7,birdy-10,birdx+10,birdy);
  }
  noStroke();
}




