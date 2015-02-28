
void setup(){
  size(600,300);
  background(102,226,204);
}

//ball's intitial location
int centerX = 100;
int centerY = 150;

void draw(){
  //draws balls in increments of 100 up to 500
  for(int i = 0; i < 500; i = i+100){
    noStroke();
    fill(32,115,100);
    ellipse(centerX + i, centerY, 20, 20);
   }
}

