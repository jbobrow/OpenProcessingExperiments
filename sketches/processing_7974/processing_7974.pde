
// Jouons avec:  line(x1, y1, x2, y2);




void setup() {
  size(800, 800);
  background(#FFFFFF);
 }


void draw() {
 background(#FFFFFF);
 if (keyPressed == true){
  saveFrame();
 // background(#FFFFFF);
  
 };
  
 if (mousePressed == true){
 //background(#FFFFFF);
 
 line (mouseY+100, 60, 100, mouseX);
line (100, mouseX, 140, 150);
line (140, 150, mouseX, 200);
line (mouseX, 200, mouseY+100, 60);
line (100, mouseX,mouseX, 200);
line (mouseY+100, 60, 170, 250);
line (140, 150, 30, 45);
line (mouseX, 200, 30, 45);
line (30, 45, 200, mouseX+30);
line (200, mouseX+30,170, 250);
line (170, 250, 230, 160);
line (230, 160, 175, mouseX);
line ( 100, mouseX, 170, 250);
line (230, 160, mouseX, 200);
line (mouseY+100, 60, 30, 45);
line (30, 45, 175, mouseX );
    	

println("begin");

  // == vérité absolue
 };





}






