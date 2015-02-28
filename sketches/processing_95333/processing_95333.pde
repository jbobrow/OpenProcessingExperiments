
void setup(){
  size(500,500);
}

int frame=0;

void draw(){
  background(200);
  
  for (int i=0; i< frame; i+=5) {
    
    stroke(i/2);
    
    float  angle = (frame+i)*PI*0.001;
    
    line(i,i,width * cos(angle) ,height*sin(angle));
  }
  
  frame = frame +1;
}
