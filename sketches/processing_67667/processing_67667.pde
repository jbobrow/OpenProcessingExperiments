
int r,s;
void setup(){
  size(700,400);
}

void draw(){
  background(255);
  noFill();
  strokeWeight(8);
  smooth();
  stroke(0);
  strokeWeight(8);
  ellipse(350,150,100,100);
  stroke(0,0,255);
  strokeWeight(8);
  ellipse(241,150,100,100);
  r=int(random(700));
  s=int(random(400));
  if((r!=459) && (s!=150)){
  stroke(255,0,0);
  strokeWeight(8);
  ellipse(r,s,100,100);
  }
  else{
    stroke(255,0,0);
    strokeWeight(8);
    ellipse(459,150,100,100);
    noLoop();
  }
    
  stroke(255,255,0);
  strokeWeight(8);
  ellipse(294,200,100,100);
  stroke(0,255,0);
  strokeWeight(8);
  ellipse(404,200,100,100);
}

