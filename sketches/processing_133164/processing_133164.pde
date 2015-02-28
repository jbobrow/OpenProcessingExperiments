
int totalPts = 100000;
float moves = totalPts + 1;
void setup() {
  size(500, 500);
  frameRate(18);
} 

void draw() {
  background(#F0F5F5);
  stroke(#527E7E);
  float rand = 0;
  for  (int i = 1; i < moves; i++) {
    point( (width/moves) * i, (height/2) + random(-rand, rand) );
    rand += random(-70, 70);
  }
}



