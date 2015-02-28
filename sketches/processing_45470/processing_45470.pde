
class ClassArrayCircle {
  float xpos;
  float ypos;
  color circlecolor;
  float xspeed;
  float yspeed;
  float xdirection;
  float ydirection; 
  
  ClassArrayCircle(
                    float TEMP_xpos,
                    float TEMP_ypos,
                    color TEMP_circlecolor,
                    float TEMP_xspeed,
                    float TEMP_yspeed,
                    float TEMP_xdirection,
                    float TEMP_ydirection,
                    int circleID
                   ){
        xpos = TEMP_xpos;
        ypos = TEMP_ypos;
        circlecolor = TEMP_circlecolor;
        xspeed = TEMP_xspeed;
        yspeed = TEMP_yspeed;
        xdirection = TEMP_xdirection;
        ydirection = TEMP_ydirection;
  }
   
  void display(){
    noStroke();
    fill(circlecolor);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,CIRCLE_SIZE,CIRCLE_SIZE);
  }
  void moveCircle(){
    xpos = xpos + (xspeed * xdirection);
    ypos = ypos + (yspeed * ydirection);
    if(xpos > width-25-50 || xpos < 50){
      xdirection *= -1;
    }
    if(ypos > height-25-105 || ypos < 50){
      ydirection *= -1;
    }
  }
   
}//END OF CLASS 

