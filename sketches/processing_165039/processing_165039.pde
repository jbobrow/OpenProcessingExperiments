

float step =1.5;


void setup(){
  size(900,900);
}

void draw(){
  background(255);
  step+=0.01;
  for(float x=10; x<height*2; x*=step){
    for(float y=10; y<height*2; y*=step){
      line(-width/2,x,width*3/2,y);
    }
  }
 if(step>1.55)
   step =1.5;
}
