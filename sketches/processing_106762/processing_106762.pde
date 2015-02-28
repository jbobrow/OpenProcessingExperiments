
class Ampslider {


  int ampsliderx; //slider xposition
  int ampslidery; //slider yposition
  int ampslidermax; //slider min
  int ampslidermin; //slider max
  int ampslidersize; //slider size
  boolean amprollover = false; // Is the mouse over the ellipse?
  int ampsnum; //position of the slider in the object array list


  //slider constructor
  Ampslider(int s_num, int s_x, int s_y, int s_m, int s_max, int s_size ) {
    //slider arguments xpos, ypos, ymin, ymax,size

    ampsliderx = s_x; //slider xposition
    ampslidery = s_y; //slider yposition
    ampslidermax = s_m; //slider min
    ampslidermin = s_max; //slider max
    ampslidersize = s_size; //slider size
    ampsnum = s_num; //position of the slider in the object array list
  }


  void update() {

    stroke(50);
    strokeWeight(2);
    fill(255);
    
    rect(ampsliderx - 45, ampslidermax - 170, 160, 320);
    
    
    fill(0);
    strokeWeight(2);
    stroke(0);
    line(ampsliderx, ampslidermin, ampsliderx, ampslidermax);

    if (amprollover) { 
      ampslidery =  constrain(mouseY, ampslidermax, ampslidermin);
      fill(125, 125, 125, 0);
    } 
    else {
      fill(255, 225, 189, 0);
    }

    fill(200);
    ellipse(ampsliderx, ampslidery, ampslidersize, ampslidersize);
    fill(180);
    ellipse(ampsliderx, ampslidery, ampslidersize/2, ampslidersize/2);
    fill(255);
    
    fill(0);
    textFont(lable, 9);
    text("Angle \n of turn", ampsliderx - 20, ampslidermax - 15);
    
  }

  void hover(int mx, int my) {
    float d = dist(mx, my, ampsliderx, ampslidery); //tests if the mouse is within the slider button
    if (d < ampslidersize/2) {
      amprollover = true;
    } 
    else {
      amprollover = false;
    }
  }
}


