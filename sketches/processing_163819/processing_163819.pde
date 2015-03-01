
int howManyLine = 6;
float space = 0;

void setup(){
  
  size(600,600);
  strokeWeight(4);
}

void draw(){
  background(255);
  float t=0;
  for(int i=0; i<howManyLine; i++){
    float x = width/howManyLine*i;
    t+= space;
    line(x+t, 0, x+t, height);
    
  }
  
  space+=0.1;

}


