
int points= 300;
color myColor; 
float lineThickness = (random (1, 50));
float opacity = 5;

void setup(){
  size(800, 800);
  background(0, 0, 0);
}
void draw(){
  myColor = int(map(mouseX, 0, width, 0, 255));
  stroke(255, 255, 255,random (opacity*7));
  if (mousePressed == true){
      curve(mouseX, mouseY, pmouseX, pmouseY, mouseX, mouseY, pmouseX, pmouseY);
    }
    strokeWeight(int(map((random(opacity/5, opacity*3)), 0, 70, 0, 140)));
   stroke(255, 255, 255,random (20, 45));
    if (mousePressed == true){
      curve(mouseX, mouseY, pmouseX, pmouseY, mouseX, mouseY, pmouseX, pmouseY);
    }
    strokeWeight(int(map((random(5, 40)), 0, 70, 0, 140)));
       stroke(255, 255, 255,random (opacity*8, opacity*18));
    if (mousePressed == true){
      curve(mouseX, mouseY, pmouseX, pmouseY, mouseX, mouseY, pmouseX, pmouseY);
    }
    strokeWeight(int(map((random(10, 60)), 0, 70, 0, 140)));
    translate(width/2, height/2);
    rotateX(200);
    if (keyPressed) {
    if (key == 's') {
    saveFrame();
 }

}
}




