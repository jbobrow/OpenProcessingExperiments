
void setup() {
  background(255);
  size(600,600);
    smooth();
    rectMode(CORNER);
}

void draw() {
  //fill(((mouseX+mouseY)/1200)*255);
  
  
 
  if (keyPressed == true) {
  
    fill(255);
    rect(0, 0, 600, 600);
  } 
  
  //4 corner symmetry
//stroke(mouseY * 0.425, mouseX*0.425, random(0,255)); 
//line(600-mouseX, mouseY,600-pmouseX, pmouseY);
//stroke(mouseY * 0.425, mouseX*0.425, random(0,255));
//line(mouseX, 600-mouseY,pmouseX, 600-pmouseY);


  }
   void mouseDragged(){
    strokeWeight(random(0,20));
   stroke(mouseX * 0.425, mouseY*0.425, random(0,255));
  line(mouseX, mouseY,pmouseX, pmouseY);
  stroke((600-mouseX) * 0.425, (600-mouseY)*0.425, random(0,255));
  line(600-mouseX,600-mouseY,600-pmouseX,600-pmouseY);
  //diagonal symmetry
  stroke(mouseY * 0.425, mouseX*0.425, random(0,255));
  line(mouseY, mouseX,pmouseY, pmouseX);
  stroke((600-mouseY) * 0.425, (600-mouseX)*0.425,random(0,255));
  line(600-mouseY,600-mouseX,600-pmouseY,600-pmouseX);
  }
  
  
   


