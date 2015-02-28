
PFont myDisplayFont;
PImage bg;
PImage moon;
PImage star1;
PImage star2;
PImage star3;
int star1Radius=30;
int star2Radius=30;
int star3Radius=30;
float xPos;
float yPos;
float star1xPos;
float star1yPos;
int numStar1;
int numStar2;
int numStar3;

void setup()
{
   
  background(102);
  bg = loadImage("bg.png");
  moon = loadImage("moon.png");
  star1 = loadImage("star1.png");
  star2 = loadImage("star2.png");
  star3 = loadImage("star3.png");

  xPos=50;
  yPos=200;
  numStar1=40;
  numStar2=25;
  numStar3=50;
  
  size(640, 200);
  noStroke();
  frameRate(30);
  smooth();
  
}

void draw()
 
{
   
  imageMode(CENTER);
  image(bg, 320, 100);
   
  imageMode(CENTER);
  image(moon, 320, 100);
   
  imageMode(CENTER);
  image(star1, 170, 120);
   
  imageMode(CENTER);
  image(star2, 500, 120);
   
  imageMode(CENTER);
  image(star3, 400, 50);
  
  star1yPos = random(205, 210);
  yPos = random(205, 210);
  
  for(int i = 0; i < numStar1; i++){
        image(star1, xPos + 700*i, yPos-100);}
 
     
    for(int i = 0; i < numStar2; i++){
        image(star2, xPos + 500*i, yPos);     
}
 
for(int i = 0; i < numStar3; i++){
        image(star3, xPos + 200*i, yPos+50);}
         
        xPos-=30;
        star1yPos +=40;
                
}




