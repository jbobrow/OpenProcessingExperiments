
void setup() {
  size(500, 500);
}

void draw() {
  //Motion Blur Effect
  //Adds rect() with opacity that fills the entire screen
  fill(50, 90);
  rect(0, 0, width, height);
  
  
  //The Main Loop
  float x = 0;
  while(x < 11) {
    float y = 0;
    while(y < 11) {
      
      //Calculates the Distance between mouse position and current point on loop
      float d = dist(mouseX, mouseY, x * 50, y * 50);
      
      //Creates a limit for the distance, change the limit if the mouse is pressed. 
      float dLimit;
      if(mousePressed) {
        dLimit = 100;
      } else {
        dLimit = 50;
      }
      
      //Draws a line, changes the color and strokeWeight if distance is inside dLimit
      //If its not inside the limit, set distance to 0 and changes stroke color and weight to normal
      if(d > dLimit) {
        d = 0;
        stroke(150);
        strokeWeight(3);
      } else {
        stroke(255);
        strokeWeight(1);
        line(x * 50 + 0.2*d, y * 50 + 0.2*d, mouseX, mouseY);
        strokeWeight(5);     
      }
      
      //Draws all points according to loop
      point(x * 50 + 0.2*d, y * 50 + 0.2*d);
      
      y = y + 0.5;
    } //end y loop
    x = x + 0.5;
  } ///end x loop
  
  //end draw
}
