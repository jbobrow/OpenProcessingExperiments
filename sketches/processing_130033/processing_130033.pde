

float mouseSpeed = 0;
float mapSpeedToColor = 0;
float smoothedSpeed = 0;

void setup() {
  size (600, 600);
  fill(255,255,255);
}


void draw() {
  //measure the distance the mouse has traveled since
  //the last frame
  mouseSpeed = dist(mouseX, mouseY, pmouseX, pmouseY);
  
  //smooth out the speed so the result isn't jumpy
  smoothedSpeed = lerp(smoothedSpeed, mouseSpeed, 0.03);
  
  //convert the speed into a color value using map
  mapSpeedToColor = map(smoothedSpeed, 0, 10, 0, 255);
  
  //update the background color, using the calculated
  //color as the blue value (arguments are red, green, blue)
  background(155, 0, mapSpeedToColor);

}




