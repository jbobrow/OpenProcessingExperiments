
String name = "meow?";
PFont f;

void setup() {
  size(500,500);
  background(0);
  f = createFont("AngsanaNew-Italic-48.vlw", 48, true);
}

void draw() {
  fill(0,0,0,15);
  rect(0,0,width,height);
  //background(0);
  fill(255,random(255),170);
  textFont(f);
  textAlign(CENTER);
  name  = name.toUpperCase();
  
  text (name, random(0,width), frameCount*5 % height);
  
}               
