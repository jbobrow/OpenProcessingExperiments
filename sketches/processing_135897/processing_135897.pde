

boolean f= false;
color c;
void setup (){
 size(900, 900);
 background(0);
//fill(0)
 
 stroke(255);
 strokeWeight(.5);
}
void draw() {
  fill(c);
  if (f== false) {
    triangle(mouseX, mouseY,mouseX*2, mouseY*2,mouseX*3, mouseY*3);
    
    
  }else if (f = true)
    ellipse (mouseX, mouseY, 70, 20);
  }

void mouseReleased () {

  if ( f==false) {
    f=true;
  }
    else if (f==true){
    f=false;
  }
 }
 void mouseMoved(){
