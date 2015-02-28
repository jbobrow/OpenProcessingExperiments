
void setup() {
size (600,600);
}  
  void draw() {
  
    for(int a=0; a< 600; a++) {
  for(int b=0;b<600; b++){
   float d = dist(mouseX,mouseY,a*10,b*10);
    fill(d,random(255),255);
   ellipse(a*10,b*10,10,10);
  }
 
  }
  
}

