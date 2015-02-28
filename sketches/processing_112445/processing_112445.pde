
void drawCoords(double shade){
  stroke((int)(shade * 256));
  for(int i = 0; i <= 200; i += 10){
    line(i, 0, i, 200);
    line(0, i, 200, i);
  }
  for(int i = 0; i <= 90; i += 15){
    pushMatrix();
    rotate(radians(i));
    line(0,0,180,0);
    popMatrix();
  }
}

void demo(){
  drawCoords(0);
}

void demo_t(){
  drawCoords(.8);  
  translate(100,100);
  drawCoords(0);
}

void demo_s(){
  drawCoords(.8);  
  scale(2,1);
  drawCoords(0);
}

void demo_r(){
  drawCoords(.8);  
  rotate(radians(30));
  drawCoords(0);
}

void demo_rs(){
  rotate(radians(30));
  drawCoords(.8);
  scale(2,1);
  drawCoords(0);  
}

void demo_sr(){
  scale(2,1);
  drawCoords(.8);
  rotate(radians(30));
  drawCoords(0);  
}

void demo_rt(){
  rotate(radians(30));
  drawCoords(.8);
  translate(100,100);
  drawCoords(0);  
}

void demo_tr(){
  translate(100,100);
  drawCoords(.8);
  rotate(radians(30));
  drawCoords(0);  
}

void demo_st(){
  scale(2,1);
  drawCoords(.8);
  translate(100,100);
  drawCoords(0);  
}

void demo_ts(){
  translate(100,100);
  drawCoords(.6);
  scale(2,1);
  drawCoords(0);  
}

void setup(){
  size(600, 400);
  smooth(3);
  background(255);
  demo_tr();
}
