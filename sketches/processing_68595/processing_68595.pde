
//Homework Assingment 1
//51-257 A
//Copyright 2012 Marcos Gonzalez-Bode megonzal@andrew.cmu.edu


void setup() {
  size (400,400);
  background(255);
  smooth();
}

void draw() {
    for(int i=0; i<100; i++) {
    float r = random(80);
    fill(r*5);
    
    strokeWeight(2);
    rect(100,100,20,80);
    rect(120,100,20,40);
    rect(140,100,20,80);
    
    rect(180,100,20,80);
    rect(200,100,30,20);
    rect(200,160,30,20);
    rect(200,130,15,20);
    
    rect(250,100,20,80);
    rect(270,100,30,20);
    rect(270,160,30,20);
    rect(285,140,15,20);
    
//saveFrame("hw1.jpg");
    
}
}

