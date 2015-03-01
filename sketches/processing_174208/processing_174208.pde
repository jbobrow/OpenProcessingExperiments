
int x,y,a,b,c; 

void setup() {
  size(500, 500);
  background(0);
  smooth();
}
 
void draw() {
  fill(0);
  strokeWeight(2);
  line(mouseX, mouseY, pmouseX, pmouseY);}
 
void mouseDragged() {
  noFill();
stroke(a , b , c , 90);
  ellipse(mouseX, mouseY,50,50);
 stroke(0); 
}

void keyPressed(){
  if (key == CODED) {
    if (keyCode == ALT) {
 
      background(0);
    }
    else if (keyCode ==UP) {
      a = 255;
      b = 255;
      c = 255;
    }
    else if (keyCode ==DOWN ) {
      a = 255;
      b = 255;
      c = 0;
    }
    else if (keyCode == LEFT) {
      a = 255;
      b = 0;
      c = 255;
    }
    else if (keyCode == RIGHT) {
      a = 0;
      b = 255;
      c = 255;
    }
 
    
   
    }
  }




