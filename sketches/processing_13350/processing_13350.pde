

void setup(){
  size(300,300);
  }

  void draw(){
    background(250,255,55);
    angle = (mouseX-150)/30.0;
    translate(135,300);
    for (int i = 0; i<20; i=i+1){
      rotate(radians(angle));
      translate (0,-20);
      scale(0.95);
      triangle(30, 0, 0, 30, 60, 30);
    }
}

