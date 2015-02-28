
PImage img; // Declare variable "a" of type PImage

void setup(){
  size(300, 500); //size of applet
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("Paddington.jpg");
  textFont(createFont("Georgia", 24)); //command for font and typeface
  noCursor(); //command for no cursor to appear
}

void draw(){
  background(50, 50, 50); //background colour
  noStroke(); //no stroke around shapes
  fill(255); //white fill for rectangle only
  rect(20, 20, 260, 40); //position and size of rectangle
  if(mouseX > width/2-50 && mouseY > height/2-50 && mouseX < width/2+50 && mouseY < height/2+50){ //if condition this sets a boundary around the shapes
  fill(255, 0, 0);//colour for rectangle and circle
}
  else fill(255); //else condition, the colour will change if mouse goes over shapes
  imageMode(CENTER); //cursor position in centre
  image(img, mouseX, mouseY, 300, 500); //position and size of image
  ellipse(width/2, height/2, 100, 100); //position and size of circle
  fill(0, 0, 255);//blue fill for text
  text("Paddington Bear", 60, 47); //text words and position
  fill(255); //white fill for text
  text("Hello!", width/2-30, height/2); //text words and position
}


