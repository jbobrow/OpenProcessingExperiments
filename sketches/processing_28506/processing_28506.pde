
void setup() {
    size(400,400);
    rect(0,0,500,500);
     
}
 
void draw () {
   fill(random(100,280),random(100,200), 50);

    quad(38, mouseX, 86, mouseY, 69, 63, 500, 400);
  quad(110, 92, 90, mouseY, 69, mouseX, 500, 400);
  quad(49, mouseX, 86, mouseY, 69, 63, 500, 400);
  quad(mouseX,20, 90, mouseY, 69, 63, 33, 400); 
quad(98,20, 190, mouseY, 269, 63, mouseX, 400);
quad(mouseY,20, 90, mouseX, 459, 63, 233, 900);
quad(10,20, 90, mouseY, 69, 63, 33, mouseX);}

                
                
