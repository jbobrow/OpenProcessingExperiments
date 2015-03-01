
float house = 200; //Number to determine house scale

float birdX = 300; //Bird position
float birdY = 300;
float birdSPX = 2; //Bird starting speed
float birdSPY = 2;

// Sun Variables
int sunRadius = 70;      // size of the sun
int xStart = -sunRadius; // The initial x position
int yStart = 20;         // The initial y position
float xSun = xStart;     // the x position of the sun
float ySun = yStart;     // the y position of the sun
float xMoon;  // the x position of the moon
float yMoon;  // the y position of the moon

// Arc variables
float t = 0;   // Start time
float t2 = 0; //Moon start time
boolean setTime = true;
float time;
float currentTime;
float currentTime2;
float duration = 60 * 1000; // convert 6 seconds to milliseconds

int night = 0;  //Variables for the night cycle visuals
int seeMoon = 0;

float mil = second()*1000; //Current seconds

Cloud cloud1;
Cloud cloud2;
Cloud cloud3;
Cloud cloud4;

Star stars[] = new Star[500];
Star stars2[] = new Star[100];
Star stars3[] = new Star[50];

Tree trees[] = new Tree[7];

void setup() {
  size(600, 600);
  textFont(createFont("SansSerif", 18));

  cloud1 = new Cloud(random(0, 20), random(1, 300), random(30, 50), random(.1, 1));
  cloud2 = new Cloud(random(50, 100), random(1, 250), random(50, 60), random(.1, 1));
  cloud3 = new Cloud(random(200, 300), random(1, 200), random(70, 100), random(.1, 1));
  cloud4 = new Cloud(random(500, 600), random(1, 200), random(50, 100), random(.1, 1));

  for (int i = 0; i < 500; i++) {
    stars[i] = new Star(random(1, width), random(1, 369));
  }
  for (int i = 0; i < 100; i++) {
    stars2[i] = new Star(random(1, 290), random(300, 470));
  }
  for (int i = 0; i < 50; i++) {
    stars3[i] = new Star(random(505, width), random(300, 473));
  }

  for (int i = 0; i < 7; i++) {
    trees[i] = new Tree(random(1, 239), random(500, height), random(10, 40), int(random(0, 2)), int(random(800, 2000)));
  }
}

