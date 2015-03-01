
void setup() {
  
  size(500,500);
  background(0);
  
}

void draw() {
 if (mousePressed){
    if(mouseButton == LEFT){
      fill(255,random(256),random(256),random(256));
     } else if (mouseButton == RIGHT) {
         fill(random(256), 255,random(256),random(256));
         }
         }
         else{
         fill(random(256), random(256),255,random(256));
         }
  
  ellipse(mouseX, mouseY, width % (mouseX +1), height % (mouseY + 1));
  ellipse(width - mouseX, height - mouseY, width % (mouseX +1), height % (mouseY + 1));
}
