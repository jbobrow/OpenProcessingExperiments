
//Cosmo van Hoff
// 7/8/2013
//Smiley Face
  void setup(){
    size(400,400);
    smooth();
    fill(0,102);
  }
  void draw() {
    background(255);
    fill(240);
    ellipse(mouseX, mouseY, 50,50);
   fill(0);
    ellipse(mouseX-9, mouseY-3, 10, 10);
    fill(0);
    ellipse(mouseX+9, mouseY-3, 10, 10);
    fill(0);
    line(mouseX-10, mouseY+ 9, mouseX+10, mouseY+9);
 
    if(mousePressed==true){
    fill(255,182,193);
    ellipse(mouseX, mouseY, 50,50);
    fill(0);
    ellipse(mouseX-9, mouseY-3, 10, 10);
    fill(0);
    ellipse(mouseX+9, mouseY-3, 10, 10);
    fill(139,0,0);
    arc(mouseX, mouseY+9, 15, 15, radians(0), radians(180));
    }
  }
