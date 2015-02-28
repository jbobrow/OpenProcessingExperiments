
//Copyright Christopher Henley 2014
//ICE 15

color c1,c2,c3;

void setup(){
  size(400,400);
  c1=color(200,0,0);
  c2=color(0,200,0);
  c3=color(0,0,200);
  strokeWeight(3);
  ellipseMode(CORNER);
}

void draw(){
  background(200);
  design(100,100,90,c1,c2);//smaller design
  design(180,200,165,c1,c3);//larger design
  noLoop();
}

void design(float x,float y,float sz,color rctColor,color crcColor){
  fill(rctColor);
  rect(x,y,sz,sz);
  fill(crcColor);
  ellipse(x,y,sz/2,sz/2);
  line(x+sz,y,x,y+sz);
}
  



