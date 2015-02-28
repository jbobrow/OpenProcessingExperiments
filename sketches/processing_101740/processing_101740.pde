
// @pjs preload="cloud0000.gif,cloud0001.gif,cloud0002.gif,cloud0003.gif";
// @pjs preload="angles0000.gif";
// @pjs preload="god.gif,recursivepizzatime_1.gif,recursivepizzatime_2.gif,recursivepizzatime_3.gif,recursivepizzatime_4.gif";
// @pjs preload="michael0001.gif,michael0002.gif,michael0003.gif,michael0004.gif,michael0005.gif,michael0006.gif,michael0007.gif,michael0008.gif";
// @pjs preload="god0000.gif,god0001.gif,god0002.gif,god0003.gif,god0004.gif,god0005.gif,god0006.gif,god0007.gif,god0008.gif,god0009.gif,god0010.gif,god0011.gif,god0012.gif,god0013.gif,god0014.gif,god0015.gif,god0016.gif";  

var audioElement1 = document.createElement("audio");
var audioElement2 = document.createElement("audio");

int michaelFrame=16;
int michaelframe=0;
int godFrame=17;
int godframe=0;

Block[] block = new Block[10];
PImage pizza1,pizza2,pizza3,pizza4,angel1,angel2,cloud1,cloud2,cloud3,cloud4,cloud5,cloud6;
PImage[] michael_god = new PImage[michaelFrame];
PImage[] god = new PImage[godFrame];
 
void setup() {
  size(1400, 700);
 
  god[0]=loadImage("god0000.gif");
  god[1]=loadImage("god0001.gif");
  god[2]=loadImage("god0002.gif");
  god[3]=loadImage("god0003.gif");
  god[4]=loadImage("god0004.gif");
  god[5]=loadImage("god0005.gif");
  god[6]=loadImage("god0006.gif");
  god[7]=loadImage("god0007.gif");
  god[8]=loadImage("god0008.gif");
  god[9]=loadImage("god0009.gif");
  god[10]=loadImage("god0010.gif");
  god[11]=loadImage("god0011.gif");
  god[12]=loadImage("god0012.gif");
  god[13]=loadImage("god0013.gif");
  god[14]=loadImage("god0014.gif");
  god[15]=loadImage("god0015.gif");
  god[16]=loadImage("god0016.gif");
  
  pizza1=loadImage("recursivepizzatime_1.gif");
  pizza2=loadImage("recursivepizzatime_2.gif");
  pizza3=loadImage("recursivepizzatime_3.gif");
  pizza4=loadImage("recursivepizzatime_4.gif");
  
  angel1=loadImage("angles0000.gif");
  angel2=loadImage("angles0000.gif");
  
  cloud1=loadImage("cloud0000.gif");
  cloud2=loadImage("cloud0002.gif");
  cloud3=loadImage("cloud0001.gif");
  cloud4=loadImage("cloud0003.gif");
  cloud5=loadImage("cloud0001.gif");
  cloud6=loadImage("cloud0003.gif");

  michael_god[0]=loadImage("michael0001.gif");
  michael_god[1]=loadImage("michael0001.gif");
  michael_god[2]=loadImage("michael0002.gif");
  michael_god[3]=loadImage("michael0002.gif");
  michael_god[4]=loadImage("michael0003.gif");
  michael_god[5]=loadImage("michael0003.gif");
  michael_god[6]=loadImage("michael0004.gif");
  michael_god[7]=loadImage("michael0004.gif");
  michael_god[8]=loadImage("michael0005.gif");
  michael_god[9]=loadImage("michael0005.gif");
  michael_god[10]=loadImage("michael0006.gif");
  michael_god[11]=loadImage("michael0006.gif");
  michael_god[12]=loadImage("michael0007.gif");
  michael_god[13]=loadImage("michael0007.gif");
  michael_god[14]=loadImage("michael0008.gif");
  michael_god[15]=loadImage("michael0008.gif");
  
  for (int i = 0; i < block.length; i++) {
    if (block[i] != null) {
      block[i].init();
    }
  }
  level = .1;
  mouseX = width/2;
  frameRate(30);
  
  audioElement1.setAttribute("src","johnnysnatch_3.mp3");
  audioElement2.setAttribute("src","johnnysnatch_2.mp3");
  audioElement1.play();
}
 
float level;
int timer;
int blockCount;
float playerPos;
float playerSpeed;
float moveSpeed;
float scroll;
float scrollSpeed;
float sinval;
float angle;
float speed = 10;
boolean michael = false;

void draw() {
  background(0);  
  lineEffect();
     
  makeEnemy(); 
  moveEnemy();
  player();
   
  fadeEffect();
}
 
