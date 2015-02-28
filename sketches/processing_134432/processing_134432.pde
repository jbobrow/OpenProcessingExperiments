
void setup () {
  size(1000,1000);
  colorMode(HSB);
background(255);
noStroke();
}
void draw  () {

 noStroke;
  fill(random(0,50),200,255,random(255));
  ellipse(mouseX,mouseY,200,200);
   fill(random(100,150),200,255,random(255));
  ellipse(mouseY,mouseX,200,200);
  fill(random(200,250),200,255,random(100,150));
  ellipse(mouseX,random(0,height/2),50,50);
   fill(random(50,150),200,255,random(100,150));
 ellipse(mouseY,random(height/2,height),50,50);
}
