
float x;
float y;

void setup(){
  size(512,160);
  smooth();
  background(255);
}

void draw(){
  background(0);
  stroke(255,0,0);
  strokeWeight(1.5);
  fill(0,255);
  int s=int(random(5,10));
  frameRate(8);
  for(x=random(width); x<=width; x+=random(25,40)){
    for(y=random(height); y<=height;y+=random(25,40))
    ellipse(random(width),random(height),random(s),random(s));
}
}



