
PImage img;
void setup() {
size(270, 350);
img = loadImage("face.jpg");
background(img);
  strokeWeight(2);

}

void draw() {
    if (mousePressed == true) { // If mouse is pressed,
    line(mouseX, mouseY, pmouseX, pmouseY); // set the stroke to white
  } 
  else { // Otherwise,
    stroke(0); // set to black
  
  }
  if(keyPressed==true){
    image(img,0,0);
}
}

