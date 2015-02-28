
PFont font;

void setup() {
  size(300,300);
  noStroke();
  font = loadFont("Archer-Book-24.vlw");
}

void draw() {
  background(120);
  float h = map(hour(),0,23,30,(width-30));
  float m = map(minute(),0,60,30,(width-30));
  float s = map(second(),0,60,30,(width-30));

  fill(255,200,0);
  rect(h,0,10,100);
  fill(200,135,200);
  rect(m,100,10,100);
  fill(164,220,240);
  rect(s, 200,10,100);

  //int htext = hour();
  fill(240);
  textFont(font);
  if((mouseX>20)&&(mouseX<width-40)) {
    text((hour() + ":" + minute() + ":" + second()),mouseX,mouseY);
    fill(h,m,s,100);
    rect(0,0,width,height);
    noCursor();
  }
  println(s);
  
}

void mouseMoved() {
  
}


