
/*Nafis S Sabir
 Prof. Calli Higgins
 HW 3.2.2*/

float r = 0;//variable for red
float b = 0;//variable for blue
float g = 0;//variable for green

void setup() {
  size(200, 200);//screen size
}

void draw() {
  background(r, g, b);//background color
  stroke(0);//stroke setting for lines

  line(width/2, 0, width/2, height);//vertical line
  line(0, height/2, width, height/2);//horizontal line

  if (mouseX > width/2 && mouseY < height/2) { //red color when the mouse is in the top right corner
    r = r + 1;//add red
  } 
  else {
    r = r - 1;//remove red
  }

  if (mouseY < height/2 && mouseX < width/2) {//green color when the mouse is in the top left corner
    g = g + 1;//add green
  } 
  else {
    g = g - 1;//remove green
  }

  if (mouseX < width/2 && mouseY > height/2) {//blue color when the mouse is in the bottom left color
    b = b + 1;//add blue
  } 
  else {
    b = b - 1;//remove blue
  }

  r = constrain(r, 0, 255);//cosnstrain all color values to between 0 and 255
  g = constrain(g, 0, 255);
  b = constrain(b, 0, 255);
}



