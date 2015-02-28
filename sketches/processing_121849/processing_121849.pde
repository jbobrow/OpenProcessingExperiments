

ParticleSystem ps;
int playerX=20;
int playerY=20;
int ballX=200;
int ballY=200;
int playerPoint1=mouseY;
int playerPoint2=mouseY+90;
int a,b,c;
boolean Lcollision=false;
int comPoint1=60;
int comPoint2=160;
boolean ypause=false;
int choice=1;
boolean directionX=false;
boolean directionY=false;
boolean Rcollision=false;
boolean mainChoice=false;
boolean choice1=true;
boolean choice2=false;
int tracker=1;
int menucounter=0;
boolean startOver=false;
boolean resetScore=false;
boolean p1=false;
boolean p2=false;

//ball choices
boolean bchoice1=true;
boolean bchoice2=false;
boolean bchoice3=false;
// difficulty
boolean easy=true;
boolean medium=false;
boolean hard=false;
float hr, vr;
//desision
boolean difficultySetup=true;
// center point
float centerX = 0, centerY = 0;
int lscore,rscore;
float radius = 45, rotAngle = -90;
float accelX, accelY;
float springing = .0009, damping = .98;
int num=20;
//corner nodes
int nodes = 4;
float nodeStartX[] = new float[nodes];
float nodeStartY[] = new float[nodes];
float[]nodeX = new float[nodes];
float[]nodeY = new float[nodes];
float[]angle = new float[nodes];
float[]frequency = new float[nodes];
//easy
int num1 = 90;
float mx1[] = new float[num1];
float my1[] = new float[num1];
//medium
int num2 = 30;
float mx2[] = new float[num2];
float my2[] = new float[num2];
//hard
int num3 = 10;
float mx3[] = new float[num3];
float my3[] = new float[num3];
// soft-body dynamics
float organicConstant = 1;
void inputvariables()
{
  if(difficultySetup==true)
  {
  //storing input
int num = 70;
if(hard==true)
  num=10;
  if(medium==true)
  num=30;
  if(easy==true)
  num=70;
float mx[] = new float[num];
float my[] = new float[num];
//difficultySetup=false;
int which = frameCount % num;
  mx[which] = ballX;
  my[which] = ballY;
  difficultySetup=false;
}

}
void linkfollow()
{
  int num=1;
  if(hard==true)
  num=5;
  if(medium==true)
  num=50;
  if(easy==true)
  num=200;
  strokeWeight(10);
}
void chainfollow()
{
  int num=10;
  if(hard==true)
  num=5;
  if(medium==true)
  num=15;
  if(easy==true)
  num=40;
  strokeWeight(num);
  stroke(255, 100);
}
// follow
float[] x = new float[20];
float[] y = new float[20];
float segLength = 18;
void setup() {
size(800, 600);

a=(int)random(0,255);
b=(int)random(0,255);
c=(int)random(0,255);


  ellipseMode(CENTER);

  noStroke();

  smooth();
 ps = new ParticleSystem(new PVector(width/2,50));
 

noStroke();

centerX = width/2;
centerY = height/2;
// iniitalize frequencies for corner nodes
for (int i=0; i<nodes; i++){
frequency[i] = random(5, 12);
}
noStroke();
frameRate(30);
}
void mainMenu()
{
  background(200,255,152);
  fill(0);
  textSize(70);
  text("My Pong Game",100,100);
  textSize(40);
  text("Press Enter",200,500);
  
}
void menu1()
{
  background(100,255,130);
  fill(0);
  textSize(35);
  text("Choose Your Difficulty",230,100);
  fill(0);
  if(easy==true)
  fill(255,0,0);
textSize(26); 
text("Easy", 150, 410); 
  rect(150,450,50,50);
  fill(0);
  if(medium==true)
  fill(255,0,0);
  textSize(26); 
text("Medium", 330, 410); 
  rect(350,450,50,50);
  fill(0);
  if(hard==true)
  fill(255,0,0);
  textSize(26); 
text("Hard", 550, 410); 
  rect(550,450,50,50);
  if(tracker==1)
  {
  easy=true;
  medium=false;
  hard=false;
  }
  if(tracker==2)
  {
    easy=false;
    medium=true;
    hard=false;
  }
  if(tracker==3)
  {
    easy=false;
    medium=false;
    hard=true;
  }
  if(tracker>3)
tracker=1;
if(tracker<1)
tracker=3;
}
void menu2()
{
  background(100,255,130);
  fill(0);
  textSize(35);
  text("Choose Your Ball",230,100);
  fill(0);
  if(bchoice1==true)
  fill(255,0,0);
textSize(26); 
text("ball1", 150, 410); 
  rect(150,450,50,50);
  fill(0);
  if(bchoice2==true)
  fill(255,0,0);
  textSize(26); 
text("ball2", 330, 410); 
  rect(350,450,50,50);
  fill(0);
  if(bchoice3==true)
  fill(255,0,0);
  textSize(26); 
text("ball3", 550, 410); 
  rect(550,450,50,50);
  if(choice==1)
   {
  bchoice1=true;
  bchoice2=false;
  bchoice3=false;
  }
  if(choice==2)
   {
  bchoice1=false;
  bchoice2=true;
  bchoice3=false;
  }
  if(choice==3)
   {
  bchoice1=false;
  bchoice2=false;
  bchoice3=true;
  }
  if(choice>3)
choice=1;
if(choice<1)
choice=3;
}
void menu3()
{
  background(0,0,255);
  fill(255,0,0);
  textSize(50);
  text("Welcome to my Pong game",100,100);
  text("Player 1:",100,150);
  text("Use the mouse to move",100,200);
  text("Player 2:",100,250);
  text("Use the arrowkeys to move",100,300);
  text("Press Enter to Start",100,500);
}
void draw() {
 if(menucounter==0)
  mainMenu();
  if(menucounter==1)
  menu1();
  if(menucounter==2)
  menu2();
  if(menucounter==3)
 menu3();
  if(menucounter>=4&& ypause==false)
  {fill(255);
  if(bchoice1==true)
 {
   ball1();
   player2player();
   scoring();
 }
  if(bchoice2==true)
  {
    fill(255);
 if(easy==true)
 ball201();
 if(medium==true)
 ball202();
 if(hard==true)
 ball203();

player2player();
scoring();
  }
  if(bchoice3==true)
  {chainfollow();
  ball3();
  player2player();
  scoring();
  }


  }
  if(p1==true)
  {background(0);
  fill(255);
  textSize(60);
  text("Player1 Wins",300,200);
  ps.addParticle();
  ps.run();
  }
  if(p2==true)
  {background(0);
  fill(255);
   textSize(60);
  text("Player2 Wins",300,200);
  ps.addParticle();
  ps.run();
  }
  if(startOver==true)
  {
    menucounter=0;
    startOver=false;
  }
}
void player2player()
{
  chainfollow();
  noStroke();
  
  float padY = constrain(mouseY, 0, 515);


int playerPoint1=(int)padY;
int playerPoint2=mouseY+90;

  rect(0,padY,20,80);
  rect(780,comPoint1,20,80);
  
  if (playerPoint1<0)
  playerPoint1=0;
  if(playerPoint2>600)
  playerPoint1=500;
 
       if(ballX>=20 && ballX<=35)
       {if(ballY<playerPoint2 && ballY>playerPoint1)
 { Lcollision=true;
 Rcollision=false;}
       }
       if(ballX>=750 && ballX<=800)
      {
      if(ballY<=comPoint2 && ballY>=comPoint1)
      {
        Rcollision=true;
        Lcollision=false;    }
      }
      if(comPoint1<0)
      {
      comPoint1=0;
      comPoint2=90;
      }
      if(comPoint2>600)
      {
      comPoint1=510;
      comPoint2=600;
      }
}
void ball3()
{pongBallCode();

   background(a,b,2);
  dragSegment(0, ballX, ballY);
  for(int i=0; i<x.length-1; i++) {
    dragSegment(i+1, x[i], y[i]);
  }
}
void ball201()
{
  background(a,b,c);

int which = frameCount % num1;
  mx1[which] = ballX;
  my1[which] = ballY;
  
  for (int i = 0; i < num1; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num1;
    ellipse(mx1[index], my1[index], i, i);
  }
  pongBallCode();
  
  
  
}
void ball202()
{
  background(a,b,c);

int which = frameCount % num2;
  mx2[which] = ballX;
  my2[which] = ballY;
  
  for (int i = 0; i < num2; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num2;
    ellipse(mx2[index], my2[index], i, i);
  }
  pongBallCode();
  
  
  
}
void ball203()
{
  background(a,b,c);
  

int which = frameCount % num3;
  mx3[which] = ballX;
  my3[which] = ballY;
  
  for (int i = 0; i < num3; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num3;
    ellipse(mx3[index], my3[index], i, i);
  }
  pongBallCode();
  
  
  
}
void pongBallCode()
{
  int x= (int)random(100,300);
int xx= (int)random(500,700);
// bouncing ball codex begining
if(directionX==false)
ballX+=10;
if(directionY==false)
ballY+=10;
if(directionX==true)
ballX-=10;
if(directionY==true)
ballY-=10;
if(Lcollision==true && directionX==true)
directionX=false;
if(Rcollision==true && directionX==false)
directionX=true;
if (ballX<-300)
{
//ballX=0;
 ballX=x;
 Lcollision=false;
 Rcollision=false;
// ballY=200;
directionX=false;
rscore+=1;
fill(255,0,0);
rect(0,0,width,height);
}
if (ballX>1100)
{
//ballX=800;

 ballX=xx;
// ballY=400;
 Lcollision=false;
 Rcollision=false;
directionX=true;
lscore+=1;
fill(255,0,0);
rect(0,0,width,height);
}
if (ballY<0)
{
ballY=0;
directionY=false;
}
if (ballY>600)
{
ballY=600;
directionY=true;
}
if(rscore==10)
p2=true;
if(lscore==10)
p1=true;
if(rscore==10||lscore==10)
{
rscore=0;
lscore=0;
}
}
void ball1()
{
  linkfollow();

fill(0);
fill(a, b,c);
rectMode(CORNER);
rect(0,0,width, height);
rectMode(CORNER);
fill(255);
if(easy==true)
ellipse(ballX,ballY,100,100);
if(medium==true)
ellipse(ballX,ballY,60,60);
if(hard==true)
ellipse(ballX,ballY,10,10);
drawShape();
moveShape();

stroke(255);
//strokeWeight(1);
line(ballX, ballY, centerX, centerY);
noStroke();
int x= (int)random(100,300);
int xx= (int)random(500,700);
// bouncing ball codex begining
if(directionX==false)
ballX+=10;
if(directionY==false)
ballY+=10;
if(directionX==true)
ballX-=10;
if(directionY==true)
ballY-=10;
if(Lcollision==true && directionX==true)
directionX=false;
if(Rcollision==true && directionX==false)
directionX=true;
if (ballX<-300)
{
//ballX=0;
 ballX=x;
 Lcollision=false;
 Rcollision=false;
// ballY=200;
directionX=false;
rscore+=1;
fill(255,0,0);
rect(0,0,width,height);
}
if (ballX>1100)
{
//ballX=800;

 ballX=xx;
// ballY=400;
 Lcollision=false;
 Rcollision=false;
directionX=true;
lscore+=1;
fill(255,0,0);
rect(0,0,width,height);
}
if (ballY<0)
{
ballY=0;
directionY=false;
}
if (ballY>600)
{
ballY=600;
directionY=true;
}
if(rscore==10)
p2=true;
if(lscore==10)
p1=true;
if(rscore==10||lscore==10)
{
rscore=0;
lscore=0;

}
}

