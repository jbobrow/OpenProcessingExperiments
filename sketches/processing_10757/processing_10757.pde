
class SacredObject { 

  float xpos;
  float ypos;
  float radius;
  color backColor;
  color frontColor;

  float getDegreeX(float theta){
    float pointX;
    pointX = xpos + radius * cos(theta);  

    //println("pointX of circle at " + degrees(theta) + " = " + pointX );
    return pointX;
  }

  float getDegreeY(float theta){
    float pointY;
    pointY = ypos + radius * sin(theta);  
    //println("pointY of circle at origin  " + xpos + ", " + ypos + " is  ypos(" + ypos+") + " + radius + " * sin( " + degrees(theta) + ") = " + pointY );
    return pointY;
  }

void alterPos(float floatXpos, float floatYpos) { 
    xpos = floatXpos;
    ypos = floatYpos;

    //backColor = color(random(128), random(128), random(128), 60);
    //println(this + " (SacredObject.alterPos) |||  xpos:" + xpos + ", ypos:" + ypos  + " );
  }
  

} // end class




