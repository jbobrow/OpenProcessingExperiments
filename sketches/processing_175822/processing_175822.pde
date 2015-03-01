
//display date and time

float red = 255;
float green = 255;
float blue = 255;

void setup() {
  size(400, 250);  
  textSize(20);    
}
void draw() {
  background(red, green, blue);
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);  

  String message = "Date: " + month() + "/" + day() + "/" + year(); 
  text(message, 110, 110);

  message = "Time: " + nf(hour()%12, 2) + ":" + nf(minute(), 2) + ":" + nf(second(), 2); 
  text(message, 110, 140);
}

void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}