void drawShape() {
// calculate node starting locations
for (int i=0; i<nodes; i++){
nodeStartX[i] = centerX+cos(radians(rotAngle))*radius;
nodeStartY[i] = centerY+sin(radians(rotAngle))*radius;
rotAngle += 360.0/nodes;
}

// draw polygon
curveTightness(organicConstant);
fill(255);
beginShape();
for (int i=0; i<nodes; i++){
curveVertex(nodeX[i], nodeY[i]);
}
for (int i=0; i<nodes-1; i++){
curveVertex(nodeX[i], nodeY[i]);
}
endShape(CLOSE);
}

void moveShape() {
//move center point
float deltaX = //300;
ballX
-centerX;
float deltaY = //500;
ballY
-centerY;

// create springing effect
deltaX *= springing;
deltaY *= springing;

accelX += deltaX;
accelY += deltaY;
/* if(accelX>5)
accelX=5;
if(accelY>5)
accelY=5;
if(accelX<0)
accelX=0;
if(accelY<0)
accelY=0;*/

// move predator's center
centerX += accelX;
centerY += accelY;

// slow down springing
accelX *= damping;
accelY *= damping;

// change curve tightness
organicConstant = 1-((abs(accelX)+abs(accelY))*.1);

//move nodes
for (int i=0; i<nodes; i++){
nodeX[i] = //ballX+
nodeStartX[i]+sin(radians(angle[i]))*(accelX/2);
nodeY[i] = //ballY+
nodeStartY[i]+sin(radians(angle[i]))*(accelY*2);
angle[i]+=frequency[i];
}
}
void keyReleased()
{
  
  if (key== CODED)
{
  if(menucounter==1)
  {
if (keyCode==LEFT)
{
  tracker--;
}
if (keyCode==RIGHT)
{
  tracker++;
}
  }
  if(menucounter==2)
  {
if (keyCode==LEFT)
{
  choice--;
}
if (keyCode==RIGHT)
{
  choice++;
}
  }
}
}
void keyPressed()
{
  if(key=='q')
  {
    lscore=0;
    rscore=0;
    p1=false;
    p2=false;
    startOver=true;
  }
  if(key=='p')
  {
    if(ypause==true)
    ypause=false;
    else
    ypause=true;
  
  }
if (key== CODED)
{



if (keyCode==UP)
{
   comPoint1-=10;
      comPoint2-=10;
}
if (keyCode==DOWN)
{
comPoint1+=10;
      comPoint2+=10;
}
}
if(key==ENTER)
{
  menucounter++;
}
if(comPoint1<0)
      comPoint1=0;
      if(comPoint2>600)
      comPoint1=510;
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

void scoring()
{
  int score=0;
  pushMatrix();
 
  textSize(40);
  text(lscore, 300, 50);
  text(rscore,500,50);
    
  popMatrix();
  
   
}
// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(255,lifespan);
    fill(255,lifespan);
    ellipse(location.x,location.y,8,8);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}




// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}


