
float angle = 0;

void setup(){
  size(500, 500);
  background (255);
}

void draw(){
background(255);
for (float i = 0; i< width; i += 80 ){
  for (float i2 = 0; i2< width; i2 +=80){
  int j = int(random(30,80));
  flower(20+i,i2, j);
    }
  }
}


void flower(float x, float y, int aa){
pushMatrix();
translate(x,y);
rotate(angle);
noStroke();
fill(250,30,100,aa);
ellipse(0, 20, 40, 40);
ellipse(20, 0, 40, 40);
ellipse(-20, 0, 40, 40);
ellipse(0, -20, 40, 40);
angle += 0.001;
popMatrix();
}


