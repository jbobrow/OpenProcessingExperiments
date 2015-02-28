
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

PFont f;
PImage img;

void setup() {
  size(400,400);
  background(0);
  smooth();
  frameRate(30);
  
  f = loadFont("Monospaced-20.vlw");
  img = loadImage("space.jpg");
}

void draw() {
  fill(0);
  stroke(255);
  
  //button1
  rect(0,0,50,50);
  
  //button2
  rect(349,0,50,50);
  
  //button3
  rect(0,349,50,50);
  
  //button4
  fill(255,0,0);
  rect(349,349,50,50);
  
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);
  
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);

}

void mousePressed() {
  //button1
  if (mouseX > 0 && mouseX < 50 && mouseY > 0 && mouseY < 50) {
    background(0);
    
    //button2
  } else if (mouseX > 349 && mouseX < 400 && mouseY > 0 && mouseY < 50) {
    x = random(width);
    y = random(height);

    //legs
    stroke(5,90,26);
    strokeWeight(4);
    line(x-10,y+40,x-20,y+60);
    line(x+10,y+40,x+20,y+60);

    //arms
    stroke(5,90,26);
    strokeWeight(3);
    line(x-10,y+20,x-30,y);
    line(x+10,y+20,x+30,y);
    //body
    strokeWeight(2);
    stroke(5,90,26);
    fill(15,240,68);
    ellipse(x,y,30,100);

    //head
    strokeWeight(2);
    stroke(5,90,26);
    fill(15,240,68);
    ellipse(x,y-30,60,60);

    //eyes
    strokeWeight(1);
    fill(255);
    ellipse(x-15,y-30,20,20);
    ellipse(x+15,y-30,20,20);
    fill(0);
    ellipse(x-15,y-30,10,10);
    ellipse(x+15,y-30,10,10);

    //mouth
    strokeWeight(2);
    line(x-10,y-10,x+10,y-10);
    
    //button3
  } else if (mouseX > 0 && mouseX < 50 && mouseY > 349 && mouseY < 400) {
    image(img,0,0);
  
  //button4
  } else if (mouseX > 349 && mouseX < 400 && mouseY > 349 && mouseY < 400) {
    textFont(f,20);
    fill(255);
    textAlign(CENTER);
    text ("didn't anyone ever tell you? \n you should NEVER press \n the red button!",200,200);
    
  }
}

