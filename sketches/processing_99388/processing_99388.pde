

int SnowAmount = 100;
float[] SnowX = new float[SnowAmount];
float[] SnowY = new float[SnowAmount];
int frameValue;

void setup() {
  size(500,500);
  frameValue = 3;
  frameRate(frameValue);
  
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
  
  frameControl();
}

public void frameControl() {
  if(mousePressed == true) {
    frameValue++;
  }
}



