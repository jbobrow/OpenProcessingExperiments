
PImage img;
void setup() {
size(600, 411); 
background(0); 
img = loadImage("window.jpg");
image(img,0,0);
strokeWeight(4);
stroke(255);
noFill();
smooth(); 
}

void draw() {
 
    if(mousePressed) {

  stroke(225,225,220,20);
   line(mouseY,random(height),mouseX,mouseY);

    }
}


