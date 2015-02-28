
//image size and selection.

PImage img;

//image sizing and selection.
void setup(){
  size(400,267);
  img = loadImage("sign.jpg");
  fill(0,52);
  smooth();
  noStroke();
  image(img,0,0);
}

//setting the true and false control statements. 
boolean drawing = false;

//determining the size, shape, and colour/opacity of the drawing controls.
void draw () {
  if (drawing) {
    rect(mouseX, mouseY, 7, 7);    
    fill (0,0,0,39);
  }
}

//when the mouse is pressed (draw) and when the mouse is released (drawing still remains).
void mousePressed () {
  if (mouseButton == LEFT) {
    drawing = true;
  } else if (mouseButton == RIGHT) {
     image(img,0,0);
  }
}

void mouseReleased () {
  drawing = false;
}

//setting the interaction to clear the drawing and return to the original image. 
void keyPressed() {
  if (key == 'e') {
//original image. 
    image (img,0,0);
    {    
}
}
}

//setting the control for saving a png file.
void keyReleased(){
  if (key == 's') saveFrame(timestamp()+"_##.png");
  }  

//setting a timestamp so you can save your drawing as a png.  
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


