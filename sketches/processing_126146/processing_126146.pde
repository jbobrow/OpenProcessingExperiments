


void setup(){
  size(800,800,P2D);
  background(255);
  //translate(width/3,600);
  stroke(0,180);
  frameRate(15);
}

void draw(){
  swirl();
  translate(PI,PI*sin(0));
  rotate(atan(0.1));
  swirl2();
  translate(PI+10,PI*sin(-2));
  rotate(atan(0.2));
  swirl();
  translate(PI+30,PI*sin(-50));
  rotate(atan(0.3));
  swirl2();
  }
  
  
  void swirl(){
    pushMatrix();
    translate(width/2,0);
      int f = frameCount;
      for (f = f; f<=160; f+=10){
        fill(200+f/2);
        translate(f+100,80+f);
        rotate(atan(f/20));
        rect(20,20, 80-f/2,80-f/2);
        translate(f+100,80+f);
        rotate(atan(f/20));
        rect(40,40, 80-f/2,80-f/2);
        f = f + sin(40);  
    }
    popMatrix();
  }
  
   void swirl2(){
    pushMatrix();
    translate(width/3,0);
      int f = frameCount;
      for (f = f+150; f<=300; f+=10){
        fill(50,150+f);
        translate(f+PI,150+f);
        rotate(atan(f/5));
        rect(50,50, 150-f/2,150-f/2);
        f = f + sin(40);  
    }
    popMatrix();
  }
  




