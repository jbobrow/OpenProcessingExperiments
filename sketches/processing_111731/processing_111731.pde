
//start Mondrian's Composition C (no. III)
//chiming lu 

void setup(){
  //setup size
  size(500,500);
  //setup background
  background(255);
}

void draw(){

  //draw red rect
  noStroke();
  fill(255,0,20);
  rectMode(CORNERS);
  rect(0,0,225,225);
  
  //draw yellow rect
  noStroke();
  fill(255,255,0);
  rectMode(CORNERS);
  rect(0,330,50,500);
  
  //draw bule rect
  noStroke();
  fill(5,34,92);
  rectMode(CORNERS);
  rect(225,330,380,480);
  
  //draw black line
  stroke(0);
  strokeWeight(5);
  line(225,0,225,500);
  line(0,225,500,225);
  line(0,330,500,330);
  line(380,330,380,500);
  line(225,480,380,480);
  line(50,330,50,500);
}  


