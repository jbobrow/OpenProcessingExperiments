
int time_off = 500; //time between flashes
int time_on = 1000; //how much time to stay on
int last_saved_time;//last time the light was on or off 
Boolean light_is_on = false;//boolean to see if the light is on or off

void setup() {
  smooth();
  size(400, 400);
  last_saved_time = millis();
}

void draw() {
  background(100);
  translate(width * .5, height * .5); //rotate from the center of the screen
  rotate(millis() * .0012); //rotation in radians
  scale(millis() * .001); //scale up slowly. scale(1) is 100%, scale(2) is 200%, etc...
  
  //by traditional programming standards, the above code is sloppy from a memory perspective,
  //but heck, I'm in art school, so who cares!!
  
  for (int i = 0; i<120; i++) {
    //I'm using this for loop to draw 120 bulbs in a spiral by rotating each bulb 
    //slightly and scaling it slightly. Past rotate() and scale() commands stack on each other
    //so they rotate based on the last rotation. 
    rotate(PI * .13); 
    scale(.95); //smaller and smaller scale every iteration of this for loop 
    drawBulb(int(width * .5), int(height * .5));
  }
}

void drawBulb(int center_x, int center_y) {
  //draw base of the bulb first
  fill(0);
  rect(center_x - 25, center_y + 40, 50, 50);
  
  //change the color of the light
  if (light_is_on == true) {
    fill(255, 255, 0);
    if (time_on < millis() - last_saved_time) {
        light_is_on = false; 
        last_saved_time = millis();
    } 
  } else {
    fill(100);
    if (time_off < millis() - last_saved_time) {
      light_is_on = true;
      last_saved_time = millis();
    }
  }
  //draw the bulb
  ellipse(center_x, center_y, 100, 100);
  
  // draw fillament
  noFill();
  beginShape();
  vertex(center_x - 10, center_y + 50);
  for (int i = center_x - 20; i <= center_x + 20; i+=5) {
    vertex(i, center_x + 10 - i % 2 * 10);
  }
  vertex(center_x + 10, center_y + 50);
  endShape();
}                               
