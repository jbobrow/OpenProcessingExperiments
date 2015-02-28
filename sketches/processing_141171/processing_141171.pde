
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

float dia = 100;

void setup(){
  size(600,600);
  smooth();
  background(170);
  colorMode(RGB, width, height, width); // adjust the color range to the width and height
}

float c1 = random(width);

void draw(){
  
  stroke(600,50);
  
  if (mousePressed){
    fill(c1,mouseY,mouseX);
    
    // draw ellipse and mirror with simple coordinate substraction
    ellipse(mouseX,mouseY,dia,dia);
    ellipse(mouseX,height-mouseY,dia,dia);
    ellipse(width-mouseX,mouseY,dia,dia);
    ellipse(width-mouseX,height-mouseY,dia,dia);
  }
  
  // re-run the void setup()
  if (keyPressed){
    setup();
    c1 = random(width);
    
  }
}
