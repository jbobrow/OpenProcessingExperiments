
//Tchunoo Rhee Kahng, andrewID: tkahng
//Hw_4, Tuesday 4 Sep 2012, 48-257 Processing for the Arts
//All materials and images on this code Copyright (c) Tchunoo Rhee Kahng, 2012.
int ringnum = 4;
void setup(){
  size(400,400);
  smooth();
  background(150,150,250);
  noFill();
  frameRate(60);
  
}

void draw(){
  //background(150,150,250,255);
  strokeWeight(2);
  stroke(50,50,50,50);
  //circle thang
  for(int i = 0; i < ringnum; i++){
    
    int trgtsize = i*20;
    ellipse(mouseX,mouseY,trgtsize, trgtsize);
  }
  if (mousePressed && (mouseButton == LEFT)) {
    background (150,150,250);
  }
  

//saveFrame("hw3.jpg");
}
