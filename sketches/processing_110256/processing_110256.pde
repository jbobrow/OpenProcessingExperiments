
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/110256*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage bg;
PImage img;  
PImage img4; 
PImage img5; 
PImage img6; 
PImage img7;
PImage img8;
PImage img9;

float[] x = new float[5];
float[] y = new float[5];
float[] xSpeed = new float[5];
float[] ySpeed = new float[5];

//black
int t0=0;
int t1=0;
int t2=0;
int t3=0;
int m=0;
int life=3;
import ddf.minim.*;
AudioPlayer player; 
Minim minim;//audio context
void setup() {
  
  minim = new Minim(this);
  player = minim.loadFile("game.mp3");
  player.loop();

  noCursor();
  size(584, 749);
  bg = loadImage("backgr1.jpg");
  img8 = loadImage("eye.png");
  img = loadImage("nangua.png"); 
  img4 = loadImage("g1.png");  
  img5 = loadImage("g2.png");  
  img6 = loadImage("g3.png"); 
  img7 = loadImage("lan.png"); 
  img9 = loadImage("over1.jpg");

  xSpeed[0]= random(1.5, 3);
  ySpeed[0]= random(1.5, 3);
  xSpeed[1]= random(2, 4);
  ySpeed[1]= random(1, 3);
  xSpeed[2]= random(-3, -4);
  ySpeed[2]= random(2, 3);
  xSpeed[3]= random(-3.5, -4.2);
  ySpeed[3]= random (1.5, 3.2);


  x[0] = 150;
  y[0] = 150;
  x[1] = 50;
  y[1] = 300;
  x[2] = 250;
  y[2] = 10;
}

void draw() {
  background(bg);
  //eye
  image(img8, 20, 50, 50, 20); 
  //eye black
  fill(0, t0);
  rect(20, 50, 50, 20); 
  //pumkin
  image(img, 90, 630, 100, 90); 
  image(img, 230, 630, 100, 90); 
  image(img, 370, 630, 100, 90); 
  //black
  fill(0, t1);
  rect(90, 630, 100, 90, t1);
  fill(0, t2);
  rect(230, 630, 100, 90, t2); 
  fill(0, t3);
  rect(370, 630, 100, 90, t3); 
  //ghost
  image(img4, x[0], y[0], 130, 130); 
  image(img5, x[1], y[1], 120, 120); 
  image(img6, x[2], y[2], 125, 125); 
  //player
  image(img7, mouseX, 600, 100, 50); 

  for (int i=0; i < 5; i++) {    
    //bouncing effect    
    x[i] = x[i] + xSpeed[i];
    y[i] = y[i] + ySpeed[i];

    if (x[i] > width-100 || x[i] <-30) {
      xSpeed[i] = -xSpeed[i];
    }
    if (y[i] < 0) {
      ySpeed[i] = -ySpeed[i];
    }

    //collision
    if ((y[i]>500 && y[i]<550) && (x[i]>=mouseX-80 && x[i]<=mouseX+120)) {
      ySpeed[i]=-ySpeed[i];
    }  

    //life coculation
    if (y[i]>height && y[i]<height+ySpeed[i]) {
      life--;
      x[i] = random(450);
      y[i] = random(300);
    }

    //eye effect
    if (y[i]<=40 && x[i]>=50 && x[i]<=100) {
      m=1;
      t0=255;
    }
    if (m==1) {
      image(img4, x[3], y[3], 130, 130);
    }
  }
  fill(255);
  textSize(22);
  text("Life:", 20, 690);
  
  //life bar
  if (life==2)
  {   
    t3=255;
  }
  else if (life==1)
  {
    t2=255;
  }
  else if (life<=0)
  {
    image(img9, 0, 0, 584, 749); 
    t1=255;
  }
}

void keyPressed() {      
  if (key==' ') {
    for (int i=0; i < 5; i++) {         
      x[i] = random(450);
      y[i] = random(300);
    }
    t0=0;
    t1=0;
    t2=0;
    t3=0;
    m=0;
    life=3;
  }
}


