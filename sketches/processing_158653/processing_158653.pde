
void setup(){
size(600,600);
background(150);
smooth();

}
 void draw(){
  fill(255);
  smooth();
   for (int a = 900; a > 0; a -= 20) {
    ellipse(300, 300, a, a);
                  }
               noFill();

               for (int b = 300; b > 0; b -= 20) {
    ellipse(mouseX, mouseY, b+mouseX+80,b-mouseY-80); 
    ellipse(mouseX,mouseY,b-mouseX-80,b+mouseY-80);
    ellipse(mouseX,mouseY,b+mouseX+80,b+mouseY-80);
        ellipse(mouseX,mouseY,b-mouseX-80,b-mouseY-80);
            ellipse(mouseX,mouseY,mouseX-80,mouseY-80);
                  }
              
}
