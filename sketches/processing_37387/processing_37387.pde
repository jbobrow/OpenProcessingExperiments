
void setup (){
  size (1000,200);
  smooth();
  background(0);
}

void draw(){
  for(int i = 0; i < 1000; i++){    
    float colorValue;
    colorValue = map(i,0,width,0,255);
    stroke(colorValue);
    line(i,0,i,height);
  }
}

