

PImage a;
float angle = 0;
  
void setup() {
 
  size(1071, 745);
  a = loadImage("a.jpg");
  noStroke();
  smooth();
  background(0);
}
  
void draw() {
  float r =(10);
   
 
if (mousePressed && (mouseButton == LEFT)) {
  color c = a.get(mouseX, mouseY);
    translate(mouseX, mouseY);
rotate(angle);

    

ellipse(30, 20, 1, 100); 

  fill(c, 80);
angle += 0.1;
}
if (mousePressed && (mouseButton == RIGHT)) {
   color c = a.get(mouseX, mouseY);
    translate(mouseX, mouseY);
rotate(angle);

    

ellipse(30, 20, 1, 100); 

  fill(c, 80);
angle -=0.1;
  
}
}

void keyPressed(){
if (key == ' '){
    background(0);
  } 
if (key == 's'){
    saveFrame(a+"a.jpg"); //save image as .jpg
  }
  
}
  




