
void setup () {
  size(500,500);
  colorMode(HSB);
background(300);
noStroke();
}
void draw  () {
 
 noStroke;
 
   fill(random(100,150),200,255,random(255));
  ellipse(mouseY,mouseX,200,200);
  
   fill(random(50,150),200,255,random(100,150));
 ellipse(mouseY,random(height/2,height),50,50);
}


  
