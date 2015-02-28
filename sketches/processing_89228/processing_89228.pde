
int value = 0;
int valueA = 0;
int valueB = 0;
int valueC = 0;
void setup() {
  
  size(500,500);
  background(0);
  
}

void draw() {
 
  noStroke();
  fill(0,0,150);
  ellipse(250,250,40,40);
  ellipse(228,234,30,30);
  ellipse(272,234,30,30);
  fill(random(255),random(255),random(255));
  ellipse(239,246,15,15);
  ellipse(259,246,15,15);
 

  mouseDragged();
  if(mouseButton==LEFT) {
  noStroke();
  fill(255,0,0);
  ellipse(mouseX, mouseY, 30,65);}
  
 mousePressed(); 
 if(mouseButton==RIGHT) {
 loadPixels();
 PImage img = get(212,218,77,53);
 updatePixels();
 image(img,mouseX,mouseY);
 fill(random(200),random(200),random(200));
 quad(210,218,292,218,292,273,210,273);
 
 println("mouseX:");
println(mouseX);
println("mouseY:");
println(mouseY);

 }
}
void keyPressed() {
   filter(ERODE);
}






