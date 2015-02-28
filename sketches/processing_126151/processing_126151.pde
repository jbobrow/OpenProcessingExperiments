


void setup(){
  size(700,700,P2D);
  background(255);
  smooth();
  
}

void draw(){
  translate(0,0);
  swirl();
  translate(100,100);
  swirl();
  translate(100,200);
  swirl();
  translate(100,300);
  swirl();
  translate(100,400);
  swirl();
  translate(0,300);
  swirl();
  translate(100,600);
  swirl();
  
  }
  
  
  void swirl(){
    pushMatrix();
    translate(width/2,0);
      int f = frameCount;
      for (f = f; f<=200; f+=10){
        fill(255,100-f/2);
        strokeWeight(f/200);
        //stroke(100-(f/2),50);
        translate(f,100+f);
        rotate(atan(f/20));
        rect(100,50, 100-f/2,100-f/2);
    }
    popMatrix();
  }
  




