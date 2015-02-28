
PImage img;

void setup() {
  size(300, 300);
  color(RGB);
  img = loadImage("glass.jpg");
  background(0);
}

void draw() {

  //sets the int to follow the x,y coordinates of the mouse
  int x = mouseX; 
  int y = mouseY;
  //get the amount of green in the pixels wherever the mouse moves
  int g = int(green(img.get(x, y))); 
  //get the color of the specific pixel wherever the mouse moves
  color glassColor = img.get(x, y); 

  //creates an ellipse the same color as the pixel, size is proportional to the amount of green in pixel

  fill(glassColor, 25);
  ellipse(x, y, g/4, g/2);

  //showing the relationship of size of ellipse and amount of green
  println(g);
}


