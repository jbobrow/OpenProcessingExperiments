
//Ghosty Worm
int[] xpos = new int[240];
int[] ypos = new int[240];
PImage mund;
 
void setup(){
    size(800, 800);
    smooth();
    noStroke();
    mund = loadImage("mund.png");
}
 
void draw(){
    noCursor();
    background (255);

  for (int i=0; i< xpos.length - 1; i++) {
    xpos[i] = xpos[i + 1];
    ypos[i] = ypos[i + 1];
  }
   
    xpos[xpos.length - 1] = mouseX;
    ypos[xpos.length - 1] = mouseY;
 
  for (int i=0; i < xpos.length; i++) {
    fill (0, 0, 0, 20);
    ellipse (xpos[i], ypos[i], i / 0.95, i / 0.95);
  }
 
 //AUGEN UND MUND
    ellipse(mouseX-40,mouseY-30,80,80);
    ellipse(mouseX+40,mouseY-30,80,80);
   
  fill(255);
    ellipse(mouseX-45,mouseY-40,40,40);
    ellipse(mouseX+45,mouseY-40,40,40);
    
  fill(0);
    ellipse(mouseX-45,mouseY-33,20,20);
    ellipse(mouseX+45,mouseY-33,20,20);
    
    image(mund,mouseX-45,mouseY-10, 100,100);
}



