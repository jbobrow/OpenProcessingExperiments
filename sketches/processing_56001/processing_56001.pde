
//Eun Elaine Na
//YSDN Interactivity Design Winter 2012

void setup() {
  size (600,600);
  background (40); 
  smooth();
  colorMode(HSB); 
}

void draw (){
noStroke();
fill(random (255), 50, 255, 130); 
ellipseMode(CENTER);
ellipse(mouseX,mouseY,40,40);

}

void mouseDragged() {
    //under the circle .. rectangle will be there when mousedragged
    fill (random (mouseX), random (mouseY),150,100);
    rect (mouseX,mouseY,50,50); 
  }
