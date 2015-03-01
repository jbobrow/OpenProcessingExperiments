
//click and drag the mouse
//Pressing 1 changes the stroke color to black,
//2 changes it dark red, and 3 will make
//the stroke green.
PImage gradient;
PImage gradient2;
color strokeColor = color(0, 25);

void setup() {
  
  size(1000, 500);
  gradient = loadImage("gradient.PNG");
  gradient2 = loadImage("gradient2.PNG");

 
}

void draw() {
  image(gradient, 0, 0, 500, 250);
  image(gradient2,500, 250, 1000, 500);
  strokeWeight(2);
  stroke(strokeColor);

pushMatrix();    
    if (mousePressed == true) {

  line(mouseX, mouseY, 0, 250);  
  line(1000, 250, mouseX, mouseY);  
  ellipse(mouseX, mouseY, 10, mouseX);
  ellipse(mouseX, 250, mouseX, mouseY);

}
popMatrix();
}

//delete and snapshot
void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key == 'S')  saveFrame("screenshot.png");

switch(key){
 case'1':
 strokeColor = color (0, 80);
 break;
 case'2':
 strokeColor = color (0, 80, 67, 54);
 break;
 case'3':
 strokeColor = color (80, 90, 70);
 break;
}
}

