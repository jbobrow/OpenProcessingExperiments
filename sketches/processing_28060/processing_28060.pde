
import processing.opengl.*;



/* below is the sound library import */

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
PImage a, b;
//color lerpColor = new color("lerpColor");
/* declaring variables */

Minim minim;
Minim minim2;
Minim minim3;
Minim minim4;
Minim minim5;
AudioPlayer playerRain;
AudioPlayer playerTorch;
AudioPlayer playerDrip2;
AudioPlayer playerRow1;
AudioPlayer playerFrog;
float angle = PI;
float pos = 100;
float gap = 12.0; /* any lower and the screen jumps */

float xMovement = 0;
float yMovement = 0;




//boolean showtrails=true; // show remainder of ripple
//float speed = 1.0;
//float scale = 0.010;
//float offset = 0;

/* fire flie variables below */
float xPos;
float xSpeed;
int xDir;
float yPos;
float ySpeed;
int yDir;
int bgFill;
float objFill1;
float objFill2;
float objFill3;
float objAlpha;
float radius;

/* class particles {
  float e, r, f, p, k, m;
  public particles() {
    e = random(0,200);
    r = random(0,150);
    f = random(0,150);
    p = random(0,120);
    k = random(0,140);
    m = random(0,100);
  } */

  /* public void randomise() {
    e = noise(frameCount * 0.03)*255;
    r = random(frameCount * 0.006)*255;
    f = random(frameCount * 0.02)*255;
  }
  public void move() {
    float ang =((float)(Math.PI*2.0))*noise(0+(this.e*scale),offset+(this.r*scale));
    this.e+=speed*Math.cos(ang);
    this.r+=speed*Math.sin(ang);
  }
} */


void setup() { 
  size(500,500, P3D);
  colorMode(RGB,100);
  a = loadImage("newboat.png");
  a.resize(750,250);
  frameRate(80);
  image(a, 0, 250);
  b = loadImage("frog2.png");
  b.resize(200,200);
  image(b, 0, 200);

/* fire flies set up below */
xPos = width/2;
  xSpeed = 0;
  xDir = 1;
  yPos = height/2;
  ySpeed = 0;
  yDir = 1;
  objFill1 = 255;
  objFill2 = 255;
  objFill3 = 255;
  objAlpha = 1;
  radius = 1;
  smooth();
  noStroke();
  fill(objFill1,objFill2,objFill3);
  ellipseMode(RADIUS);
  background(23,3,1); /* brown background */

  minim = new Minim(this);
  playerRain = minim.loadFile("wetcave.wav");
  playerRain.play();
  playerRain.setGain(-7);
  playerRain.loop();
  minim2 = new Minim(this);
  playerTorch = minim2.loadFile("torch.wav");
  minim3 = new Minim(this);
  playerDrip2 = minim3.loadFile("Drip2.wav");
  playerDrip2.setGain(3);
  minim4 = new Minim(this);
  playerRow1 = minim4.loadFile("Row1.wav");
  
}
  

