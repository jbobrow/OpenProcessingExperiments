
  float boxX = 72; 
  float boxY = 72;
  color fColor = #ffffff;
  color bgColor = #000000;
  float fColorHue = 0;
//----------------------------//
  float a = 7;
  float b = 1.5;
  float c = 0;
  float nl = 0;
  boolean flag = true;
  boolean effect = false;
//----------------------------//


void setup() {
  size(500, 500);
  colorMode(HSB, 359, 100, 100);
  smooth();
}


void draw() {

  if(effect) {
    fadeBg();
  } else {
  background(#000000);
  }
  
  
  for(int row = 0; row < width; row+=boxX) {
    for(int col = 0; col < height; col+=boxY) {
    calcFlower(boxX/2 + row, boxX/2 + col);
    }
  }
}

  
void calcFlower(float startX, float startY) {
  float r;
  float rr = 5;
  float s, t, u;
  float flowerX;
  float flowerY;  
  
  beginShape();
  for(s = 0; s < 1; s+=.001) {
    t = 2 * PI * s;
    u = nl * t;
    r = rr * abs(a * sin(u) + b * sin(3 * u) + c * sin(5 * u));
    flowerX = r * cos(t);
    flowerY = r * sin(t);
    dispFlower(startX + flowerX, startY + flowerY);
  }
  endShape(CLOSE);
  
  a = 7 * sin(3 * nl);
  b = 3 * cos(5 * nl);
  
if(flag) {
    nl+=.0005;
    if(nl > 6) {
      flag=!flag;
    }
} else {
    nl-=.0005;
    if(nl<.001) {
      flag=!flag;
    }
}
}


void dispFlower(float flowerX, float flowerY) {
  setColor();
  vertex(flowerX, flowerY);
}


void setColor () {
  noFill();  
    
    if(effect) {
      strokeWeight(.1);
      stroke(fColorHue+=.00001,75,100);
      if(fColorHue>360) {
        fColorHue=0;
      }  
  } else {
      strokeWeight(.5);
      stroke(fColor);
    }

}  
  
  
void mousePressed() {
 effect=!effect; 

}


void fadeBg() {
 rectMode(CORNER);
 noStroke();
 fill(bgColor, 10);
 rect(0,0,width,height);
    
}


