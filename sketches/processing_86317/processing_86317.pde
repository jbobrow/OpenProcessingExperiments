
void setup() {
size(800, 600);
background(0);
smooth();
}
   
void draw() {
  smooth();
if (keyPressed == true) {


}
 }

void mouseDragged()
{
stroke(random(50,100));
strokeWeight(0.50);
line (400, 300, mouseY, mouseX);



  }



