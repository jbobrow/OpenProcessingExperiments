
//Jason Fitzgerald
//Symmetry group D10

void setup(){
  size(600,600);
  colorMode(HSB,360,100,100);
  smooth();
 background(321,96,96);
  frameRate(5);
}

void draw(){
  translate(width/2, height/2);//make 0.0. center
  //println (mouseX +"," + mouseY);//to track x,y locations so I can draw my shapes without guessing as much

for(int j = 0; j < 360; j++){
  rotate(radians(60));
  strokeWeight(1);
  beginShape();
  noFill();
  for(int i=0;i<360;i++){
    rotate(radians(72));
    curveVertex((i*5)*sin(i/5.0),(i*2)*cos(i/5.0));
  }
  endShape(); 
}


  for(int j = 0; j < 360; j++){//this makes 1 degree increments around 360 degrees
    rotate(radians(72));//increments the line on the following line of code 1 degree
    noStroke();
    strokeJoin(ROUND);
    beginShape();
    fill(251,random(0,100),100);
    quad(0,0, 24,150, 200,200, 150,24);
    endShape();

  }
}









