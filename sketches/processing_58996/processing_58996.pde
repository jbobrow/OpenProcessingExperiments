
void setup() {
size(600,600);
smooth();
 background(255, 204, 0);
}
 
void draw() {
 fill(random(255),0,0); 
  
   noStroke();
    
quad(mouseX, mouseY, 15, 25, 25, 25, 25, 25);
}
 
void mouseClicked () {
  background(255, 204, 0);
}

void keyPressed(){
  println("Taste gedrückt:" + key);
  if(key =='s') saveFrame("line-####.png");
}

