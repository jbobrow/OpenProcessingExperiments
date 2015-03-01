
void setup(){
  size(500,500,P2D);
  background(255);
  //translate(width/3,600);
  stroke(0,180);
}

void draw(){
  swirl();
  translate(PI,PI*sin(0));
  rotate(atan(0.1));
  swirl();
  translate(PI+10,PI*sin(-2));
  rotate(atan(0.2));
  swirl();
  translate(PI+30,PI*sin(-50));
  rotate(atan(0.3));
  swirl();
  }
  
  
  void swirl(){
    pushMatrix();
    translate(width/2,0);
      int f = frameCount;
      for (f = f; f<=160; f+=10){
        fill(255,150+f);
        translate(f+100,80+f);
        rotate(atan(f/20));
        rect(100,100, 80-f/2,80-f/2);
        f = f + sin(40);  
    }
    popMatrix();
  }
