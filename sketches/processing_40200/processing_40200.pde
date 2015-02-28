
PImage img;

void setup() {
  size(300, 300);
  rectMode(CENTER);
  img = loadImage("stig.jpg");

}


void draw() {
  loadPixels(); //creates pixel array
  set(0, 0, img);

  int x = mouseX;
  int y = mouseY;
  color c = pixels[(y * width) + x]; // chooses color based on mouse x & y

for (int a = 25; a <=width; a += 25) {  //set variables for offset  of rect size
  for (int b = 25; b <= height; b +=25){  
  noStroke();
  fill(c);  
  rect(a, a , 25, 25);  //creates diagonal line in both x & y axis 
  rect(a-b, a+b, 25,25);  //fills in pattern below 
  rect(a+b, a-b, 25, 25);  //fills in pattern above
  }
 }
}


