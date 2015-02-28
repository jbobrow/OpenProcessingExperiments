

float margen, sp;
void setup(){
  margen=20;
  sp=25;
  size(500,500);
  smooth();
}

void draw(){
  background (0);
  
  for(float y=  margen-2; y <= height-margen; y += sp*2){
    for (float x = margen*2; x <=width-margen; x += sp){
   
      float d;
   d= 100 - sqrt((mouseX - x)*(mouseX - x)+(mouseY - y)*(mouseY -y));
     fill(mouseX,mouseY,23,15);
      ellipse( x,y, d,d);
     
}
}
}



