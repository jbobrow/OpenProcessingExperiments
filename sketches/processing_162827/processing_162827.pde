
int x = 0;
int y = 0;
int yspeed=3;
int size = 3;


void setup(){
  size(800,400);
}

void draw(){
  background(0);
  fill(0, 0, 255);
  for(int i=0; i<10; i++){
    ellipse(x + i*(width/9), y, size, size); //divide by 4 because you know there are 4 gaps between 5 circles
}
  
  size = size +1;
  if(size > 60){
    size = 3;
  }
  
  y=y+yspeed;
  if(y < 0 || y > height){
    yspeed=-yspeed;
}
}


