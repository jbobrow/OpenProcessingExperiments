
// Julia Engel-Dagher
// Assignment 2.a


//Calculate Distance 

float d(float x1, float y1, float x2, float y2) {
  float xx = x1 - x2;
  float yy = y1 - y2;
  float distance = sqrt(xx*xx + yy*yy);
  return distance;
}

void setup() {
println(d(2,2,2,2));
println(d(1,2,3,4));
println(d(5,2,8,9));
}

void draw(){
}


