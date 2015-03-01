
int x;
void setup() {
  size(500, 500);
  smooth();
  background(255);
  x=1;
}
 
void draw() {
 }
 
void mouseDragged() {
  strokeWeight(x);
  line(mouseX, mouseY, pmouseX, pmouseY);
}
 
 
void keyPressed() {
 
//size up
 
if(keyCode == UP) {
 
x += 1;
 
if(x >= 20) {
 
x = 20;
 
}
 
//size down
} else if(keyCode == DOWN) {
 
 x -= 1;
 
if(x <= 1) {
x = 1;  
}
 
}
 
//iro
switch(key) {
    //ao
  case 'b':
    stroke(0, 0, 255);
    //red
  case'r':
    stroke(255, 0, 0); 
    //greeeen
  case'g':
    stroke(0, 255, 0); 
    //shadow?
  case's':
    stroke(0);  
 //w-hiru
  case'w':
    fill(165,238,255);   
    rect(-20,-20,600,600);
 //yoru
  case'd':
    fill(59,94,139);
   rect(-20,-20,600,600); 
  //back black
 case'k':
   fill(0);
   rect(-20,-20,600,600);
 //haimura
  case 'h':
  fill(255, 200, 200);
  rect(-20,-20,600,600);
 } 

}
  
 




