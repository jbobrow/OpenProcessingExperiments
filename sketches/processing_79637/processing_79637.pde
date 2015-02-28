
float a=0.0;
float ax;
float bx= 4;
float l1=50; 
float l2=300; 
float l3=550;
float lz=600; 
float az=0;
float bz=3;
float f1=random(100, 550);
float f2=random(200);
float f3=5;
float f4=550;
float f5=10;
float f6=400;
float f7=6;
float f8=2;
PImage f;
PImage a1;
PImage a2;
PImage a3;
PImage a4;
PImage a5;
int score;
boolean create=true;
float radius=20.0;
int timeLast=0;
int timer=20;
int give=90;

void setup() {
  size(600, 600);
  a1=loadImage("snowflake-icon.png");
  a2=loadImage("snowflake-icon.png");
  a3=loadImage("VOL.jpg");
  a4=loadImage("Lava.png");
  f=loadImage("fire.png");
  a5=loadImage("cloud.png");

  noCursor();
}

void draw() {
  background(a3);
  fill(0, 0, 255);
  text("score: "+score, 10, 10);
  text("timer: "+timer, 70, 10);

  if (score>3) {
    image (a5, 50, 0, 100, 100);
    image (a5, 350, 0, 100, 100);
  }

  if (score>9) {
    image(a5,200,0,100,100);
    image(a5,500,0,100,100);
  }


  if (score<-5) {
    image (a4, l1, lz, 100,100);
  }
  if (score <-10)
  {
    image (a4, l2, lz,100,100);
  }
  if (score<-15)
  {
    image (a4, l3, lz,100,100);
    
  }
  



  if (timer>0) {
    snowFlake();
    mouseButton();
    mouseDragged();
    fire(); 
    game();
  }
}

void snowFlake () {
  pushMatrix();
  imageMode(CENTER);
  translate (mouseX, mouseY);
  a-=TWO_PI/100;
  rotate(a);
  image (a1, 0, 0, 50, 50);
  popMatrix();
}

void mouseButton() {
  if ( mouseButton==LEFT)
  {
    if (true) {
      if (create) {
        create=!create;
      }
      else {

        translate(0, 0);
      }
    }
  }
  if (mouseButton==LEFT) {
    image (a2,mouseX,az,give,give);
    az+=bz;
  }
if (az>=600)
  {
    az=0;
    score+=1;
  }
  
}
void mouseDragged() {
  if (mousePressed) {
    a-=10;
    az+=10;
  }
}

void fire() {
  image(f, f6, f4, give, give);

  image (f,f1,f4,100,100);
  f1+=f3;
  if (f1>600)
  {
    f1=-f3;
  }
  if (f1<0)
  {
    f1+=f3;
  }
  if (dist(f1, f4, mouseX, az)<radius*2 || dist(f2, f4, mouseX,az)<radius*2||dist(f5, f4, mouseX,az)<radius*2 || dist(f6,f4,mouseX,az)<radius*2){
        az=0;
      score-=1;
      fill(255, 0, 0);
      rect (0, 0, 600, 600);
    
  }
  if (timer <= 15)
  {
    image(f, f2, f4, give, give);
    f2+=f7;
  }
  if (f2>600)
  {
    f2=-f7;
  }
  if (f2<=0)
  {
    f2+=f7;
  }
  
  if (timer <= 11)
  {
    image(f, f5, f4, give, give);
    f5+=f8;
  }
  if (f2>600)
  {
    f5=-f8;
  }
  if (f2<=0)
  {
    f5+=f8;
  }
 
}


  
 



void game() { 
  if (second()!=timeLast) { 
    timeLast=second(); 
    timer-=1;
  }
  
}


