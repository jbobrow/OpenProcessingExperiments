
/* @pjs preload="green splatter.png, blue splatter.png, 
red splatter1.png,red splatter2.png,red splatter3.png,red splatter4.png",
blue splatter2.png, blue splatter3.png, blue splatter4.png,
green splatter2.png, green splatter3.png, green splatter4.png ; */
PImage img;
PImage imgG2;
PImage imgG3;
PImage imgG4;
PImage imgB;
PImage imgB2;
PImage imgB3;
PImage imgB4;
PImage imgR1;
PImage imgR2;
PImage imgR3;
PImage imgR4;

boolean qPressed;
boolean wPressed;
boolean ePressed;
float greenX=0;
float greenY=0;
float green2X=0;
float green2Y=0;
float green3X=0;
float green3Y=0;
float green4X=0;
float green4Y=0;
float redX=0;
float redY=0;
float red2X=0;
float red2Y=0;
float red3X=0;
float red3Y=0;
float red4X=0;
float red4Y=0;
float blueX=0;
float blueY=0;
float blue2X=0;
float blue2Y=0;
float blue3X=0;
float blue3Y=0;
float blue4X=0;
float blue4Y=0;
int give=30;
PImage tractorBeamImg;
boolean showImageg= true;
boolean showImageg2= true;
boolean showImageg3= true;
boolean showImageg4= true;
boolean showImager1= true;
boolean showImager2= true;
boolean showImager3= true;
boolean showImager4= true;
boolean showImageB1= true;
boolean showImageB2= true;
boolean showImageB3= true;
boolean showImageB4= true;
float position;
float gMoveY;
float gMoveX;
float gMove2Y;
float gMove2X;
float gMove3Y;
float gMove3X;
float gMove4Y;
float gMove4X;
float rMoveY;
float rMoveX;
float rMove2Y;
float rMove2X;
float rMove3Y;
float rMove3X;
float rMove4Y;
float rMove4X;
float bMoveY;
float bMoveX;
float bMove2Y;
float bMove2X;
float bMove3Y;
float bMove3X;
float bMove4Y;
float bMove4X;
int guyColor = 0;
float radius = 20.0;
void setup()
{
size (600,600);
background(0);

greenX=random(550);
greenY=random(550);
green2X=random(550);
green2Y=random(550);
green3X=random(550);
green3Y=random(550);
green4X=random(550);
green4Y=random(550);
redX=random(550);
redY=random(550);
red2X=random(550);
red2Y=random(550);
red3X=random(550);
red3Y=random(550);
red4X=random(550);
red4Y=random(550);
blueX=random(550);
blueY=random(550);
blue2X=random(550);
blue2Y=random(450);
blue3X=random(550);
blue3Y=random(550);
blue4X=random(550);
blue4Y=random(550);
gMoveX=random(7); // sets the green ellipse speed in the x
gMoveY=random(7);
gMove2X=random(7); // sets the green ellipse speed in the x
gMove2Y=random(7);
gMove3X=random(7); 
gMove3Y=random(7);
gMove4X=random(7); 
gMove4Y=random(7);
rMoveX=random(7); 
rMoveY=random(7);
rMove2X=random(7); 
rMove2Y=random(7);
rMove3X=random(7); 
rMove3Y=random(7);
rMove4X=random(7); 
rMove4Y=random(7);
bMoveX=random(7); 
bMoveY=random(7);
bMove2X=random(7); 
bMove2Y=random(7);
bMove3X=random(7); 
bMove3Y=random(7);
bMove4X=random(7); 
bMove4Y=random(7);
img=loadImage("green splatter.png");
imgG2=loadImage("green splatter2.png");
imgG3=loadImage("green splatter3.png");
imgG4=loadImage("green splatter4.png");
imgB=loadImage("blue splatter.png");
imgB2=loadImage("blue splatter2.png");
imgB3=loadImage("blue splatter3.png");
imgB4=loadImage("blue splatter4.png");

imgR1=loadImage("red splatter1.png");
imgR2=loadImage("red splatter2.png");
imgR3=loadImage("red splatter3.png");
imgR4=loadImage("red splatter4.png");


}

