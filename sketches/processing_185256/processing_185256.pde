
//Beast Works by Jessy Bonk

float rotX = 0.0, rotY = 0.0;
int lastX, lastY;
float distX = 0.0, distY = 0.0;


//image stuff
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;


//body stuff
//head
int headHeight = 50;
int headWidth = 50;
int headThickness = 50;
//snout
int snoutHeight = 25;
int snoutWidth = 50;
int snoutThickness = 40;
//neck
int neckHeight = 100;
int neckWidth = 100;
//back
int backHeight = 150;
int backWidth = 220;
int backThickness = 50;
//tail
int tailHeight = 50;
int tailWidth = 300;
//legs
int legHeight = 200;
int legWidth = 125;
int legThickness = 25;

void setup() {
  size(900,600,P3D);
  
  //images
  img1 = loadImage("head.png");
  img2 = loadImage("nose.png");
  img3 = loadImage("neck.png");
  img4 = loadImage("body.png");
  img5 = loadImage("legs.png");
  img6 = loadImage("tail.png");
  img7 = loadImage("beastworks.png");
  img8 = loadImage("random.png");
  img9 = loadImage("hit.png");
  img10 = loadImage("click.png");
}

void draw() {
  background(0);
  
  //imported images at start
  image(img1,810,10);
  image(img2,810,105);
  image(img3,810,200);
  image(img4,810,300);
  image(img5,810,400);
  image(img6,810,500);
  image(img7,10,10);
  image(img8,10,100);
  image(img9,10,555);
  image(img10, 10, 515);
  
  //call functions
  
  drawBeast();
  creation();
  screenshot();
}



//FUNCTIONS

