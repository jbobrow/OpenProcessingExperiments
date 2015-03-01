
int x = 0;
int xspeed = 2;
 
void setup() {
  size(200, 200);
  smooth();
}

  int b = 0;
 
void draw() {
  background(255);
  x = x + xspeed;
  for(int a = 0; a < 250; a = a + 50){
    if(x - a < 50){
      fill(0);
    }
    else if(x - a > 150){
      fill(0);
    }
    else{
      fill(255);
    }
    ellipse(x - a, a, 20, 20);
    ellipse(a, x - a, 20, 20);
  }
}


