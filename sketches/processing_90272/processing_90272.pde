
color[] strawchoc= {#260707, #422828, #EDE0D3, #CC2B4E, #CC002C};
void setup(){
size(400,400);
smooth();
noFill();
frameRate(1);
background(strawchoc[0]);
}

void draw(){
  float x = random(width);
  float y = random(height);
  float d = random(30, 300);
  stroke(strawchoc[int(random(1,5))]);
  strokeWeight(random(5,25));
  ellipse(x,y,d,d);
}
