
//window properties
int windowWidth = 500;  
int windowHeight = 500;
int fps = 5;

//mouse over sushi
int sushiX = 115;
int sushiX2 = 285;
int sushiY = 225;
int sushiY2 = 300;
float eyeball = 50;
float pupil = 25;

//fishhead perameters
int headX = 120;
int headY = 250; 

//bubble perameters
float bubbles = 370;
float minBubble = 150;
float maxBubble = 225;

//lantern perameters
float lanternX = 150;
float lanternX2 = 300;
float lanternY = 20;
float lanternY2 = 75;

//scene and object colors
int colorBlack = 0;
int colorWhite = 255;
int riceR = 250;
int riceG = 241;
int riceB = 209;
int whiteShadow = 200;
int backgroundColorR = 15;
int backgroundColorG = 227;
int backgroundColorB = 245;
int glassR = 196;
int glassG = 237;
int glassB = 242;
int glassT = 215;  
int seaweedR = 21;
int seaweedG = 49;
int seaweedB = 17;
int bambooR = 247;
int bambooG = 217;
int bambooB = 117;
int subBambooR = 129;
int subBambooG = 116;
int subBambooB = 73;
int colorRedR = 200;
int colorRedG = 5;
int colorRedB = 0;
int bowlR=255; 
int bowlG=147; 
int bowlB=5;
float soupR=178; 
float soupG=65; 
float soupB=9; 
int grainR=203;
int grainG=171;
int grainB=37;
int lanternR=20;
int lanternG=216;
int lanternB=64;
float fishR = 252;
float fishB = 125;
float fishG = 165;

//user interactions
boolean darkRoom = false;
boolean bulgingEyes = false;
boolean dontEat = false;
boolean lightOn = false;

void setup()
{
  size(windowWidth,windowHeight);
  background(backgroundColorR,backgroundColorG,backgroundColorB);
  frameRate(fps);
  smooth();
  textFont(loadFont("EurostileRegular-30.vlw"));

}

