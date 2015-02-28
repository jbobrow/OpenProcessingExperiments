
int x=0;
void setup() {
size(800, 800);

}


void draw() {
  
  translate(mouseX, mouseY);
    fill(36, 0, 247);
    ellipse(0, 0, 600, 600);
  if(mousePressed && x == 0) {
    

    fill(246, 255, 3);
    ellipse(-100, -100, 60, 60);
    ellipse(100, -100, 60, 60) ;
    ellipse(0, 100, 400, 200);
    
    fill(0);
    ellipse(0, 100, 100, 50);
    ellipse(-100, -100, 30, 30);
    ellipse(100, -100, 30, 30);
  
    x = 0;    

}
}
