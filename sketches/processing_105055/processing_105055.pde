
int colorR;
int colorG;
int colorB;

void setup(){
  size(250, 250);
  smooth();
  colorR= 244;
  colorG= 255;
  colorB= 95;
}

void draw(){
  background(62, 59, 59);
  //println(mouseX+", "+mouseY);
  fill(colorR-mouseX, colorG-mouseY, colorB);
  ellipse(120, 120, 150, 150);
  
  fill(random(255), random(255), random(255));
  ellipse(118, 30, 20, 20);
  ellipse(118, 210, 20, 20);
  ellipse(30, 120, 20, 20);
  ellipse(210, 120, 20, 20);
  ellipse(210, 120, 20, 20);
  
  fill(random(0), random(255), random(255));
  ellipse(55, 185, 20, 20);
  ellipse(185, 185, 20, 20);
  ellipse(52, 58, 20, 20);
  ellipse(185, 58, 20, 20);
  
  fill(3);
  line(121, 49, 66, 174);
  line(66, 174, 176, 174);
  line(121, 49, 176, 174);
  
  line(118, 200, 65, 74);
  line(65, 74, 180, 74);
  line(180, 74, 118, 200); 
}
