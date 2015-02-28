
int x = -100;
int y = 60;
int xspeed=4;
int distance = 100;

void setup(){
  size(700,525);
  noStroke();
 
}
 
void draw()
{
  background(constrain(x+xspeed, 0, 255));
  x=x+xspeed;

  for (int i=0; i<300; i++){
      for(int j=0; j<50; j++){
         ellipse(x+i*distance, y+j*distance, 50, 50);
         fill(random(255), random(255), random(255));
           }
             }
         
  for (int i=0; i<300; i++){
      for(int j=0; j<50; j++){
         ellipse(y+i*distance, x+j*distance, 50, 50);
         fill(random(255), random(255), random(255));    
  }
}
}

