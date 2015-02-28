
float x,y;
float n;
int i;

void setup(){
size(120,120);
background(225,240,250);
}

void draw(){
  //line
 for (int x = 0; x < 100; x++) {
  float n = norm(x, 0.0, 100.0); 
  float y = 1- pow(n, 4); 
  y *= 100; 
  point(x,y);
 }
}


