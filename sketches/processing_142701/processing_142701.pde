
float a = 0;
float b = 0;

void setup(){
  size(1000,1000);
  background(200);
}

void draw(){
 for (float a = 500; a < width; a -=50){
   for (float b = 1000; b < height; b -=50){
 stroke(134, 66, 1);
 strokeWeight(50);
  line(a, b, a - 100, b - 100);
   }
 }
}
