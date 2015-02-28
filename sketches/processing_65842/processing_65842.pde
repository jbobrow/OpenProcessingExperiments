
int y;
float d,z;

void setup(){
  frameRate(30);
  size(350,700);
  smooth();
  strokeWeight(.5);
  stroke(0);
  noFill();
}
//void draw(){
//  background(255);
//  for ( int y = 75; y < height-75; y=y+15){
//    z=(random(1,7))*14;
//  beginShape();
//  vertex(125-z,(y+9)/2);
//  vertex(175,y-50);
//  vertex(225+z,(y+9)/2);
//  vertex(175,y-10);
//  endShape(CLOSE);
//  }
 void draw(){
  background(255);
  for ( int y = 600; y > 0; y=y-25){
  z=(random(1,7))*14;
  beginShape();
  vertex(125-z,(y+200));
  vertex(175,y+10);
  vertex(225+z,(y+200));
  vertex(175,y+80);
  endShape(CLOSE);
  }
  
 noLoop();

 
}

void mousePressed() { 
  redraw();
  background(255);
}



//void poly1(){ //0-20letters
//   beginShape();
//   vertex(100,350);
//  vertex(250,100);
//  vertex(400,350);
//  endShape(CLOSE); 
//  
//}
//
//void poly2(){ //21-40letters
//   beginShape();
//  vertex(50,75);
//  vertex(400,125);
//  vertex(375,375);
//  vertex(75,410);
//  endShape(CLOSE); 
//  
//}

