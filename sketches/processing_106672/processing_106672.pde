
int x=20;
int y=20;
void setup () {
   size(200,200);
   background(255);
}


void draw () {
   //println ("draw");
   if(mousePressed == true) {
      fill(255,255,255);
      ellipse(mouseX,mouseY,20,20);
      fill(0,0,0);
      ellipse(mouseX,mouseY,5,5);
      
      fill(255,255,255);
      ellipse(mouseY,mouseX,20,20);
      fill(0,0,0);
      ellipse(mouseY,mouseX,5,5);
      }
}