void drawBeast(){
  
  noFill();
  stroke(255);
  smooth();
  translate(width/2, height/2, -100);
  //rotateY(PI*mouseX/width);
  rotateX(rotX + distY);
  rotateY(rotY + distX);
  
  beginShape();
  
  //SNOUT
  
  vertex(0,0,0);
  vertex(0,headHeight/2,0);
  vertex(0,headHeight,0);
  vertex(0,headHeight,headThickness);
  vertex(0,headHeight/2,headThickness);
  vertex(0,headHeight/2,0);
  vertex(-snoutWidth,snoutHeight,0);
  vertex(-snoutWidth,snoutHeight*2,0);
  vertex(0,headHeight,0);
  vertex(-snoutWidth,snoutHeight*2,0);
  vertex(-snoutWidth,snoutHeight*2,headThickness);
  vertex(-snoutWidth,snoutHeight,headThickness);
  vertex(-snoutWidth,snoutHeight,0);
  vertex(-snoutWidth,snoutHeight,headThickness);
  vertex(0,headHeight/2,headThickness);
  vertex(0,headHeight,headThickness);
  vertex(-snoutWidth,snoutHeight*2,headThickness);
  vertex(0,headHeight,headThickness);
  vertex(0,headHeight,0);
  endShape();
  
  //HEAD
  
  beginShape();
  vertex(0, 0, 0);
  vertex(headWidth, 0, 0);
  vertex(headWidth,headHeight,0);
  vertex(0, headHeight,0);
  vertex(0,headHeight,headThickness);
  vertex(headWidth,headHeight,headThickness);
  vertex(headWidth,0,headThickness);
  vertex(0,0,headThickness);
  vertex(0,0,0);
  vertex(0,headHeight,0);
  vertex(0,headHeight,headThickness);
  vertex(0,0,headThickness);
  vertex(0,headHeight,headThickness);
  vertex(headWidth, headHeight, headThickness);
  vertex(headWidth, headHeight,0);
  vertex(headWidth, 0, 0);
  vertex(headWidth,0,headThickness);
  vertex(0,0,headThickness);
  endShape();
  
  //NECK
  
  beginShape();
  vertex(headWidth,headHeight/2,headThickness);
  vertex(headWidth,headHeight/2,0);
  vertex(headWidth,headHeight,0);
  vertex(headWidth,headHeight,headThickness);
  vertex(headWidth/2,headHeight,headThickness);
  vertex(headWidth/2,headHeight,headThickness);
  vertex(neckWidth/2,neckHeight,headThickness);
  vertex(neckWidth/2,neckHeight,0);
  vertex(headWidth/2,headHeight,0);
  vertex(headWidth/2,headHeight,headThickness);
  vertex(neckWidth/2,neckHeight,headThickness);
  vertex(neckWidth,neckHeight/2,headThickness);
  vertex(headWidth,headHeight/2,headThickness);
  vertex(headWidth,headHeight/2,0);
  vertex(neckWidth,neckHeight/2,0);
  vertex(neckWidth/2,neckHeight,0);
  endShape();
  
  //BACK
  
  beginShape();
  vertex(neckWidth,neckHeight/2,0);
  vertex(neckWidth/2,neckHeight,0);
  vertex(backWidth/2,backHeight,0);
  vertex(backWidth/2,backHeight,backThickness);
  vertex(backWidth/2,backHeight,0);
  vertex(backWidth,backHeight/1.1,0);
  vertex(backWidth,backHeight/1.1,backThickness);
  vertex(backWidth/2,backHeight,backThickness);
  vertex(neckWidth/2,neckHeight,headThickness);
  vertex(neckWidth,neckHeight/2,headThickness);
  vertex(backWidth/1.3,backHeight/3.5,backThickness);
  vertex(backWidth,backHeight/2.5,backThickness);
  vertex(backWidth,backHeight/1.1,backThickness);
  vertex(backWidth,backHeight/1.1,0);
  vertex(backWidth,backHeight/2.5,0);
  vertex(backWidth,backHeight/2.5,backThickness);
  vertex(backWidth,backHeight/2.5,0);
  vertex(backWidth/1.3,backHeight/3.5,0);
  vertex(backWidth/1.3,backHeight/3.5,backThickness);
  vertex(backWidth/1.3,backHeight/3.5,0);
  vertex(neckWidth,neckHeight/2,0);
  endShape();
  
  //TAIL
  beginShape();
  vertex(backWidth,backHeight/2.5,backThickness);
  vertex(tailWidth,tailHeight,backThickness);
  vertex(tailWidth,tailHeight,0);
  vertex(backWidth,backHeight/2.5,0);
  vertex(backWidth,backHeight/1.5,0);
  vertex(tailWidth,tailHeight,0);
  vertex(tailWidth,tailHeight,backThickness);
  vertex(backWidth,backHeight/1.5,backThickness);
  vertex(backWidth,backHeight/1.5,0);
  endShape();
  
  //LEGS
  //front left leg
  beginShape();
  vertex(backWidth/2.5, backHeight/1.5,backThickness);
  vertex(backWidth/2.5, backHeight/1.5,backThickness+legThickness);
  vertex(legWidth, backHeight/1.5, backThickness+legThickness);
  vertex(legWidth, backHeight/1.5, backThickness);
  vertex(backWidth/2.5, backHeight/1.5, backThickness);
  vertex(backWidth/2.2, legHeight, backThickness);
  vertex(backWidth/2.2, legHeight, backThickness+legThickness);
  vertex(backWidth/2.5, backHeight/1.5, backThickness+legThickness);
  vertex(backWidth/2.2, legHeight, backThickness+legThickness);
  vertex(legWidth, legHeight, backThickness+legThickness);
  vertex(legWidth, legHeight, backThickness);
  vertex(backWidth/2.2, legHeight, backThickness);
  vertex(legWidth, legHeight, backThickness);
  vertex(legWidth, backHeight/1.5, backThickness);
  vertex(legWidth, backHeight/1.5, backThickness+legThickness);
  vertex(legWidth, legHeight, backThickness+legThickness);
  endShape();
  //front right leg
  beginShape();
  vertex(backWidth/2.5, backHeight/1.5,0);
  vertex(backWidth/2.5, backHeight/1.5,0-legThickness);
  vertex(legWidth, backHeight/1.5, 0-legThickness);
  vertex(legWidth, backHeight/1.5, 0);
  vertex(backWidth/2.5, backHeight/1.5, 0);
  vertex(backWidth/2.2, legHeight, 0);
  vertex(backWidth/2.2, legHeight, 0-legThickness);
  vertex(backWidth/2.5, backHeight/1.5, 0-legThickness);
  vertex(backWidth/2.2, legHeight, 0-legThickness);
  vertex(legWidth, legHeight, 0-legThickness);
  vertex(legWidth, legHeight, 0);
  vertex(backWidth/2.2, legHeight, 0);
  vertex(legWidth, legHeight, 0);
  vertex(legWidth, backHeight/1.5, 0);
  vertex(legWidth, backHeight/1.5, 0-legThickness);
  vertex(legWidth, legHeight, 0-legThickness);
  endShape();
  //back right leg
  translate(80,-10,0);
  beginShape();
  vertex(backWidth/2.5, backHeight/1.5,0);
  vertex(backWidth/2.5, backHeight/1.5,0-legThickness);
  vertex(legWidth, backHeight/1.5, 0-legThickness);
  vertex(legWidth, backHeight/1.5, 0);
  vertex(backWidth/2.5, backHeight/1.5, 0);
  vertex(backWidth/2.2, legHeight, 0);
  vertex(backWidth/2.2, legHeight, 0-legThickness);
  vertex(backWidth/2.5, backHeight/1.5, 0-legThickness);
  vertex(backWidth/2.2, legHeight, 0-legThickness);
  vertex(legWidth, legHeight, 0-legThickness);
  vertex(legWidth, legHeight, 0);
  vertex(backWidth/2.2, legHeight, 0);
  vertex(legWidth, legHeight, 0);
  vertex(legWidth, backHeight/1.5, 0);
  vertex(legWidth, backHeight/1.5, 0-legThickness);
  vertex(legWidth, legHeight, 0-legThickness);
  endShape();
  //back left leg
  beginShape();
  vertex(backWidth/2.5, backHeight/1.5,backThickness);
  vertex(backWidth/2.5, backHeight/1.5,backThickness+legThickness);
  vertex(legWidth, backHeight/1.5, backThickness+legThickness);
  vertex(legWidth, backHeight/1.5, backThickness);
  vertex(backWidth/2.5, backHeight/1.5, backThickness);
  vertex(backWidth/2.2, legHeight, backThickness);
  vertex(backWidth/2.2, legHeight, backThickness+legThickness);
  vertex(backWidth/2.5, backHeight/1.5, backThickness+legThickness);
  vertex(backWidth/2.2, legHeight, backThickness+legThickness);
  vertex(legWidth, legHeight, backThickness+legThickness);
  vertex(legWidth, legHeight, backThickness);
  vertex(backWidth/2.2, legHeight, backThickness);
  vertex(legWidth, legHeight, backThickness);
  vertex(legWidth, backHeight/1.5, backThickness);
  vertex(legWidth, backHeight/1.5, backThickness+legThickness);
  vertex(legWidth, legHeight, backThickness+legThickness);
  endShape();
}


