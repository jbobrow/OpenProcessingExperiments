
PImage ensor;

void setup() {
  size(300, 300);
  ensor= loadImage("autumn_ensor_lg.jpg");

  noStroke();
  smooth();
}

int cell = 5;  

void draw() {
}
void mousePressed() {

  background(0, 0, 50);

  for (int y=0; y<=width; y+=cell*2) {     //integers are placed according to the conditions setup.
  for (int x=0; x<=height; x+=cell*4) {

      int a= int(random(0, ensor.width));  //color is partially selected from specific points of the image based on the y coordinate of the mouse.
      color myColor= ensor.get(a, mouseY); //color is also partially selected from the overall image.
      
      fill (myColor);
      ellipse(random(x), y, random(5,25), cell); //placement and overlapping allows for colors ro blend as if they were in the image together.They may or may not create a new pattern. 
    }
  }
}


