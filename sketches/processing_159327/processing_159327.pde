
void setup () {
 
  size(500,500);
  
  
  colorMode(HSB);
background(0);
noStroke();
}
void draw  () {
 
 
  
  fill(random(200,250),200,255,random(100,150));
  ellipse(mouseX,random(0,height/2),50,50);
   fill(random(50,150),200,255,random(100,150));
 ellipse(mouseY,random(height/2,height),50,50);
}