void draw() {
 
  //objAlpha = 1;
 
fill(23,3,1,80);
rect(0,0,width,height);
  

  //float  e = random(0,200);
  //float  r = random(0,150);
  //float  f = random(0,150);
 // float  p = random(0,120);
  //float  k = random(0,140);
  //float  m = random(0,100);

//e = noise(frameCount * 0.03)*255;
//fill(e,r,f);

  /* water colour */
  
  color from = color(1,56, 85, 10);
color to = color(1, 14, 15, 20);
color interA = lerpColor(from, to, 0.10);
color interB = lerpColor(from, to, 0.20);
color interC = lerpColor(from, to, 0.30);
color interD = lerpColor(from, to, 0.40);
color interE = lerpColor(from, to, 0.50);
color interF = lerpColor(from, to, 0.60);
color interG = lerpColor(from, to, 0.70);
color interH = lerpColor(from, to, 0.80);

  noStroke();
  fill(from);
  rect(0, 240, 500, 26);
  fill(interA);
  rect(0, 266, 500, 26);
  fill(interB);
  rect(0, 292, 500, 26);
  fill(interC);
  rect(0, 318, 500, 26);
  fill(interD);
  rect(0, 344, 500, 26);
  fill(interE);
  rect(0, 370, 500, 26);
  fill(interF);
  rect(0, 396, 500, 26);
  fill(interG);
  rect(0, 422, 500, 26);
  fill(interH);
  rect(0, 448, 500, 26);
  fill(to);
  rect(0, 474, 500, 26);
smooth();


//boat imported
  image(a, -120, 350);  

  
  //image(b, 20, 200);

//cave horizon
  stroke(255,252,144, 40);
  line(200, 230, 300, 230);
  line(180, 232, 320, 232);
  line(160, 234, 340, 234);
  line(140, 237, 360, 237);
  line(0,240,500,240);

  if (key == 'a' || key == 'A')
    xMovement = xMovement + QUARTER_PI/200; 
  yMovement = yMovement - QUARTER_PI/200;
  if (key == 'd' || key == 'D')
    xMovement = xMovement - QUARTER_PI/200; 
  yMovement = yMovement + QUARTER_PI/200;    

//light/camera flare
  fill(255,252,144, 50);
  noStroke();
  ellipse(40,40,100,100); //light/camera reflection
 ellipse(50,50,60,60); //light/camera reflection
  ellipse(100,100, 30,30); //light/camera reflection
  ellipse(220, 210, 20, 20); //light/camera reflection

//cave exit camera flare
  fill(255,252,144, 50);
  noStroke();
  ellipse(250, 240, 10,10);
  
  fill(255,252,144, 40);
  noStroke();
  ellipse(250, 240, 20,20);
  
  fill(255,252,144, 30);
  noStroke();
  ellipse(250, 240, 30,30);
  
  fill(255,252,144, 5);
  noStroke();
  ellipse(250, 240, 80,80);

  fill(255,252,144, 7);
  noStroke();
 ellipse(250 ,240, 70, 70);
  
  fill(255,252,144, 10);
  noStroke();
  ellipse(250 ,240, 60, 60);

  fill(255,252,144, 20);
  ellipse(250 , 240, 40,40);

//frog
 

  if (mouseX==20 && mouseY==200){
    
    image(b,20, 200);
    minim5 = new Minim(this);
   playerFrog = minim5.loadFile("Frog.wav");
   playerFrog.loop(2);
   playerFrog.setGain(4);
   playerFrog.rewind();
  }


//flame @ mouseCurser
  noStroke();
  fill(232,212,140,3);
  ellipse(mouseX,mouseY, 200,200);
  fill(214,84,2,5);
  ellipse(mouseX,mouseY, 180,180);
  fill(227,130,2,10);
  ellipse(mouseX,mouseY, 150,150);
  fill(149,101,71,15);
  ellipse(mouseX,mouseY, 120,120);
  fill(162,69,11,50);
  ellipse(mouseX, mouseY, 100,100);
  ellipse(mouseX,mouseY,30,random(20,80));

//fire flies @ light
 fill(252,226,23);
  ellipse(mouseX+(random(10,40)),mouseY+(random(10,100)), 3,3);
  ellipse(mouseX+(random(40,100)),mouseY+(random(10,100)), 3,3);
  ellipse(mouseX+(random(40,100)),mouseY+(random(50,80)), 3,3);
  ellipse(mouseX-(random(10,40)),mouseY-(random(10,50)), 3,5);
  ellipse(mouseX+(random(10,80)),mouseY-(random(10,50)), 5,5);
  ellipse(mouseX-(random(10,40)),mouseY+(random(10,70)), 3,3);
  ellipse(mouseX+(random(10,30)),mouseY+(random(10,100)), 5,5);
  ellipse(mouseX-(random(100,20)),mouseY-(random(50,120)), 2,2);
  ellipse(mouseX-(random(10,40)),mouseY-(random(10,50)), 5,5);
  ellipse(mouseX+(random(10,80)),mouseY-(random(10,50)), 3,3);
  ellipse(mouseX-(random(10,40)),mouseY+(random(10,70)), 5,5);

  stroke(41,37,34);
  for(int i=-20;i<20;i++)
    line(mouseX+i,mouseY, mouseX, mouseY+80);  
  int count = 0;
  int t=1;
  float Ranx = random(10,30);
  float Rany = Ranx/3;
  if(pmouseX>=0 && pmouseY>=280) { 
    if (mousePressed && (mouseButton == RIGHT) && (count <= 8)) {
      playerDrip2.loop(0);
      stroke(11,50,random(0,100), 30);
      strokeWeight(1);
      fill(11,124,2,10);
      ellipse(random(pmouseX-100,pmouseX-50), random(pmouseY-50, pmouseY+50), Ranx, Rany);
      ellipse(random(pmouseX+50, pmouseX+80), random(pmouseY+50, pmouseY+70), Ranx*2, Rany*2);
      //frameRate(3000);
      count++;
      t++;
    }
    strokeWeight(1);
  }

  if (mousePressed &&(mouseButton == LEFT)) {
    playerTorch.loop(0);
  }

  int cnt = 100; /* variable to be used later for width and number of points - don't change */
  if (keyPressed) { 
    if (key == 'a' || key == 'A') angle = angle - QUARTER_PI/200; 
   xMovement = xMovement + QUARTER_PI/200; /* QUARTER_PI stands for quarter circle rotation movement in this case */
    yMovement = yMovement - QUARTER_PI/200;
    playerRow1.play();
    playerRow1.rewind();
    if (key == 'd' || key == 'D') angle = angle + QUARTER_PI/200; 
    xMovement = xMovement - QUARTER_PI/200; 
    yMovement = yMovement + QUARTER_PI/200;
    playerRow1.play();
    playerRow1.rewind();
  }
  
  
  // ceiling
  translate(width * 0.5, 1.8* height, height*3); /* this is where the image prints itself on the screen (how high) */
  rotateX(-.1); /* changes the angle the ceiling is moving at. lower number is better in my case */
  rotateY(angle); /* don't change this, as it keeps the camera facing forward rather than sideways. User can change this though */

  pos = pos + gap;
  noFill();
  for (float z = -cnt; z<cnt; z = z+1) {
    for (float x = -cnt; x<cnt; x = x+1) {
      float expX = x*gap;
      float expZ = z*gap;
      float expY = noise((expX+1000)*.01, (expZ-pos)*.01)*600;
      float sqY = expY*expY-(expX*expX+expZ*expZ)/gap;

      stroke(sqY*.002,sqY*.004,sqY*.001);
      point(expX,-expY,expZ);
    }
  }

  //reflection
 translate(width * 0.2, -1.2* height, -height*0.1); /* this is where the image prints itself on the screen (how high) */
  rotateX(-0.2); /* changes the angle the ceiling is moving at. lower number is better in my case */
  rotateY(angle); /* don't change this, as it keeps the camera facing forward rather than sideways. User can change this though */
  noFill();
  for (float zz = -cnt; zz<cnt; zz = zz+20)
    for (float xx = -cnt; xx<cnt; xx = xx+1) {

      float expXX = xx*gap;
      float expZZ = zz*gap;
      float expYY = noise((expXX+1000)*.01, (expZZ-pos)*.01)*600;
      float sqYY = expYY*expYY-(expXX*expXX+expZZ*expZZ)/(gap/2);

      stroke(sqYY*.002,sqYY*.004,sqYY*.001);
      point(expXX,-expYY,expZZ);
    }
  


}

