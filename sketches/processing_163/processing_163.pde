
class Brush {

  color c;
  int rotation;                         // variable for color rotation


    Brush (float tempR,float tempG,float tempB) {

    c = color(tempR,tempG,tempB);
    stroke(c);                          
    rotation = 0;                      

  }

  void paint() {

    // Adjust color according to color rotation
    if(rotation == 3) {
      c = color(255,149,0);                
    } 
    else if(rotation == 2) {
      c = color(255,255,0);
    } 
    else if (rotation == 1) {
      c = color(201,0,0);
    } 
    else if (rotation == 0) {
      c = color(255);
    }

    stroke(c);


    strokeWeight(abs(pmouseX-mouseX));             // stroke weight determined by mouse speed
    line(pmouseX,pmouseY,mouseX,mouseY);           // PAINT 
    noFill();                                     // no fill for border
    rect(0,0,width,height);                       // border 
  }


  void changeColor() {
    // called when mouse clicked

    rotation++;                 // rotate colors

    if (rotation == 4) {
      rotation = 0;            // if rotation gets to end, start over
    } 
  }

  color getColor() {
    return c;                // pass color for drops
  }


}

