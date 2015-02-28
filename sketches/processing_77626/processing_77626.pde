
float xpos = random(0, 800);
float ypos;
float xpos2 = random(0, 800);
float ypos2;
float xpos3 = random(0, 800);
float ypos3;
float xpos4 = random(0, 800);
float ypos4;
float xpos5 = random(0, 800);
float ypos5;
float xpos6 = random(0, 800);
float ypos6;
float xpos7 = random(0, 800);
float ypos7;
float xpos8 = random(0, 800);
float ypos8;
float xpos9 = random(0, 800);
float ypos9;
float speed = 1.0;
float speed2 = 10.0;
float score = 0.0;
PFont font;
float br;
float wide;
PImage lose;
PShape redbomb;
PShape bluebomb;
PShape yellowbomb;
PShape greenbomb;
PShape blob;
PShape blobg;
PShape BG;
PShape medi;
PImage start;
PShape about;
int x = 2;

void setup()
{
  size(800, 480);
  rectMode(CENTER);
  //noCursor();
  font = loadFont("AgencyFB-Reg-48.vlw");
  textFont(font);
  br = 50;
  lose = loadImage("ENDSCREEN.png");
  redbomb = loadShape("red.svg");
  bluebomb = loadShape("blue.svg");
  yellowbomb = loadShape("yellow.svg");
  greenbomb = loadShape("green.svg");
  blob = loadShape("blob.svg");
  blobg = loadShape("blobg.svg");
  BG = loadShape("background.svg");
  medi = loadShape("medi.svg");
  start = loadImage("startmenu.jpg");
  about = loadShape("about.svg");
  shapeMode(CENTER);
}

void draw()
{
  if(x==2)
  {
  smooth();  
  image(start,0,-1,800,480);
  text("Start", 636, 200);
  text("About", 636, 313);
  
  if(mousePressed && mouseX>576 && mouseX <771 && mouseY>266 && mouseY <324)
  {
    shape(about,width/2,height/2,width,height);
    text("Click to Start Game",260,470);
    fill(195,73,211);
    text("Cloudy Skies",305,50);
    x = 3;
  }
  
  if(mousePressed && mouseX>576 && mouseX <771 && mouseY>153 && mouseY <212)
  {
    x=0;
  }
  }

  if(x==0)
  {
  fill(0, 100);
  noStroke();
  smooth();
  shape(BG, width/2, height/2, width, height+1);
  wide = 50;
  shape(bluebomb, xpos, ypos, 50, 50);
  ypos+=speed;

  if(score == 5)
  {
  shape(medi,xpos2,ypos2,100,100);
  ypos2+=speed2;
  }
   if(xpos2<=mouseX+wide && xpos2>=mouseX-wide && ypos2 >= 395 && ypos2 < height)
  {
    speed = 1.0;
    speed2 = speed2 +1.0;
    ypos2 = -50;
    xpos2 = -50;
  }
  if(score == 10)
  {
  shape(medi,xpos3,ypos3,100,100);
  ypos3+=speed2;
  }
   if(xpos3<=mouseX+wide && xpos3>=mouseX-wide && ypos3 >= 395 && ypos3 < height)
  {
    speed = 1.0;
    speed2 = speed2 +1.0;
    ypos3 = -50;
    xpos3 = -50;
  }
  if(score == 20)
  {
  shape(medi,xpos4,ypos4,100,100);
  ypos4+=speed2;
  }
   if(xpos4<=mouseX+wide && xpos4>=mouseX-wide && ypos4 >= 395 && ypos4 < height)
  {
    speed = 1.0;
    speed2 = speed2 +1.0;
    ypos4 = -50;
    xpos4 = -50;
  }
    if(score == 40)
  {
  shape(medi,xpos5,ypos5,100,100);
  ypos5+=speed2;
  }
   if(xpos5<=mouseX+wide && xpos5>=mouseX-wide && ypos5 >= 395 && ypos5 < height)
  {
    speed = 1.0;
    speed2 = speed2 +1.0;
    ypos5 = -50;
    xpos5 = -50;
  }
    if(score == 70)
  {
  shape(medi,xpos6,ypos6,100,100);
  ypos6+=speed2;
  }
   if(xpos6<=mouseX+wide && xpos6>=mouseX-wide && ypos6 >= 395 && ypos6 < height)
  {
    speed = 1.0;
    speed2 = speed2 +1.0;
    ypos6 = -50;
    xpos6 = -50;
  }
    if(score == 110)
  {
  shape(medi,xpos7,ypos7,100,100);
  ypos7+=speed2;
  }
   if(xpos7<=mouseX+wide && xpos7>=mouseX-wide && ypos7 >= 395 && ypos7 < height)
  {
    speed = 1.0;
    speed2 = speed2 +1.0;
    ypos7 = -50;
    xpos7 = -50;
  }
    if(score == 160)
  {
  shape(medi,xpos8,ypos8,100,100);
  ypos8+=speed2;
  }
   if(xpos8<=mouseX+wide && xpos8>=mouseX-wide && ypos8 >= 395 && ypos8 < height)
  {
    speed = 1.0;
    speed2 = speed2 +1.0;
    ypos8 = -50;
    xpos8 = -50;
  }

  shape(blob, mouseX, 475, 200, 250);

  textSize(48);
  fill(255);
  text(score, 700, 50);


  if (xpos<=mouseX+wide && xpos>=mouseX-wide && ypos >= 395 && ypos < height)
  {
    
    score = score + 1.0;
    speed = speed + 0.5;
    ypos = 0;
    xpos = random(0, 800);
    pushMatrix();
    shape(blobg,mouseX,475,215,265);
    popMatrix();
  }

  if (score > 10.0)
  {
    bluebomb = yellowbomb;
  }

  if (score > 20.0)
  {
    yellowbomb = redbomb;
  }

  if (score > 40.0)
  {
    redbomb = greenbomb;
  }

  if (ypos > height)
  {
    image(lose, 0, 0);
    text(score, 345, 300);
    x = 1;
  }
  }
}

void mouseClicked()
{
 if(x==3 && mouseY > 400)
{
 x=0;
} 
//if(x==1)
//{
//  x=2;
//  score=0;
//}
}

