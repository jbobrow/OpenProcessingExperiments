
void setup() {
size(300,300);
rectMode(CENTER);
background(255,255,255);
}

void rec(float x, float y,float z) {
  stroke(x/2,150,150);
  strokeWeight(random(1,3));
  noFill();
  rect(x,y,z,z);
  }

int d=0;
void draw() {
for(int a=0;a<7;a++){
    rec(random(6)*50,random(6)*50,random(0,80));
  }

d++;
if (d>12){
  noLoop();
}
}

  

