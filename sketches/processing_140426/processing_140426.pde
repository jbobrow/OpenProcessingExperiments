
// based on https://kuler.adobe.com/Future-Self-color-theme-3500449/edit/?copy=true
color c1,c2,c3  ;

void setup() {
  
  size(400,400);
  strokeWeight(4);
  colorMode(HSB, 360,100,100);

  defineColors();  
  background(c3);
}

void draw() {
  defineColors() ;
  fill(c1);
  stroke(c2);
  ellipse(mouseX, mouseY, abs(mouseX-pmouseX), mouseX-pmouseX);
}
 
void mousePressed() {
  defineColors();  
  background(c3);
}
 
void defineColors() { 
   c1 = color(150,47, random(50,90) ); //(150,47,62);
   c2 = color(41, 27, random(20,90)); //(41,27,90);
   c3 = color (19,86, random(20,90) );//(19,86,91);
}
  

