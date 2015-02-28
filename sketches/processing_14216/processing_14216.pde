
float inc=0.0;
void setup(){
  size(550,600);
  smooth();
}

void draw(){
  background(255);
  arm(285,310,4,0.01);//arms are arranged clockwise
  arm(435,20,4,0.01);
  arm(340,-295,4,0.01);
  arm(50,-445,4,0.01);
  arm(-260,-345,4,0.01);
  arm(-410,-60,4,0.01);
  arm(-310,250,4,0.01);
  arm(-25,405,4,0.01);
  }

  void arm(int x,int y, int segmentLength,float increment){
    inc+=increment;
    float angle=sin(inc)/20.0;
    pushMatrix();
    translate(x,y);
    for(int i=30;i>0;i-=2){
      for(int c=0;c<=255;c+=15){
      stroke(255,64,64,c);
      strokeWeight(i);
      line(0,0,0,-segmentLength);
      translate(0,-segmentLength);
      rotate(angle);
      }
    }
    popMatrix();
    rotate(PI/4);
}

