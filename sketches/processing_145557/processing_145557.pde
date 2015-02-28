
PImage mage;
PImage mage2;
float x=10;
float y=190;
int stage=1;
float pox;
float poy;
int death=0;
int speed=1;
int backs=255;
int scot=1;
boolean newStage = false;
void setup() {
  size(300, 200);
  mage= loadImage("http://studiokura.com/members/p5/files/2014/04/mage1.png");
}
void draw() {
  background(backs);
  if (mousePressed == true) {
    speed=2;

    noCursor();
  }
  else {
    speed=1;
    cursor();
  }
  mage.loadPixels();

  if (stage==1) {
    pox=10;
    poy=190;
    image(mage, 0, 0);
    fill(255, 255, 0, 10);
    rect(170, 170, 20, 30);
    if ((x>170)&&(y>170)) {
      stage=2;
      newStage=true;
    }
  }
  if (stage==2) {
    pox=170;
    poy=170;
    if (newStage) {
      mage= loadImage("http://studiokura.com/members/p5/files/2014/04/mage2.png");
      newStage=false;
    }
    image(mage, 0, 0);


    if ((x<30)&&(y>170)) {
      stage=3;PImage mage;
PImage mage2;
float x=10;
float y=190;
int stage=3;
float pox;
float poy;
int death=0;
int speed=1;
int backs=255;
int scot=1;
void setup() {
  size(300, 200);
  mage= loadImage("mage.png");
}
void draw() {
  background(backs);
  if (mousePressed == true) {
    speed=2;

    noCursor();
  }
  else {
    speed=1;
    cursor();
  }
  mage.loadPixels();

  if (stage==1) {
    pox=10;
    poy=190;
    image(mage, 0, 0);
    fill(255, 255, 0, 10);
    rect(170, 170, 20, 30);
    if ((x>170)&&(y>170)) {
      stage=2;
    }
  }
  if (stage==2) {
    pox=170;
    poy=170;
    mage= loadImage("mage2.png");
    image(mage, 0, 0);


    fill(255, 255, 0, 10);
    rect(0, 0, 30, 30);
    if ((x<30)&&(y>170)) {
      stage=3;
    }
  }
  if (stage==3) {
   
if(scot==1){
  backs+=0;
}else{
  backs-=1;
}
if(backs<5){
  scot=1;
}
if(backs>25){
 scot=0;
}
    
    
    pox=30;
    poy=170;
    mage= loadImage("mage3.png");
    image(mage, 0, 0);
  }

  fill(0);
  text("stage"+stage, 210, 25);
  text("death:"+death, 210, 50);
  if (x<0+3) {
    x=3;
  }
  if (x>width-103) {
    x=width-103;
  }
  if (y<3) {
    y=3;
  }
  if (y>height-3) {
    y=height-3;
  }



  if (mouseX>x) {
    x+=speed;
  }
  if (mouseX<x) {
    x-=speed;
  }
  if (mouseY>y) {
    y+=speed;
  }
  if (mouseY<y) {
    y-=speed;
  }
  ellipse(x, y, 5, 5);
  println(hex(mage.pixels[int(x+y*mage.width)]));
  if (mage.pixels[int(x+y*mage.width)]==color(0, 0, 0)) {
    death+=1;
    x=pox;
    y=poy;
  }
  fill(255, 255, 0);
  rect(mouseX-2, mouseY-2, 4, 4);

      newStage=true;
    }
  }
  if (stage==3) {

    if (scot==1) {
      backs+=0;
    }
    else {
      backs-=1;
    }
    if (backs<5) {
      scot=1;
    }
    if (backs>25) {
      scot=0;
    }


    pox=30;
    poy=170;
    if (newStage) {
      mage= loadImage("http://studiokura.com/members/p5/files/2014/04/mage3.png");
      newStage=false;
    }
    image(mage, 0, 0);
  }

  fill(0);
  text("stage"+stage, 210, 25);
  text("death:"+death, 210, 50);
  if (x<0+3) {
    x=3;
  }
  if (x>width-103) {
    x=width-103;
  }
  if (y<3) {
    y=3;
  }
  if (y>height-3) {
    y=height-3;
  }



  if (mouseX>x) {
    x+=speed;
  }
  if (mouseX<x) {
    x-=speed;
  }
  if (mouseY>y) {
    y+=speed;
  }
  if (mouseY<y) {
    y-=speed;
  }
  stroke(255);
  ellipse(x, y, 5, 5);
  //println(hex(mage.pixels[int(x+y*mage.width)]));
  if (mage.pixels[int(x+y*mage.width)]==color(0, 0, 0)) {
    death+=1;
    x=pox;
    y=poy;
  }
  fill(255, 255, 0);
  rect(mouseX-2, mouseY-2, 4, 4);
}

