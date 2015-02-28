
  float r = random(60*6);
  
void setup() {
  size(500, 500);
  frameRate(1);
  smooth();
  PFont font;
font = loadFont("GillSansMT-10.vlw");
textFont(font);
}

void draw() {
    background(255);
    fill(20, 20, 20);
    noStroke();
  float center = width/2;
  textSize(10);
  ellipse(center,center,480,480);

  stroke(255,30);
  noFill();
    strokeWeight(0.5);
    for(int i = 0; i<480; i+=8) {
    ellipse(center,center,i,i);
    }
    stroke(255,100);
    strokeWeight(2);
    for(int j = 0; j<minute()*8; j+=8) {
    ellipse(center,center,j,j);
    }
    stroke(230,r, 80);
    strokeWeight(5);
    for(int k = 5; k<hour()*20+5; k+=20) {
    ellipse(center,center, k , k);
  }
  stroke(255);
   strokeWeight(2);
    ellipse(center,center, second()*8 , second()*8);

//
  fill(255);

text(second() , center-4 + 40,470+4);
text( (hour()-1) % 12 +1, center-4 - 40,470+4);
text(minute() , center-4,470+4);
  
}
