
//Alex Zajicek, Type2

PImage myType;
float randomSize;
float randomDist;

void setup(){
  size(800, 600);
  background(255);
  myType = loadImage("Type.png");
  imageMode(CENTER);
  smooth();
}


void draw(){
  if(mousePressed){
    background(255);
    typeFilter();
  }
}
  

void typeFilter(){
  for(int i = 0; i < 100000; i++){
    int x = int(random(width));
    int y = int(random(height));
    int x2 = int(random(width));
    int y2 = int(random(height));
    color cp = myType.get(x, y);
    color cp2 = myType.get(x2, y2);
    float b2 = brightness(cp2);
    float b = brightness(cp);
    float lineStopX = random(x-50, x+50);
    float lineStopY = random(y-50, y+50);
    float sporeSize = random(4, randomSize/3);
    if(b == 0){
      noStroke();
      fill(0, 0, 0, random(25, 100));
      randomSize = random(25);
      randomDist = random(-12, 12);
      rect(x, y, 5, 5);
      ellipse(x+randomDist, y+randomDist, randomSize/2, randomSize/2);
      stroke(0, 0, 0);
      strokeWeight(.1);
      line(x, y, lineStopX, lineStopY);
      noStroke();
      fill(0, 0, 0, random(50, 150));
      ellipse(lineStopX, lineStopY, sporeSize, sporeSize);
    }
    if(b == 0 && b2 == 0){
      line(lineStopX, lineStopY, x2, y2);
      stroke(0, 0, 0);
      strokeWeight(.1);
      line(x, y, x2, y2);
    }
  }
}

  
/*
  if(mousePressed){
    color cp = get(mouseX, mouseY);
    float r = red(cp);
    float g = green(cp);
    float b = blue(cp);
    println("red:" + r + "blue:" + b);
    fill(r, g, b);
    ellipse(mouseX, mouseY, 50, 50);
  }
*/


