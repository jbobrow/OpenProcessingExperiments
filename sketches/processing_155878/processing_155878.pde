
int points= 300;
color myColor; 
float lineThickness = (random (1, 50));

void setup(){
  size(1200, 800);
  background(0, 0, 0);
}
void draw(){
  myColor = int(map(mouseX, 0, width, 0, 255));
  stroke(255, 255, 255,random (215));
  if (mousePressed == true){
      curve(mouseX, mouseY, pmouseX, pmouseY, mouseX, mouseY, pmouseX, pmouseY);
    }
    strokeWeight(int(map((random(1, 15)), 0, 70, 0, 140)));
    translate(width/2, height/2);
    rotateX(200);
    if (keyPressed) {
    if (key == 's') {
    saveFrame();
 }

}
}




