
int aumento = 1;
  
void setup() {
   
  size(600,600);
  background (random (0));
  color (HSB);
}
  
void draw() {
   
 
   ellipse(aumento, mouseX,mouseX,aumento-3);
 fill(600,250,255-aumento);
 
  ellipse(aumento, mouseY,mouseX/width,aumento-3);
 
 
  
   
  aumento += 1;
  }
