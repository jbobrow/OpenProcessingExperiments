
class Circle {
    float x,y; //location
    float dia; //diameter
    float exSpd; //expansion speed
    color c; //color of each circle

  Circle (float x_, float y_) {
    dia = 10; //starting diameter, also dot for moving, and dot for bounce-back
    x = x_; //x position
    y = y_; //y position
    c = color(random(255), random(255), random(255)); //randomize color of circle
  }
  
  void display(float exSpd_) {
    exSpd = exSpd_;
    stroke(c); //random color
    strokeWeight(4);
    fill(255);
    ellipse(x,y,dia,dia); //displays the circle
    dia += exSpd; //expands the circle at rate pre-defined
    noStroke();
    fill(c);
    ellipse(x,y,10,10); //displays a solid circle in the center of expanding one
   }
  
  float diameter() { //sends diamter expansion data to the main draw loop for storing in an array
    return dia;
  }
}

