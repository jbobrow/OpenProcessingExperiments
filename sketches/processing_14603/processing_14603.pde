
void setup(){
size(200,200);
noLoop();
}

void draw(){
  for (int i=0; i<200; i=i+3){
    line(random(i),0,random(i),200);
  }
}  
