
//Tchunoo Rhee Kahng, andrewID: tkahng
//Hw_4, Tuesday 4 Sep 2012, 48-257 Processing for the Arts
//All materials and images on this code Copyright (c) Tchunoo Rhee Kahng, 2012.


void setup(){
  size(400,400);
  smooth();
  background(138,138,152);
  int xpos = width/2;
  int ypos = height/2;
}

void draw(){
  noFill();
  
  int xpos = width/2;
  int ypos = height/2;
  
  for(int i = 0; i <30; i++){
    strokeWeight(.5);
    stroke(108,129,255);
    ellipse(xpos,ypos,i*25,i*25);
  }
  
  strokeWeight(10);
  stroke(185,185,255);
  
  ellipse(xpos,ypos,300,300);
  
  translate(0,height/12);
 
  //initial T
  
  beginShape(LINES);
  vertex(0.25* width,height/3);
  vertex(0.4* width,height/3);
  vertex(0.325*width,height/3);
  vertex(0.325*width,height/2);  
  endShape();
  
  //initial R
  beginShape();
  vertex(.45*width,height/3);
  bezierVertex(0.6*width, height/3, 0.6*width, 0.4*height, 0.45*width, 0.4*height);
  vertex(.45*width,height/3);
  vertex(.45*width,height/2);
  vertex(0.45*width, 0.4*height);
  vertex(0.55*width, 0.49*height);
  endShape();
  
  //initial K
  beginShape(LINES);
  vertex(.6*width,height/3);
  vertex(.6*width,0.5*height);
  vertex(.6*width,0.42*height);
  vertex(.7*width,.34*height);
  vertex(.6*width,0.42*height);
  vertex(.7*width,.5*height);
  
  
  endShape();
  //saveFrame("hw2.jpg");
}
