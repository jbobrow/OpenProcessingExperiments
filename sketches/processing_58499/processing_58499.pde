
class Balik {
  
  color c;
  float xpos;
  float ypos;
  float yspeed;

  
  //the constructor
  Balik (color tempC, float tempXpos, float tempYpos, float tempYspeed)  
  {
    c = tempC;
   xpos = tempXpos;
   ypos = tempYpos;
   yspeed = tempYspeed;
   
}




void display() {

ellipseMode(CENTER);
fill(c);
ellipse(xpos,ypos,30,20);

}

void move ()   {
  ypos= ypos+ yspeed;
  if (ypos>width)   
    ypos= 0;
  }
  
 }



