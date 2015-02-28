
String done = "DONE! CLICK TO RESET";
String load = "LOADING";
int bar = 0;


void setup() {
  size(300, 300);
  textAlign(LEFT);
  //rectMode(CENTER);
  smooth();
}

void draw() {
  background (0);
  text(load, 50, 130);
  text((int)map(bar, 0, 200, 0, 99)+ "%", 120, 130);
  noFill();
  stroke(255);
  rect(50, 140, 200, 20);
  fill(255);
  bar++;
  rect(50, 140, bar, 20);
  if (bar>= 200) {
    bar = 200;
    fill(255);
    background(0);
    text(done, 75, 150);
  }
  
}
void mousePressed () {
  bar = 0;
}


