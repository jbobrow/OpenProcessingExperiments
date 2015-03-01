
int angle = 0;
void setup() {
size(300, 300);
smooth();
background(242, 240, 188, 102);

}
void draw() {
// Draw only when mouse is pressed
if (mousePressed == true) {
  angle ++;
  float c = cos (radians(angle))* 5;
  float d = sin (radians(angle)) * 5;
   stroke (0, 60);
   rect (mouseX , mouseY, c/6 , random (60));
   stroke (0, 30);
   rect (mouseX + 30, mouseY + 10, d/6, random ( 60));
save ("Drawing_2_Exercise_1.pde");


}



}






