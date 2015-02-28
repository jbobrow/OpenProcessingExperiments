
void setup(){
size(300,300);
}

void draw(){
background(0);
  frameRate(8);
  for (int x=300; x>0; x=x-10){
  float r = random(80);
  float t = random(255);
  float q = random(112);
  fill(r,t,q);
  /*stroke(t);*/
  noStroke();
  ellipse(x,2,r,t);
  ellipse(x,298,r,t);
}
fill(255);
stroke(t);
ellipse(150,150,8,8);
line(142,150,0,150);
}
