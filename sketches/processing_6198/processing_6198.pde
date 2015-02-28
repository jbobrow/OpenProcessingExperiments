
class Eye
{
  float ex, ey;                 
  float size;
  float angle = 0.0;
  float easing =.05;                 //for pupil movement

  float d;                           //variables to
  float targetD;                     //set up the easing
  float easing2 = .01; 

  Eye() {        
  }

  void update( float mx, float my) {    //takes inpute from mouse
    angle= atan2(my-ey, mx-ex);         //subtracts position defined in void draw from mouse position
  }

  void display(float xpos, float ypos, float s) {
    size = s;
    ex = xpos;
    ey = ypos;

    pushMatrix();
    translate (ex, ey-size);
    rotate (angle);
    fill(168,107,72);
    ellipse(size/6, 0, size/2, size/2);    //middle size ellipse
    fill(0);
    ellipse(size/6, 0, size/4, size/4);    //small ellipse
    popMatrix();

  }
}



