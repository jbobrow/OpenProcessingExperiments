
float s1 = 1;


void setup(){
  size(500,500);
  smooth();
  background(0,0,0);
  frameRate(60);
}
    
void draw(){
filter(BLUR, 3);
  for (i=0;i<1000;i = i +70){
  s1 = random(1,15);
  
  fill(0,0,0);
  rotate(random());
  rect(random(0,500),random(0,500),s1,s1);
  }
  for (i=0;i<1000;i = i +70){
  s1 = random(1,15);
  fill(255,255,255);
  noStroke();
  rotate(random());
  ellipse(random(0,500),random(0,500),s1,s1);
}
}