void draw()
{
  background(0);
  
  
  if(showImageg==true){
     noStroke();
    greenX+=gMoveX; // these 2 lines move the green ellipse
    greenY+=gMoveY;
    fill(0,255,0);  

    ellipse(greenX, greenY, give, give);

  }
  else
  {
    imageMode(CENTER);
    image(img,greenX,greenY);
  }
if (greenX>width-radius || greenX<radius) { 
    gMoveX=-gMoveX;
  }
  if (greenY>width-radius || greenY<radius) {
    gMoveY=-gMoveY;
  }
 
  
  if(showImageg2==true){
     noStroke();
    green2X+=gMove2X; // these 2 lines move the green ellipse
    green2Y+=gMove2Y;
    fill(0,255,0);  

    ellipse(green2X, green2Y, give, give);

  }
  else
  {
    imageMode(CENTER);
    image(imgG2,green2X,green2Y);
  }
if (green2X>width-radius || green2X<radius) { 
    gMove2X=-gMove2X;
  }
  if (green2Y>width-radius || green2Y<radius) {
    gMove2Y=-gMove2Y;
  }
    
    
    if(showImageg3==true){
     noStroke();
    green3X+=gMove3X; // these 2 lines move the green ellipse
    green3Y+=gMove3Y;
    fill(0,255,0);  

    ellipse(green3X, green3Y, give, give);

  }
  else
  {
    imageMode(CENTER);
    image(imgG3,green3X,green3Y);
  }
if (green3X>width-radius || green3X<radius) { 
    gMove3X=-gMove3X;
  }
  if (green3Y>width-radius || green3Y<radius) {
    gMove3Y=-gMove3Y;
  }


if(showImageg4==true){
     noStroke();
    green4X+=gMove4X; // these 2 lines move the green ellipse
    green4Y+=gMove4Y;
    fill(0,255,0);  

    ellipse(green4X, green4Y, give, give);

  }
  else
  {
    imageMode(CENTER);
    image(imgG4,green4X,green4Y);
  }
if (green4X>width-radius || green4X<radius) { 
    gMove4X=-gMove4X;
  }
  if (green4Y>width-radius || green4Y<radius) {
    gMove4Y=-gMove4Y;
  }
  
    if(showImager1==true){
     noStroke();
    redX+=rMoveX; // these 2 lines move the green ellipse
    redY+=rMoveY;
    fill(255,0,0);  

    ellipse(redX, redY, give, give);

  }
  else
  {
    imageMode(CENTER);
    image(imgR1,redX,redY);
  }
if (redX>width-radius || redX<radius) { 
    rMoveX=-rMoveX;
  }
  if (redY>width-radius || redY<radius) {
    rMoveY=-rMoveY;
  }
  
  if(showImager2==true){
     noStroke();
    red2X+=rMove2X; // these 2 lines move the green ellipse
    red2Y+=rMove2Y;
    fill(255,0,0);  

    ellipse(red2X, red2Y, give, give);

  }
  else
  {
    imageMode(CENTER);
    image(imgR2,red2X,red2Y);
  }
if (red2X>width-radius || red2X<radius) { 
    rMove2X=-rMove2X;
  }
  if (red2Y>width-radius || red2Y<radius) {
    rMove2Y=-rMove2Y;
  }
  
    if(showImager3==true){
     noStroke();
    red3X+=rMove3X; // these 2 lines move the green ellipse
    red3Y+=rMove3Y;
    fill(255,0,0);  

    ellipse(red3X, red3Y, give, give);

  }
  else
  {
    imageMode(CENTER);
    image(imgR3,red3X,red3Y);
  }
if (red3X>width-radius || red3X<radius) { 
    rMove3X=-rMove3X;
  }
  if (red3Y>width-radius || red3Y<radius) {
    rMove3Y=-rMove3Y;
  }
  
      if(showImager4==true){
     noStroke();
    red4X+=rMove4X; // these 2 lines move the green ellipse
    red4Y+=rMove4Y;
    fill(255,0,0);  

    ellipse(red4X, red4Y, give, give);

  }
  else
  {
    imageMode(CENTER);
    image(imgR4,red4X,red4Y);
  }
if (red4X>width-radius || red4X<radius) { 
    rMove4X=-rMove4X;
  }
  if (red4Y>width-radius || red4Y<radius) {
    rMove4Y=-rMove4Y;
  }
  
        if(showImageB1==true){
     noStroke();
    blueX+=bMoveX; // these 2 lines move the green ellipse
    blueY+=bMoveY;
    fill(0,0,255);  

    ellipse(blueX, blueY, give, give);

  }
  else
  {
    imageMode(CENTER);
    image(imgB,blueX,blueY);
  }
if (blueX>width-radius || blueX<radius) { 
    bMoveX=-bMoveX;
  }
  if (blueY>width-radius || blueY<radius) {
    bMoveY=-bMoveY;
  }
  
          if(showImageB2==true){
     noStroke();
    blue2X+=bMove2X; // these 2 lines move the green ellipse
    blue2Y+=bMove2Y;
    fill(0,0,255);  

    ellipse(blue2X, blue2Y, give, give);

  }
  else
  {
    imageMode(CENTER);
    image(imgB2,blue2X,blue2Y);
  }
if (blue2X>width-radius || blue2X<radius) { 
    bMove2X=-bMove2X;
  }
  if (blue2Y>width-radius || blue2Y<radius) {
    bMove2Y=-bMove2Y;
  }
  
            if(showImageB3==true){
     noStroke();
    blue3X+=bMove3X; // these 2 lines move the green ellipse
    blue3Y+=bMove3Y;
    fill(0,0,255);  

    ellipse(blue3X, blue3Y, give, give);

  }
  else
  {
    imageMode(CENTER);
    image(imgB3,blue3X,blue3Y);
  }
if (blue3X>width-radius || blue3X<radius) { 
    bMove3X=-bMove3X;
  }
  if (blue3Y>width-radius || blue3Y<radius) {
    bMove3Y=-bMove3Y;
  }
  
              if(showImageB4==true){
     noStroke();
    blue4X+=bMove4X; // these 2 lines move the green ellipse
    blue4Y+=bMove4Y;
    fill(0,0,255);  

    ellipse(blue4X, blue4Y, give, give);

  }
  else
  {
    imageMode(CENTER);
    image(imgB4,blue4X,blue4Y);
  }
if (blue4X>width-radius || blue4X<radius) { 
    bMove4X=-bMove4X;
  }
  if (blue4Y>width-radius || blue4Y<radius) {
    bMove4Y=-bMove4Y;
  }




//make the paint guy red
if(qPressed){
noStroke();
fill(255,0,0);
ellipse(250,250,70,70);
 
stroke(255,0,0);
line(215,250,250,150);
line(285,250,250,150);
 
fill(0);
ellipse(235,235,10,10);
ellipse(265,235,10,10);
 
noFill();
stroke(50);
arc(160,260,200,50,0, TWO_PI/10);
guyColor = 1;
}
 
 
// make the paint guy blue
else if(wPressed) {
noStroke();
fill(0,0,255);
ellipse(250,250,70,70);
stroke(0,0,255);
line(215,250,250,150);
line(285,250,250,150);
fill(0);
ellipse(235,235,10,10);
ellipse(265,235,10,10);
noFill();
stroke(50);
arc(160,260,200,50,0, TWO_PI/10);
guyColor = 2;
}
 
//make the paint guy green
else if(ePressed){
noStroke();
fill(0,255,0);
ellipse(250,250,70,70);
stroke(0,255,0);
line(215,250,250,150);
line(285,250,250,150);
fill(0);
ellipse(235,235,10,10);
ellipse(265,235,10,10);
noFill();
stroke(50);
arc(160,260,200,50,0, TWO_PI/10);

guyColor = 3;
}
else{
noStroke();
fill(255);
ellipse(250,250,70,70);
stroke(255);
line(215,250,250,150);
line(285,250,250,150);
fill(0);
ellipse(235,235,10,10);
ellipse(265,235,10,10);
noFill();
stroke(50);
arc(160,260,200,50,0, TWO_PI/10);
}
 
}
 
