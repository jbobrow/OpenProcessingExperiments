
int x, y;
int r, g, b;

void setup() {
  size(600, 600);
  background(255);
}
 
void draw() {
  //line(mouseX, mouseY, pmouseX, pmouseY);
}
 
void mouseDragged(){
  line(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(2);
}
 
void keyPressed(){
 switch(key){
   case 'z':  //reset
    background(255);     
    break;
   case 'k':  //black
    stroke(0);
    break;
   case 'w':  //white
    stroke(255);
    break;
   case 'r':  //red
    stroke(255, 0, 0);
    break;
   case 'y':  //yellow
    stroke(255, 255, 0);
    break;
   case 'g':  //Green
    stroke(0, 255, 0);
    break;
   case 'c':  //cyan
    stroke(0, 255, 255);
    break;
   case 'm':  //magent
    stroke(255, 0, 255);
    break;
   case 'b': //blue
    stroke(0, 0, 255);
    break;
  }
}



