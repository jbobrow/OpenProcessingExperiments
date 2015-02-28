

int SnowAmount = 100;
float[] SnowX = new float[SnowAmount];
float[] SnowY = new float[SnowAmount];
int frameValue;
int fillWidth = 20;
PImage img;

void setup() {
  size(500,374);
  smooth();
  img = loadImage("NoSchoolPic.jpg");
  
  frameRate(frameControl());
  
}

void draw() {
  
  background(0);
  
  textSize(14);
  text("Snow Level Bar", 30, 50);
  fill(255,255,255);
  
  color c = color(153, 193, 214);
  fill(c);
  noStroke();
  rect(width/2-100, 40, 300, 20);
  
  fillRect();
  
  color c2 = color(255, 255, 255);
  fill(c2);
  noStroke();
  
  
  for(int i = 0 ; i < SnowAmount ; i++) {
    SnowX[i] = (float)Math.random() * 500;
    SnowY[i] = (float)Math.random() * 500;
  }
  for(int i = 0 ; i < SnowAmount ; i++) {
    ellipse(SnowX[i], SnowY[i], i*0.15, i*0.15);
  }
  
  ellipse(width/2, 374, 500, 100);   //ground
  ellipse(150, 320, 140,140);  // snowman body
  ellipse(150, 240, 100,100);   //snowman body2

  fill(0); //eyes
  ellipse(130, 220, 15,15);
  ellipse(170, 220, 15, 15);
  
  color c3 = color(245, 172, 54); //nose
  fill(c3);
  triangle(150, 230, 150, 250, 180, 240);
}

public int frameControl() {
  frameRate = 3;
  if( mousePressed == true) {
    frameRate += 1;
  }
  return (int)frameRate;  
}

public int fillRect() {

  if(mousePressed == true) {
    fill(66, 85, 198);
    rect(width/2 - 100, 40, fillWidth, 20 );
    fillWidth = fillWidth + 20; 
    
    if(fillWidth == 340) {
        noLoop();
        background(img);
    }
  }
  return fillWidth;
}