void mousePressed() {
  lastX = mouseX;
  lastY = mouseY;
}

void mouseDragged() {
  distX = radians(mouseX - lastX);
  distY = radians(lastY - mouseY);
}

void mouseReleased() {
  rotX += distY;
  rotY += distX;
  distX = distY = 0.0;
}

//created functions

void creation(){
  if(mousePressed){
    if(mouseX > 810 && mouseX < 897){
      if(mouseY > 10 && mouseY < 100){
        headHeight = floor(random(20,70));
        headWidth = floor(random(20,70));
        headThickness = floor(random(20, 70));
      }
      if(mouseY > 105 && mouseY < 195){
        snoutHeight = floor(random(10,40));
        snoutWidth = floor(random(10,50));
      }
      if(mouseY > 200 && mouseY < 290){
        neckHeight = floor(random(50,100));
        neckWidth = floor(random(50,100));
      }
      if(mouseY > 300 && mouseY < 390){
        backHeight = floor(random(75,200));
        backWidth = floor(random(175,250));
        backThickness = floor(random(40,100));
      }
      if(mouseY > 400 && mouseY < 490){
        legHeight = floor(random(150,230));
        legWidth = floor(random(100,140));
        legThickness = floor(random(15,50));
      }
      if(mouseY > 500 && mouseY < 590){
        tailHeight = floor(random(0,150));
        tailWidth = floor(random(250,350));
      }
    }
    if(mouseX > 10 && mouseX < 180){
      if(mouseY > 100&& mouseY < 190){
        headHeight = floor(random(20, 70));
        headWidth = floor(random(20, 70));
        headThickness = floor(random(20, 70));
        snoutHeight = floor(random(10, 40));
        snoutWidth = floor(random(10, 50));
        neckHeight = floor(random(50,100));
        neckWidth = floor(random(50,100));
        backHeight = floor(random(75,200));
        backWidth = floor(random(175,250));
        backThickness = floor(random(40, 100));
        tailHeight = floor(random(0,150));
        tailWidth = floor(random(250,350));
        legHeight = floor(random(150,230));
        legWidth = floor(random(100,140));
        legThickness = floor(random(15,50));
      }
    }
  }
}

void screenshot(){
  if (key == ' ') {
    save("Screenshot.png");
  }
}

