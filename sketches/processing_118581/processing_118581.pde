
int x;
int y;
int counter;
int r; //radius

void setup(){
  size(600,400);
  counter = 0;
 
}
void draw(){
  if (counter == 15 || counter == 30) { 
  x = int (random(width));
  y = int (random(height));
  r = 10;
  for(int i=0;i<3;i++){
    ellipse(x + i*20, y, r, r); 
    }
  }
  else if (counter > 30) {
    counter = 0;
  }
  counter++;
}