void draw()
{

  //background
  fill(backgroundColorR,backgroundColorG,backgroundColorB,220);
  noStroke();
  rect(0,0,width,height);

  //lantern
  strokeWeight(3);
  stroke(colorBlack);
  fill(lanternR,lanternG,lanternB);
  rect(230,75,50,50);
  ellipse(250,20,300,150);
  strokeWeight(5);
  stroke(colorBlack,150);
  line(120,10,380,10);
  line(105,20,395,20);
  line(120,30,380,30);
  line(135,40,365,40);
  line(150,50,350,50);
  line(165,60,335,60);
  line(180,70,320,70);
  line(195,80,305,80);
  strokeWeight(2);
  stroke(colorRedR,colorRedG,colorRedB);
  line(120,10,380,10);
  line(105,20,395,20);
  line(120,30,380,30);
  line(135,40,365,40);
  line(150,50,350,50);
  line(165,60,335,60);
  line(180,70,320,70);
  line(195,80,305,80);


  //table
  noStroke(); 
  fill(219,160,40); 
  rect(0,300,width,200); 

  //placemat
  strokeWeight(4);
  stroke(188,59,47);
  fill(colorRedR,colorRedG,colorRedB);
  rect(25,325,450,150);

  //plate
  strokeWeight(3);
  stroke(22,74,80);
  fill (glassR,glassB,glassG,glassT);
  ellipse(250,375,300,25);
  ellipse(250,325,400,100);
  strokeWeight(2);
  ellipse(250,325,375,85);

  //bowl
  stroke(colorBlack);
  fill(bowlR,bowlG,bowlB);
  ellipse(370,260,250,140);
  ellipse(370,210,250,50);
  ellipse(370,210,220,40);
  //soup
  stroke(colorBlack);
  fill(soupR,soupG,soupB);
  ellipse(370,210,200,30);
  //soup bubbles
  noStroke();
  fill(soupR,soupG,soupB,125);
  ellipse(370,random(bubbles),10,10);
  ellipse(350,random(bubbles),5,5);
  ellipse(340,random(bubbles),10,10);
  ellipse(370,random(bubbles),5,5);
  ellipse(380,random(bubbles),10,10);
  ellipse(390,random(bubbles),5,5);
  ellipse(400,random(bubbles),10,10);
  ellipse(410,random(bubbles),5,5);
  soupR += random(-10,10);
  bubbles = random(minBubble,maxBubble);

  //green garnish
  fill(94,229,74);
  strokeWeight(1);
  stroke(101,198,86);
  beginShape();
  vertex(100,310);
  vertex(110,325);
  vertex(105,335);
  vertex(120,325);
  endShape(CLOSE);
  beginShape();
  vertex(115,325);
  vertex(125,325);
  vertex(120,340);
  vertex(135,330);
  endShape(CLOSE);

  //block of rice
  fill(riceR,riceG,riceB); 
  stroke(whiteShadow);
  rect(115,250,170,75);

  //fish 
  noStroke();
  fill(fishR,fishG,fishB);
  triangle(290,220,290,275,255,255); //tail
  ellipse(195,250,170,50);  //body
  stroke(75,34,47,150); //gills
  strokeWeight(3);
  line(175,230,175,265);
  line(185,230,185,265);
  line(195,230,195,265);
  line(205,230,205,265);
  line(215,230,215,265);
  strokeWeight(15);
  stroke(seaweedR,seaweedG,seaweedB,220);
  line(195,225,195,325);
  //if mouse over fish, fish changes color
  if(mouseX > sushiX && mouseX < sushiX2 && mouseY > sushiY && mouseY < sushiY2)
  {
    fishR = 245;
    fishG = 35;
    fishB = 91;
  }
  else
  {
    fishR = 252;
    fishB = 125;
    fishG = 165;
  }

  //sushi roll
  fill(seaweedR,seaweedG,seaweedB);  //seaweed
  noStroke();
  rect(250,300,100,60);  
  fill(riceR,riceG,riceB);  //rice
  stroke(seaweedR,seaweedG,seaweedB);
  strokeWeight(2);
  ellipse(300,300,100,50);
  strokeWeight(4);
  stroke(grainR,grainG,grainB);
  point(330,290);
  point(330,300);
  point(330,310);
  point(340,295);
  point(340,305);
  point(270,290);
  point(270,310);
  point(270,300);
  point(260,295);
  point(260,305);
  fill(234,70,28);  //sushi filling
  noStroke();
  ellipse(300,300,30,30);
  strokeWeight(1);
  stroke(247,119,87);
  fill(252,170,61);
  ellipse(300,300,10,20);

  //chop sticks
  strokeWeight(8);  //stick shadows
  stroke(subBambooR,subBambooG,subBambooB);
  line(490,320,200,400);
  line(475,300,250,400);
  strokeWeight(5);  //chopsticks
  stroke(bambooR,bambooG,bambooB);
  line(490,320,200,400);
  line(475,300,250,400);


  if(darkRoom)
  {
    noStroke();
    fill(colorBlack,150);
    rect(0,0,width,height);
    fill(242,219,39,100);
    beginShape();
    vertex(230,100);
    vertex(100,275);
    vertex(400,275);
    vertex(280,100);
    endShape(CLOSE);
  }


  //illuminating light
  if(lightOn)
  {
    noStroke();
    fill(242,219,39,100);
    beginShape();
    vertex(230,100);
    vertex(100,275);
    vertex(400,275);
    vertex(280,100);
    endShape(CLOSE);
  }

  //lantern light is illuminated on mouseover
  if(mouseX > lanternX && mouseX < lanternX2 && mouseY > lanternY && mouseY < lanternY2)
  {
    lightOn = true;
  }
  else
  {
    lightOn = false;
  }

  //fish eyes bulge
  if(bulgingEyes)
  {
    noStroke();
    fill(colorWhite);
    ellipse(headX,headY+15,eyeball,eyeball);
    ellipse(headX,headY-15,eyeball,eyeball);
    fill(colorBlack);
    ellipse(headX,headY+15,pupil,pupil);
    ellipse(headX,headY-15,pupil,pupil);
    pupil += random(-10,10);
    pupil = constrain(pupil,1,30);
  }
  //bulging eyes on mouseover
  if(mouseX > sushiX && mouseX < sushiX2 && mouseY > sushiY && mouseY < sushiY2)
  {
    bulgingEyes = true;
  }
  else
  {
    bulgingEyes = false;
  }

  //fish begs you not to eat him
  if(dontEat)
  {
    text("oh! DON'T EAT ME",100,210); 
  }
  //click on sushi; DON'T EAT
  if(mousePressed && mouseX > sushiX && mouseX < sushiX2 && mouseY > sushiY && mouseX < sushiY2)
  {
    dontEat = true;
  }
  else
  {
    dontEat = false;
  }

}


void mousePressed()
{ //room is darkened or lightened when mouse is clicked on the lantern 
  if((mouseX > lanternX) && (mouseX < lanternX2) && (mouseY > lanternY) && (mouseY < lanternY2))
  { 
    darkRoom = !darkRoom;   
  }
  else
  {

  } 
}











