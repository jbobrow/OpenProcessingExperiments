
int time_off = 500; //time between flashes
int time_on = 800; //how much time to stay on
int last_saved_time;//last time the light was on or off 
Boolean light_is_on = false;//boolean to see if the light is on or off

void setup() {
  smooth();
  size(800, 800);
  last_saved_time = millis();
}

void draw() {
  background(36,36,36);
  noStroke();
  translate(width * .10, height * .10); //rotate from the center of the screen
  rotate(millis() * .0090); //rotation in radians
  scale(millis() * .0090); //scale up slowly. scale(1) is 100%, scale(2) is 200%, etc...
  
  //by traditional programming standards, the above code is sloppy from a memory perspective,
  //but heck, I'm in art school, so who cares!!
  
  for (int i = 0; i<800; i++) {
    //I'm using this for loop to draw 120 bulbs in a spiral by rotating each bulb 
    //slightly and scaling it slightly. Past rotate() and scale() commands stack on each other
    //so they rotate based on the last rotation. 
    rotate(PI * .30); 
    scale(.95); //smaller and smaller scale every iteration of this for loop 
    drawBulb(int(width * .5), int(height * .5));
  }
}

void drawBulb(int center_x, int center_y) {
  
  //change the color of the light
  if (light_is_on == true) {
    fill(255, 255, 0);
    if (time_on < millis() - last_saved_time) {
        light_is_on = false; 
        last_saved_time = millis();
    } 
  } else {
     fill(50,129,224);
    if (time_off < millis() - last_saved_time) {
      light_is_on = true;
      last_saved_time = millis();
    }
  }
  
  
  //draw the bulb
  ellipse(center_x, center_y, 380, 380);

  
}


