
void setup() {
  size (1000,400) ;
  smooth() ;
  frameRate(10) ;
  background (255) ;
}
  void draw() {
    if(mousePressed) {
      stroke(0);
      strokeWeight(5);
      line(mouseX,mouseY,pmouseX,pmouseY) ;
      stroke(250,0,0);
      line(width-mouseX,mouseY,width-pmouseX,pmouseY) ;
      
  if(key==' ') {
      if (keyPressed) {
      stroke(250,0,0);
      strokeWeight(5);
      ellipse(width-pmouseX,pmouseY,20,20);
      stroke(0);
      ellipse(mouseX,mouseY,20,20);
      }
    }  
  }
   
      if(key=='z') {
        if(keyPressed) {
        setup();
        }
      }
  } 