void draw() {
  float houseX = width-house*1.5;//House position
  float houseY = height-house;

  color sky = color(night, 200, 200);
  background(sky);

  if (setTime=true) {
    currentTime = millis()+mil-15000 % duration; //Setting sun/moon positions to current seconds
    currentTime2 = millis()+mil+15000 % duration;
    setTime=false;
  } else {
    currentTime = millis() % duration;
  }

  t = currentTime / duration * 2 * 3.14;  //Sun
  t2 = currentTime2 / duration * 2 * 3.14;//Moon

  noStroke(); 
  fill(255, 255, 0);
  ellipse(xSun, ySun, sunRadius, sunRadius); //Sun


  xSun = cos(t) * width/2 + width / 2;         //Placing the sun/moon
  ySun = sin(t) * height/2 + houseY+house*.5;  //
  xMoon = cos(t2) * width/2 + width / 2;       //
  yMoon = sin(t2) * height/2 + houseY+house*.5;//


  if (ySun>houseY+house*.5&&xSun<width/2) {
    time=1;
  }//Night
  if (ySun>houseY+house*.5-25&&xSun>width/2) {
    time=0;
  }//Evening
  if (ySun<houseY+house*.5+50&&xSun>width/2) {
    time=3;
  }//Afternoon
  if (ySun<houseY+house*.5+75&&xSun<width/2) {
    time=2;
  }//Morning

  if (ySun>houseY+house*.5-50&&xSun<width/2) {
    seeMoon+=5;
  }//Night
  if (ySun>houseY+house*.5-50&&xSun>width/2) {
    seeMoon+=5;
  }//Evening
  if (ySun<houseY+house*.5+50&&xSun>width/2) {
    seeMoon-=10;
  }//Afternoon
  if (ySun<houseY+house*.5+50&&xSun<width/2) {
    seeMoon-=10;
  }//Morning

  if (time==0||time==1)
    night+=1;
  if (time==2)
    night-=1;
  if (night>150) 
    night=150;
  if (night<0) 
    night=0;

  if (seeMoon>255) 
    seeMoon=255;
  if (seeMoon<0) 
    seeMoon=0;

  fill(0, 150, 0); rect(0, houseY+house*.5, width, height); //Ground

  for (int i = 0; i < 7; i++) {
    trees[i].run();
  }

  fill(255, 233, 92); noStroke(); 
  triangle(houseX+house, houseY+house*.5, houseX+house*1.4, houseY+house*.5, houseX+house*1.2, houseY+house*.4);//Garage
  rect(houseX+house, houseY+house*.5, house*.4, house*.25);
  stroke(0);
  line(houseX+house, houseY+house*.5, houseX+house*1.2, houseY+house*.4); //Outline of Garage
  line(houseX+house*1.4, houseY+house*.5, houseX+house*1.2, houseY+house*.4);
  line(houseX+house*1.4, houseY+house*.5, houseX+house*1.4, houseY+house*.75);
  line(houseX+house*1.35, houseY+house*.55, houseX+house*1.35, houseY+house*.75);
  line(houseX+house*1.05, houseY+house*.55, houseX+house*1.05, houseY+house*.75);
  line(houseX+house*1.05, houseY+house*.55, houseX+house*1.35, houseY+house*.55);
  line(houseX+house*1.05, houseY+house*.58, houseX+house*1.35, houseY+house*.58);
  line(houseX+house*1.05, houseY+house*.61, houseX+house*1.35, houseY+house*.61);
  line(houseX+house*1.05, houseY+house*.64, houseX+house*1.35, houseY+house*.64);
  line(houseX+house*1.05, houseY+house*.67, houseX+house*1.35, houseY+house*.67);
  line(houseX+house*1.05, houseY+house*.7, houseX+house*1.35, houseY+house*.7);
  line(houseX+house*1.05, houseY+house*.73, houseX+house*1.35, houseY+house*.73);
  line(houseX+house, houseY+house*.75, houseX+house*1.4, houseY+house*.75);

  rect(houseX, houseY, house, house*.75);//House (300,400,200,150)
  triangle(houseX, houseY+house*.35, houseX-house*.25, houseY+house*.45, houseX, houseY+house*.45);//Porch top
  rect(houseX-house*.25, houseY+house*.45, house*.01, house*.25);//Left porch column
  rect(houseX-house*.25, houseY+house*.70, house*.25, house*.05);//Porch base
  rect(houseX-house*.24, houseY+house*.625, house*.24, house*.01);//Porch railing

  line(houseX, houseY+house*.05, houseX+house, houseY+house*.05); //House lines
  line(houseX, houseY+house*.1, houseX+house, houseY+house*.1);
  line(houseX, houseY+house*.15, houseX+house, houseY+house*.15);
  line(houseX, houseY+house*.2, houseX+house, houseY+house*.2);
  line(houseX, houseY+house*.25, houseX+house, houseY+house*.25);
  line(houseX, houseY+house*.3, houseX+house, houseY+house*.3);
  line(houseX, houseY+house*.35, houseX+house, houseY+house*.35);
  line(houseX, houseY+house*.4, houseX+house, houseY+house*.4);
  line(houseX, houseY+house*.45, houseX+house, houseY+house*.45);
  line(houseX, houseY+house*.5, houseX+house, houseY+house*.5);
  line(houseX, houseY+house*.55, houseX+house, houseY+house*.55);
  line(houseX, houseY+house*.6, houseX+house, houseY+house*.6);
  line(houseX, houseY+house*.65, houseX+house, houseY+house*.65);
  line(houseX, houseY+house*.7, houseX+house, houseY+house*.7);

  fill(147, 36, 151);
  rect(houseX+house*.75, houseY+house*.45, house*.125, house*.25);//Front door (450,490,25,50)
  fill(255, 244, 171);
  rect(houseX+house*.75, houseY+house*.7, house*.175, house*.025);//First step (450,540,35,5)
  rect(houseX+house*.75, houseY+house*.725, house*.2, house*.025);//Second step (450,545,40,5)
  fill(109, 136, 198);
  rect(houseX+house*.5, houseY+house*.5, house*.1, house*.125);//Window Low right (400,500,20,25) 
  rect(houseX+house*.25, houseY+house*.5, house*.1, house*.125);//Window Low left (350,500,20,25)
  rect(houseX+house*.25, houseY+house*.2, house*.1, house*.125);//Window Top left (350,440,20,25)
  rect(houseX+house*.75, houseY+house*.2, house*.1, house*.125);//Window Top right (450,440,20,25)
  fill(100);
  quad(houseX-house*.025, houseY+house*.05, houseX+house*1.025, houseY+house*.05, houseX+house, houseY-house*.15, houseX, houseY-house*.15);//Roof (295,410,505,410,500,370,300,370)


  stroke(0);
  fill(0, 0, 0, night);
  rect(-1, -1, width+2, height+2);

  if (time==0)
    fill(255, 255, 50, night);
  if (time==1||time==3||time==2)
    fill(255, 255, 50, 0);
  rect(houseX+house*.5, houseY+house*.5, house*.1, house*.125);//Window Low right 
  rect(houseX+house*.25, houseY+house*.5, house*.1, house*.125);//Window Low left
  rect(houseX+house*.25, houseY+house*.2, house*.1, house*.125);//Window Top left
  rect(houseX+house*.75, houseY+house*.2, house*.1, house*.125);//Window Top right

  for (int i = 0; i < 500; i++) {//Run stars
    stars[i].run();
  }
  for (int i = 0; i < 100; i++) {
    stars2[i].run();
  }
  for (int i = 0; i < 50; i++) {
    stars3[i].run();
  }

  cloud1.run();//Run clouds
  cloud2.run();//
  cloud3.run();//
  cloud4.run();//

  fill(0); 
  ellipse(birdX, birdY, 15, 15); //Draw bird
  birdX=birdX+birdSPX;  //Move bird
  birdY=birdY+birdSPY;  //
  birdSPX=birdSPX+random(-.05, .05);//
  if (birdSPX>2) {
    birdSPX=2;
  }//
  if (birdSPX<-2) {
    birdSPX=-2;
  }
  birdSPY=birdSPY+random(-.05, .05);//
  if (birdSPY>2) {
    birdSPY=2;
  }//
  if (birdSPY<-2) {
    birdSPY=-2;
  }//
  if (birdY>houseY-35) {
    birdSPY=birdSPY-.1;
  }//
  if (birdY<20) {
    birdSPY=birdSPY+.1;
  }//
  if (birdX>width-20) {
    birdSPX=birdSPX-.1;
  }//
  if (birdX<20) {
    birdSPX=birdSPX+.1;
  }//

  fill(255, 255, 255, seeMoon);
  ellipse(xMoon, yMoon, sunRadius, sunRadius); //Moon


  fill(0);
  stroke(0);
  text(""+mouseX+",", mouseX+10, mouseY+25);  //Shows mouse coordinates on screen
  text(""+mouseY+"", mouseX+10, mouseY+45);
}

