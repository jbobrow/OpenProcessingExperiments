
void setup() {
size(300,300);
ellipseMode(CENTER);
background(255,255,255);
}

void elli(float x, float y,float z) {
  stroke(random(255),random(255),random(255));
  strokeWeight(random(1,8));
  ellipse(x,y,z,z);
  }


void draw() {
for(int a=0;a<width/5;a++){
  for(int b=0;b<height/5;b++){
    elli(random(10)+a*50+20,random(10)+b*50+20,random(3,30));
  }
}


}

  

