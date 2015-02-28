
float a = 0;
float b = 0;

void setup(){
  size(800,600);
  background(200);
}

void draw(){
  for (float a = 0; a < width; a +=50){
    for(float b = 0; b < height; b +=50){
      stroke(134,66,1);
      strokeWeight(1);
      line(a,b,a-10, b-10);
    }
  }
}
