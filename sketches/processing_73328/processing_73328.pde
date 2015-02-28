
PFont f;
float percent;
String s; 

void setup() {
  size (500, 500);
  background(0);
  //rectMode(CENTER);
  stroke(255);
  percent = 0; 
  f = createFont("Arial", 15, true);
  textFont(f);
  s = "LOADING ";
  
}

void draw() {
  background(0);
  noFill();
  rect(150, height/2 - 20, 200, 20);
  fill(255);
  if (percent < 200) {
    //we want loading bar to end at 5 seconds
    //loading bar is 200px long
    //we call draw 60 times per second
    //so at end of 5 seconds draw is called 300 times
    percent += (200f/300f);  
  }
  int p = round(percent/2);
  text(s + p + "%", 150, height/2 - 40);
  rect(150, height/2 - 20, percent, 20);
  println(percent);
}

void mousePressed() {
  if (percent >= 200) {
    percent = 0;
  } 
}

