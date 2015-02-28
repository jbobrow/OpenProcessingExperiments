
 float metaX = 10;
 float metaY = 10;
 PGraphics gra;


void setup(){
 
  size(700,400, P2D);
  //noCursor();
  smooth();
  frameRate(70);
  background(0);
}

void draw(){
    
  
  noStroke();
  fill(random(200),random(30),random(180), 45);
  ellipse(mouseX,mouseY,metaX,metaY);
  // ellipse (with an alternating colour) follows the mouse
  line (mouseX - 100,mouseY - 100, metaX,metaY);
  
  if(mousePressed){

  
  }
}

void mouseMoved(){
 
}

