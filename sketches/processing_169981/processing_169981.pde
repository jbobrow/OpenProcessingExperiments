
  float xnoise =0, ynoise =0, inc =0.004;
  float znoise=0;
void setup(){
  size(600,600);

}

void mouseClicked(){
  fill (255);
  float angleInc = PI/28;
  float angle =0;
  for (int offset = -10; offset<width+10; offset+=20){
    for (int y=0; y<height; y+=2){
      float x= offset + 2*sin(angle);
      ellipse(x,y,10,30);
      stroke(75);
      angle+=angleInc;
    }
    angle +=PI;
  }
}
void draw() {
  for (int y =0; y<height; y++){
    for (int x=0; x<width; x++){
      
     float r= noise(xnoise, ynoise, znoise)*255;
     stroke(r);
     point(x,y);
     xnoise=xnoise +inc;
    }
    xnoise =0;
    ynoise=ynoise+inc;
  }
  znoise+=0.1;
}

