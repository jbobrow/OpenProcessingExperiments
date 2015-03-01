
//Sunny Sharma DMS 110
//click to change color (if statement)

int value = 0;

void setup(){
  size(640,480);
  background(255,255,255);
}

void draw(){
  fill(value);
  rect(25,25,50,50);
  rect(75,75,50,50);
  rect(125,125,50,50);
  rect(175,175,50,50);
  rect(225,225,50,50);
  rect(275,275,50,50);
  rect(325,325,50,50);
  rect(375,375,50,50);
  rect(425,425,50,50);
  
}

void mousePressed(){
  if (value == 0) {
    value = 255;
  } else {
     value = 0;
  }
}
