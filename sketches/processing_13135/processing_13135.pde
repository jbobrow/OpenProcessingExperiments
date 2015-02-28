
class Circle {

  float xpos;
  float ypos;
  float radius = 1;



  Circle () {
    xpos = width/2;
    ypos = height/2;  
  }

  void display () {
    //make ellipse for Circle
    smooth ();
    stroke (255);
    fill (50,0,130,0);
    ellipse (xpos, ypos, radius, radius);
    for (int i = 0; i < 10; i++) {
      radius = radius + 2; 
    }

  }






}