void keyPressed()
{
if (key == 'q'){
qPressed = !qPressed;
wPressed = false;
ePressed = false;
}
if (key == 'w') {
wPressed = !wPressed;
qPressed = false;
ePressed = false;
}
if (key == 'e') {
ePressed = !ePressed;
wPressed = false;
qPressed = false;
}
}
void mouseClicked() {
  if (mouseX<greenX+give && mouseX>greenX-give) {
    if (mouseY<greenY+give && mouseY>greenY-give) {
      if (guyColor == 3)
      {
         showImageg = false;

      }
    }
  }


  if (mouseX<green2X+give && mouseX>green2X-give) {
    if (mouseY<green2Y+give && mouseY>green2Y-give) {
      if (guyColor == 3)
      {
         showImageg2 = false;

      }
    }
  }
    if (mouseX<green3X+give && mouseX>green3X-give) {
    if (mouseY<green3Y+give && mouseY>green3Y-give) {
      if (guyColor == 3)
      {
         showImageg3 = false;

      }
    }
  }
  if (mouseX<green4X+give && mouseX>green4X-give) {
    if (mouseY<green4Y+give && mouseY>green4Y-give) {
      if (guyColor == 3)
      {
         showImageg4 = false;

      }
    }
  }
    if (mouseX<redX+give && mouseX>redX-give) {
    if (mouseY<redY+give && mouseY>redY-give) {
      if (guyColor == 1)
      {
         showImager1 = false;

      }
    }
  }
      if (mouseX<red2X+give && mouseX>red2X-give) {
    if (mouseY<red2Y+give && mouseY>red2Y-give) {
      if (guyColor == 1)
      {
         showImager2 = false;

      }
    }
  }
        if (mouseX<red3X+give && mouseX>red3X-give) {
    if (mouseY<red3Y+give && mouseY>red3Y-give) {
      if (guyColor == 1)
      {
         showImager3 = false;

      }
    }
  }
         if (mouseX<red4X+give && mouseX>red4X-give) {
    if (mouseY<red4Y+give && mouseY>red4Y-give) {
      if (guyColor == 1)
      {
         showImager4 = false;

      }
    }
  }
           if (mouseX<blueX+give && mouseX>blueX-give) {
    if (mouseY<blueY+give && mouseY>blueY-give) {
      if (guyColor == 2)
      {
         showImageB1 = false;

      }
    }
  }
             if (mouseX<blue2X+give && mouseX>blue2X-give) {
    if (mouseY<blue2Y+give && mouseY>blue2Y-give) {
      if (guyColor == 2)
      {
         showImageB2 = false;

      }
    }
  }
               if (mouseX<blue3X+give && mouseX>blue3X-give) {
    if (mouseY<blue3Y+give && mouseY>blue3Y-give) {
      if (guyColor == 2)
      {
         showImageB3 = false;

      }
    }
  }
                 if (mouseX<blue4X+give && mouseX>blue4X-give) {
    if (mouseY<blue4Y+give && mouseY>blue4Y-give) {
      if (guyColor == 2)
      {
         showImageB4 = false;

      }
    }
  }
}

  


