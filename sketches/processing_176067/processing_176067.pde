
float starX=200;
float starY=200;

float r = 0;
void setup() {
  //this is the size of the screen and controls the randomness of the background colour
  size (400,400);
 // background() erases the screen with a color
  background(0, 204, 244);
}

void draw() {
  //this renews the black backgroud
  fill(0, 5);
  rect(0, 0, width, height);
 //this controls the colour of the lines
  line((starX), (starY), random (400), random (400));
 //this is the colour of the lines 
 stroke(random (255), random(255), random (255)); // R, G, B
 //this section enables the clicking controling the location of the center of the lines
  translate(mouseX, mouseY);
if (mousePressed == true){
starX= mouseX;
starY= mouseY;

}
}

