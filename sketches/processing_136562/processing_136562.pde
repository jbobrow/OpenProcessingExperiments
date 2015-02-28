
void setup(){
size(400,400);
  colorMode(HSB);
}
void draw(){
  background(255);
  for(int a = 0; a < 60 ; a++){
    for(int b = 0; b < 60 ; b++){
        Float d = dist (a*10,b*10,mouseX,mouseY);
     fill(d,34,150);
    ellipse(a*10, b*10,10,10);
  }
 }
}
