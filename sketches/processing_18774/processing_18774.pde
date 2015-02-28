
void setup(){
  size (250,250);
  smooth ();
  background(#000000);
  frameRate (35);
}
void draw(){

  strokeWeight(1);
  //circles with fill
  stroke (random(200,255),random(200,255),random(200,255));
  fill(random(50,255),random(50,230),random(100,255));
  ellipse(125,125,random(10,80),random(10,80));
//larger stroked circles
  noFill();
  ellipse(125,125,random(100,300),random(100,300));
}