void moveEnemy() {

  playerSpeed = sqrt((sq(mouseX - width/2)))/20;
  moveSpeed+=playerSpeed/20;
  if (mouseX >= width/2) {
    for (int i = 0; i < block.length; i++) {
      if (block[i] != null) {
        block[i].setXPos(block[i].getXPos() - playerSpeed);
      }
    }
  }
  else {
    for (int i = 0; i < block.length; i++) {
      if (block[i] != null) {
        block[i].setXPos(block[i].getXPos() + playerSpeed);
      }
    }
  }
}
 
void makeEnemy() {
  timer++;
  if (timer % 750 == 0) {
    level+=.1;
  }
  if (timer % 2.5 == 0) {
    block[blockCount] = new Block();
    block[blockCount].init();
    blockCount++;
  }
  for (int i = 0; i < block.length; i++) {
    if (block[i] != null) {
      block[i].make();
      block[i].move();
      block[i].check();
    }
  }
}
 
void player() {
  angle = angle + speed;
  sinval = sin(angle);
  godframe = (godframe+1) % godFrame;
  int godoffset = 0;
  michaelframe = (michaelframe+1) % michaelFrame;
  int michaeloffset = 0;
  
  if(michael==false){
  image(god[(godframe+godoffset) % godFrame], width/2-100,sinval*20);  
  godoffset+=1;
  }  
  if(michael==true){
  image(cloud1,sinval*133+100,0-sinval*5);
  image(cloud3,(width/4)*3-sinval*300,sinval*10);
  image(angel1,width-554,sinval*75);
  image(angel2,0,sinval*-75);
  image(cloud2,sinval*200,215-sinval*15);
  image(cloud4,(width/4)*3-sinval*225,250-sinval*12); 
  image(michael_god[(michaelframe+michaeloffset) % michaelFrame], width/2-250,sinval*20);  
  michaeloffset+=1;
}
}
 
void lineEffect() {
  scrollSpeed = -(mouseX - width/2)/5;
  scroll+=scrollSpeed/5;
  float lineclr=random(128,255);
  float lineclr2=random(0,128); 
  for (int i = -width; i < width*2; i+=25) {
    strokeWeight(25);
    if (i/25 % 2 == 0) {
      stroke(255);
    }
    else {
      stroke(0, lineclr, lineclr, 63);
    }
    line(width/2, -height, i + scroll, height);
    line(0, i, width, i);
    if (scroll >= 50 || scroll <= -50) {
      scroll = 0;
    }
    strokeWeight(3);
  }
}
 
void fadeEffect() {
  if(michael==true){
    for (int i = 0; i <= 150; i++) {
    stroke(255, i*1.5);
    float randomdepth=random(50,150);
    line(0, randomdepth - i, width, randomdepth - i);
  }
  }
  if(michael==false){
  for (int i = 0; i <= 150; i++) {
    stroke(255, i*1.5);
    line(0, 150 - i, width, 150 - i);
  }
  }
}
 
class Block {
  float xpos;
  float ypos;
  float enemySpeed;
  float ref;
  float backRef;
  float siz;
 
  void init() {
    xpos = random(-width*2, width*3);
  }
 
  void make() {
    if (mouseX >= (width/4)*3) {
      stroke(255, 0, 0);
      beginShape();
      fill(255);
      image(pizza4,xpos - siz + ref, height-ypos - siz - ref*3/4 - backRef);
      endShape(CLOSE);
      }
    else if (mouseX >= width/2) {
      stroke(255, 0, 0);
      beginShape();
      fill(255);
      image(pizza3,xpos - siz + ref, height-ypos - siz - ref*3/4 - backRef);
      endShape(CLOSE);
      }
    else if (mouseX >= width/4) {
      stroke(255, 0, 0);
      beginShape();
      fill(255);
      image(pizza2,xpos - siz + ref, height-ypos - siz - ref*3/4 - backRef);
      endShape(CLOSE);
      }
    else {
      stroke(255, 0, 0);
      //noFill();
      beginShape();
      fill(255);
      image(pizza1,xpos - siz - ref, height-ypos + siz + ref - backRef);
      endShape(CLOSE);   
    }
  }
 
  void move() {
    if (ypos <= height*3/2) {
      ypos+=enemySpeed;
      enemySpeed+=level*1.5;
      siz+=level + .3;
      backRef = sqrt(sq(ypos))/20; 
      ref = sqrt(sq(mouseX - width/2))/16;
    }
  }
 
  void check() {
    /*
    if (sqrt(sq(width/2 - xpos+100) + sq(height - ypos)) >= 150 && sqrt(sq(width/2 - xpos+100) + sq(height - ypos)) <= 300 ) {
      filter(INVERT);
      audioElement1.pause();
      audioElement2.play();
      michael=!michael;
    }*/
       if (sqrt(sq(width/2 - xpos*1.25) + sq(height - ypos*1.25)) <= 150) {
      filter(INVERT);
      audioElement1.pause();
      audioElement2.play();
      michael=!michael;
    }
  }
 
  float getXPos() {
    return xpos;
  }
 
  void setXPos(float x) {
    xpos = x;
  }
}



