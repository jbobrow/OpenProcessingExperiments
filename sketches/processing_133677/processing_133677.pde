
void setup(){
  size(400,400);
  smooth();
  background(0);
}
void draw(){
  float r=random(255);
  float s=random(255);
  float t=random(400);
  float u=random(255);
  float v=random(400);
  for(int i=0; i<400; i=i+10){
      background(0);
    strokeWeight(2);
    stroke(255,0,r);
    noFill();
    ellipse(200,200,t,t);
      stroke(0,s,255);
      ellipse(200,200,r,r);
      stroke(u,255,0);
      ellipse(200,200,u,u);
    }
for(int j=0; j<40; j=j+5){
  strokeWeight(1);
stroke(255,255,255,20);
line(200,200,t+400,v+400);
line(200,200, t+400, v-400);
line(200,200, t-400, v-400);
line(200,200, t-400, v+400);
}
  }
