
float a;
void setup(){
  size(500, 400);
  stroke(255);
  a= height/2;
}

void draw(){
   line (0, a, width, a);
  a= a - 0.5;
  if (a < 0){
    a= height;
  }
}
