
float a = 0;
float b = 0;

void setup(){
  size(800,600);
  background(200);
  frameRate(10);
}

void draw(){
  background(255);
  for (float a = 70; a < width-50; a +=50){
    for(float b = 70; b < height-50; b +=50){
      stroke(0);
      strokeWeight(1);
      line(a,b,a+random(-30,30), b+random(-30,30));
    }
  }
}
