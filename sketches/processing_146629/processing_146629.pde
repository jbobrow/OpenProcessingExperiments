
import processing.video.*;

void setup() {
  size (700,700);
background (mouseX+#A2AF8F);
}

void draw() {
 if(mousePressed){
   size (400,400);
   background(20+mouseY);
  stroke(22);
  fill(#395017);
  rect(mouseX,mouseY,44,522+20);
 }
 else{
   size (800,800);
   stroke(855);
   fill(mouseX+#CB508E*700);
   ellipse(20,mouseY,40,20);
 }
    

}


