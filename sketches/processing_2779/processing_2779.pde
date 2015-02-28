

float margen, sp;

void setup(){
  margen = 20;
  sp = 25;
  size(500, 500);
  smooth();
  stroke(#72DEE3);
}


void draw(){
  background(#2F8A8E);
  for(float y =margen; y <= height-margen; y += sp){
    for(float x = margen; x <= width-margen; x += sp){
      float d; 
      d = sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y));
      fill(#2F8A8E);
      ellipse(y,x,d,sp);
      fill(255);
     triangle(margen,d,sp,y, d,x);
     
     
    }
  }
}





