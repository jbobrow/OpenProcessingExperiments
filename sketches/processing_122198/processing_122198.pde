
void setup() {
  size(600, 600);     

  background(0,0,00);    
  mouseX=width+300;
  mouseY=height-300;
}
void draw(){
  noFill ();
  stroke (5);
  stroke (#FEFF05);

    ellipse(300,300, mouseX, mouseY);
 
}



