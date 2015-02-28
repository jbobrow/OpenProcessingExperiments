

void setup() {
  size(500,500);
  
  smooth();
  background(0);
  noStroke();

}

void draw () {
  background(0);
  
  drawSpiral1();
  
  drawSpiral2();
  
  drawSpiral3();
  
  noLoop();
}

void drawSpiral1() {
  float radius = 2.0;
  fill(214,56,12);
  
  for (int i = 0; i <= 360*50; i+=5) {
    float x = sin(radians(i)) * radius;
    float y = cos(radians(i)) * radius;
    
    ellipse(x+(width/2), y+(width/2),4,4);
    
    radius*=1.08;
  }

}

void drawSpiral2() {
  float radius = 25.0;
  fill(124,56,21);
  for (int i = 0; i <= 360*50; i+=5) {
    float x = sin(radians(i)) * radius;
    float y = cos(radians(i)) * radius;
    
    ellipse(x+(width/4), y+(width/4),4,4);
    
    radius*=1.02;
  }
}

void drawSpiral3() {
  float radius = 15.0;
  fill(10,55,11);
  for (int i = 0; i <= 360*10; i+=5) {
    float x = sin(radians(i)) * radius;
    float y = cos(radians(i)) * radius;
    
    ellipse(x+(width*0.75), y+(height/4),4,4);
    
    radius*=1.01;
  }
}

