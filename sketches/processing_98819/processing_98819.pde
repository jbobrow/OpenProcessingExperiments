
//GIFimage
Button [] info = new Button [6];
PImage pup;
PImage pupyou;
PImage bowl;
PFont type;
float x = 375;
float y = 290;
float bowlx = 75;
float bowly = 550;
boolean pressed = false;

void setup() {
//Graphics
size(1000,800);
background(255);
smooth();
pup = loadImage("chowup.jpg");
pupyou = loadImage("chowfront.jpg");
bowl = loadImage("bowl.jpg");
type = loadFont("CenturyGothic-60.vlw");
textFont(type);
stroke(103, 203, 255);
  smooth();
  strokeWeight(5);
//Button setup
  info[0] = new Button (130,584,110,300,"food.jpg");
  info[1] = new Button (294,650,110,300,"walk.jpg");
  info[2] = new Button (440,640,110,300,"nails.jpg");
  info[3] = new Button (530,360,110,300,"brushteeth.jpg");
  info[4] = new Button (665,530,620,50,"coat.jpg");
  info[5] = new Button (837,510,620,50,"bathe.jpg");
}

void draw(){
  //PUPPY
  background(255);
  image(pup, x, y);
  image(bowl, bowlx,bowly);
  pressed=false;
  for(int i=0; i<info.length ; i++) {
    if(info[i].info==true) {
    pressed=true;
     }
  }
  if((mousePressed == true) && (pressed==true)) {
  image(pupyou, x,y);
    }
  //TITLE
  fill(255,151,39);
  textSize(60);
  text("TAKING CARE OF", 50,175);
  text("YOUR FIRST PUPPY", 50,225);
  //Buttons
    info[0].display();
    info[1].display();
    info[2].display();
    info[3].display();
    info[4].display();
    info[5].display();
  }
  
  

class Button {
  float x;
  float y;
  float a;
  float b;
  boolean info;
  PImage sign;
  
 Button(float startX, float startY, float infoX, float infoY, String signImageFile) {
    x = startX;
    y = startY;
    a = infoX;
    b = infoY;
    sign = loadImage(signImageFile);
  }

  void display() {
    if (dist(x, y, mouseX, mouseY) < 20) {
      fill(15, 161, 255);
      info = true;
    } else {
     fill(255, 151, 39);
     info = false;
    } ellipse(x, y, 40, 40);
    
   if ((mousePressed ==true) && (info==true)) {
   image(sign, a,b);
   } else {
   info=false;
   }
  }
}







