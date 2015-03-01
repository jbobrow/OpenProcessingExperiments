
PImage img,img2,backdrop;
PFont font;
float headX = 265;
float headY = 260;
//float joX = width/2;
//float joY = height/2;
//float headW = 10;
//float headH = 20;
float change = 2;

void setup(){
  size (500,600);
  backdrop = loadImage("washingtondc.jpg");
  img = loadImage("horseBobble.gif");
  img2 = loadImage("joHead.gif");
  font = loadFont("Consolas-Bold-48.vlw");
}

void draw(){
  background(0);
  imageMode(CENTER);
  image(backdrop,width/2,180,800,600);
  textFont(font);
  textAlign(CENTER,CENTER);
  fill(153,0,0);
  text("Missing you!!!",width/2,560);
  
  if (mousePressed){
  
  float sinOfTime = sin(millis() *0.007);
  float sinMappedX = map(sinOfTime, -1.0,1.0,140,160);
  float sinMappedY = map(sinOfTime,-1.0,1.0,198,220);

  image(img,width/2,400,width/2,height/2);
  image(img2,headX,headY,sinMappedX,sinMappedY);
  
  }
  else {
    image(img,width/2,400,width/2,height/2);
    image(img2,width/2+15,255,160,198);
  }
}
  


