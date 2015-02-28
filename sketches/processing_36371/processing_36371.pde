
int xpos = 100;
int ypos = 100;
int ease = 20;
float rotation = 0;
float spin = 0;

void mousePressed(){
  setup();
}
 
void setup() {
 
  size(700, 400);
  background(0);
  stroke (255, 0, 137);
  strokeWeight(1);
}
void draw() {
  rect (0, 0, 700, 400);
  fill (0, 34, 255, 5);
  
  if (mouseX < 700) {
  }
  rotation = 0;
  translate(xpos, ypos);
  rotate(radians(spin));
  spin = spin +0.25;
   
  while(rotation<360){
    pushMatrix();
     
    rotate (radians(rotation));
    point (0, 0);
    line (0, 0, 600, 600);
     
    rotation = rotation+6;
    xpos = xpos + (mouseX - xpos)/ease;
      ypos = ypos + (mouseY - ypos)/ease;
      
      if(mousePressed && (mouseButton == RIGHT)){
        stroke(255, 255, 0);
      }else{
        stroke (255, 0, 137);
      }
      
    popMatrix();
  }
  
}


