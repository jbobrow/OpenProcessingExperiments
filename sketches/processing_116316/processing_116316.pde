
/* @pjs preload= "alaska.jpg"; */
PImage image;
String name = "alaska";

void setup() {
  size(1024, 633);
  image = loadImage(name+".jpg");
  noStroke();
  background(255);
  frameRate(45);
}

//Fill circles with color of the pixel located at
//the position of the mouse.
void draw() {
  if (mousePressed){
  color c = image.get(mouseX, mouseY);
  fill(c, 102);
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  }  
}

//Creates a circle directly proportional to the 
//speed of mouse movement.
void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  ellipse(x, y, speed, speed);
}

void keyPressed(){
  //filters
  if (key == 'b'){
    filter(BLUR); //blurry filter
  }
  if (key == 'g'){
    filter(GRAY); //shift to grayscale
  }
  if (key == 't'){
    filter(THRESHOLD); //black & white
  }
  if (key == 'e'){
    filter(ERODE); //reduce the light areas
  }
  if (key == 'd'){
    filter(DILATE); //increase the light areas
  }
  
  //Reset image
  if( key =='w'){
    background(255); //paint screen black
  }
  if( key =='z'){
    background(0); //paint screen white
  }
  if(key == 'i'){
    background(image); //show image
  }
  
  //save image
  if (key == 's'){
    saveFrame(image+".jpg"); //save image as .jpg
  }
}





