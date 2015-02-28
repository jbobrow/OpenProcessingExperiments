
PImage tower; 
int x;
int y;

void setup() {
  size (300, 300);
  smooth();
  tower = loadImage("8.jpg"); //load the image
  background(tower);
}

void draw() {
  color click = get(mouseX, mouseY); //picks a color depenging on where the mouse is
  fill(click); //fills the shape with the color
  
  if(mousePressed) { //the spot clicked turns into a square of that color
    noStroke();
    x=mouseX-(mouseX%10); //spaces the rectangles
    y=mouseY-(mouseY%10); 
    rect(x,y,10,10);
  }
}


