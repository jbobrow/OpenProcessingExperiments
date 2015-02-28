
//
//put 7 objects around the mouse equally spaced
//
int number_of_obj = 14;
int distance = 50;
float angle_inc = TWO_PI/14;
float current_angle = 0;

void setup() {
  size(600, 540);
  colorMode(HSB, 360, 100, 100);
  
}
void draw() {
  distance = int(sin(millis()*.001)*50);
  background(180);
  for (int i=0; i<number_of_obj; i++){
    fill(map(angle_inc*i, 0, TWO_PI, 0, 360), 100, 100);
    float offset_x = cos(angle_inc*i)*distance;
    float offset_y = sin(angle_inc*i)*distance;
    ellipse(mouseX+offset_x, mouseY+offset_y, 20, 20);
    
  
  }
  
  
  
 /* float offsetX = cos(current_angle)*distance; //cos is for the x's
  float offsetY = sin(current_angle)*distance; //sin is gor the y's
  ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);
  //second ellipse
  offsetX = cos(current_angle + angle_inc)*distance; //cos is for the x's
  offsetY = sin(current_angle + angle_inc)*distance; //sin is gor the y's
  ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);
  
  offsetX = cos(current_angle + angle_inc*2)*distance; //cos is for the x's
  offsetY = sin(current_angle + angle_inc*2)*distance; //sin is gor the y's
  ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);
  
  offsetX = cos(current_angle + angle_inc*3)*distance; //cos is for the x's
  offsetY = sin(current_angle + angle_inc*3)*distance; //sin is gor the y's
  ellipse(mouseX + offsetX, mouseY + offsetY, 20, 20);
  */

}

