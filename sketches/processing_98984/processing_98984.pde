
void setup(){
size(400,400);
background(255,255,0);
}


void draw(){
  frameRate(30);
  float r = random(380);
  float p = round(random(1));
  float t = round(random(1));
  float q = round(random(1));
  stroke(0);
  strokeWeight(1);
  circleTime(r, 200);
  stroke(0,0,0,0);
  fill(255,255,0,p*255);
  ellipse(220,180,20,20);
  fill(255,255,0,t*255);
  ellipse(180,180,20,20);
  strokeWeight(6);
  stroke(255,255,0,q*255);
  line(230,220,170,220);
  
  
}

void circleTime(float x, float y){
  noFill();
  ellipse(y,y,x,x);
}
