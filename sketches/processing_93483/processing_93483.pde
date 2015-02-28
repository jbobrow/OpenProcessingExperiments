
PImage myImage;
PImage myImage2;
PImage myImage3;

void setup() {
  size(800,800);
   myImage = loadImage("Motif_1.png");
  myImage2 = loadImage("Motif_2.png");
  myImage3 = loadImage("Motif_7.png");

}



void draw(){
  
   image(myImage3, random (-50, 800), random (-40, 750), 400, 400); 
    variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  
  
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x, y, speed, speed);
}
 
  


