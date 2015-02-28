
// Sun Variables
int sunRadius = 40;      // size of the sun
int xStart = -sunRadius; // The initial x position
int yStart = 20;         // The initial y position
float xSun = xStart;     // the x position of the sun
float ySun = yStart;     // the y position of the sun

// Arc variables
float t = 0;   // Start time
float duration = 60 * 1000; // Complete a full circle every 60 seconds
float conversionFactor = 2 * 3.14 / duration; // A full circle (2*pi) occurs every duration milliseconds

Cloud cloudOne,cloudTwo,cloudThree,cloudFour,cloudFive,cloudSix,cloudSeven;

void setup()
{
size(800,750);
background (33,0,161);
 cloudOne = new Cloud(500,50,random(0.3,0.8));
 cloudTwo = new Cloud(700,200,random(0.3,0.8));
 cloudThree = new Cloud(300,100,random(0.3,0.8));
 cloudFour = new Cloud(100,450,random(0.3,0.8));
 cloudFive = new Cloud(225,300,random(0.3,0.8));
 cloudSix = new Cloud(-150,195,random(0.3,0.8));
 cloudSeven = new Cloud(-200,335,random(0.3,0.8));
}

void draw()
{
  //sky color variables
  float skyColorR = map(ySun,0,height,23,0);
  float skyColorG = map(ySun,0,height,162,0);
  float skyColorB = map(ySun,0,height,255,0);
  //window color variables 255,236,12
  float winColorR = map(ySun,0,height,0,255);
  float winColorG = map(ySun,0,height,0,236);
  float winColorB = map(ySun,0,height,0,12);
   
  // Refresh background
  background(skyColorR,skyColorG,skyColorB);
  
  // Draw the sun
  fill( 255, 117, 0);
  ellipse(xSun, ySun, sunRadius, sunRadius);

  // Update position
  // this method traces a curve using a parametric equation. See http://en.wikipedia.org/wiki/Parametric_equation and Khan Academy
  // To change the speed, adjust the value added to t
  //t += 0.01;
  
  // Convert t to radians
  t = millis() * conversionFactor;

  // Use the parametric form for an ellipse. This method uses constant angular velocity
  float Rx = width/2 + sunRadius/2;
  float Ry = height/2 - sunRadius/2;
  float centerX = width/2;
  float centerY = height/2;
  
  xSun = cos(t) * Rx + centerX;
  ySun = sin(t) * Ry + centerY;
  
  //calls cloud function
   cloudOne.makeCloud();
   cloudTwo.makeCloud();
   cloudThree.makeCloud();
   cloudFour.makeCloud();
   cloudFive.makeCloud();
   cloudSix.makeCloud();
   cloudSeven.makeCloud();
   //horizon
    fill(45,0,190);
  rect(0,650,800,100);
  //castle
  fill(15);
  noStroke();
  triangle(380,300,580,300,480,200);
  triangle(630,630,635,651,640,640);
  triangle(200,550,700,550,500,700);
  triangle(430,690,380,600,480,600);
  triangle(530,690,480,600,580,600);
  triangle(580,680,530,550,630,600);
  triangle(310,600,330,608,302,615);
  triangle(258,650,260,658,250,665);
  fill(0);
  triangle(335,100,445,100,390,10);
  fill(30);
  triangle(420,100,445,100,390,10);
  fill(0);
  ellipse(390,100,110,25);
  fill(30);
  triangle(580,300,580,400,480,200);
  ellipse(450,550,500,40);
  noStroke();
  fill(0);
  rect(350,100,80,300);
  fill(25);
  rect(400,100,30,300);
  fill(0);
  rect(300,300,300,250);
  noStroke();
  fill(25);
  quad(600,300,650,400,650,550,600,550);
  fill(winColorR,winColorG,winColorB);
  rect(370,150,5,10);
  rect(390,200,5,10);
  rect(370,250,5,10); 
}
////////////////////////////////////////
class Cloud{
  
  float pX,pY,x,y,r,g,b,t,cS;
  
 Cloud(float parameterX, float parameterY, float cloudSpeed){
 pX = parameterX;
 pY = parameterY;
 x = random(50,200);
 y = random(25,45);
 r = random(58,65);
 g = random(2,5);
 b = random(100,115);
 t = random(180,245);
 cS = cloudSpeed;
 }
void makeCloud(){
  fill(r,g,b,t);
  ellipse(pX,pY,x,y); 
  ellipse(pX-15,pY+25,x+10,y+5);
  ellipse(pX-75,pY,x-20,y-10);
  ellipse(pX+20,pY+5,x+10,y-10);
  ellipse(pX+10,pY+30,x+50,y-10);
  pX = pX + cS;
  if (pX > 1000) { 
  pX = -200; 
 }
}
}