class Cloud{

  float x; //Position
  float y; //Position
  float s; //Size
  float sp;//Speed
  int grow = int(random(0,2));
  float frames;
  
Cloud(float tempX,float tempY,float tempS, float tempSP){
  x = tempX;
  y = tempY;
  s = tempS;
  sp = tempSP;
}  

 void run(){
  noStroke();
  fill(255,255,255,240);
  ellipse(x,y+s,s,s);
  ellipse(x+s*.2667,y+s*.6667,s,s);
  ellipse(x+s*.5556,y+s,s,s);
  ellipse(x+s*.8,y+s*.6667,s,s);
  ellipse(x+s*1.08889,y+s,s,s);
  x=x+sp;
  
  if(grow==0){s+=.05;}
  if(grow==1){s-=.05;}
  
  frames+=1;
  if(frames>random(90,200)){frames=0;grow-=1;grow*=-1;}
  
  if(x>width+s*1.5)
  x=-s*1.5;
}
}
class Star{

  float x; //Position
  float y; //Position
  float s = 2; //Size
  int grow = int(random(0,2));
  float frames;
  
Star(float tempX,float tempY){
  x = tempX;
  y = tempY;
}  

 void run(){
  noStroke();
  fill(255,255,255,night);
  ellipse(x,y,s,s);
  
  s=random(0,3);
  
  frames+=1;
  if(frames>random(10,50)){frames=0;grow-=1;grow*=-1;}
}
}
class Tree{

  float x; //Position
  float y; //Position
  float s; //Size
  int grow;
  int growth;
  float frames;
  
Tree(float tempX,float tempY,float tempS, int g, int g2){
  x = tempX;
  y = tempY;
  s = tempS;
  grow = g;
  growth = g2;
}  

 void run(){
  noStroke();
  fill(105,75,12);
  rect(x,y,s*.2,s*.7);
  
  fill(12,105,36);
  triangle(x-s*.7,y,x+s*.7+s*.1,y,x+s*.1,y-s*.5);
  triangle(x-s*.6,y-s*.4,x+s*.6+s*.1,y-s*.4,x+s*.1,y-s);
  if(grow>0){
  triangle(x-s*.5,y-s*.8,x+s*.5+s*.1,y-s*.8,x+s*.1,y-s*1.5);}
  if(grow>1){
  triangle(x-s*.4,y-s*1.2,x+s*.4+s*.1,y-s*1.2,x+s*.1,y-s*2);}
  if(grow>2){
  triangle(x-s*.3,y-s*1.6,x+s*.3+s*.1,y-s*1.6,x+s*.1,y-s*2.25);}
  if(grow>3){
  triangle(x-s*.2,y-s*2,x+s*.2+s*.1,y-s*2,x+s*.1,y-s*2.5);}
  
  

  
  frames+=1;
  if(frames>growth){frames=0;grow+=1;}
}
}


