
// YAY ROBOTS!

void setup() {
  size(600,600);
  smooth();
}

void draw() {
  background(64,74,175);
  
  // static elements
  
  noStroke();
 
    // legs
  
  fill(#EA50EA);
  rectMode(CENTER);
  rect(width*0.4,height*0.8,50,100);
  rect(width*0.6,height*0.8,50,100);
  rect(width*0.35,height*0.9,150,50);
  rect(width*0.65,height*0.9,150,50);
  
  // body
  
  fill(#60AFE3);
  rectMode(CENTER);
  rect(width*0.5,height*0.65,400,150);
  fill(#60C1E3);
  rect(width*0.5,height*0.55,450,200);
  
  // eye
  
  fill(#EA50EA);
  ellipse(width*0.5,height*0.4,215,215);
  fill(255,150);
  ellipse(width*0.5,height*0.4,200,200);
  fill(255,230);
  ellipse(width*0.5,height*0.4,190,190);
  
  // color changing buttons
  
  float x = mouseX;
  float y = mouseY;
  
  for (int a = 100; a <= 500; a+= 50) {
    if ((x > 50) && (x < 150)) {
      fill(x,y,x);
      ellipse(a,height*0.62,15,15);
      fill(y,x,y);
      ellipse(a,height*0.67,15,15);
    } else if ((x > 150) && (x < 250)) {
      fill(x-50,y+50,x-50);
      ellipse(a,height*0.62,15,15);
      fill(y-50,y+50,y-50);
      ellipse(a,height*0.67,15,15);
    } else if ((x > 250) && (x < 350)) {
      fill(x/2,y/2,x/2);
      ellipse(a,height*0.62,15,15);
      fill(y/2,x/2,y/2);
      ellipse(a,height*0.67,15,15);
    } else if ((x > 350) && (x < 450)) {
      fill(width-x,height-y,width-x);
      ellipse(a,height*0.62,15,15);
      fill(height-y,width-x,height-y);
      ellipse(a,height*0.67,15,15);
    } else if ((x < 50) || (x > 450)) {
      fill(255);
      ellipse(a,height*0.62,15,15);
      ellipse(a,height*0.67,15,15);
    }
  }
  
  // moving eye
  
  fill(0);
  noStroke();
  float pupilX = map(x,0,width,250,350);
  float pupilY = map(y,0,height,200,300);
  ellipse(pupilX,pupilY,80,80);
}


