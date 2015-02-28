
class Dot { //class--> like a template

  PVector pos; //position
  PVector vel; //velocity --> to make the snakes grow! = change in position per frame
  color c; //colour
  float s; //size of dot
  PVector col_change; // colour change - to make the dots change colour

  Dot(PVector _pos,  color _c, float _s) { //CONSTRUCTOR - function -- makes new object, COULD ADD VEL HERE, BUT WANT TO BE RANDOM ATM
    pos=_pos;   //take the incoming info and store it
    c=_c; //colour
    s=_s; //size
    if (random(0,4)<=1) { //only want the snakes to draw in 4 directions
      vel = new PVector (1,0); //left to right
    }
    else if (random(0,4)<=2) {
      vel = new PVector (0,1); //up
    }
    else if (random(0,4)<=3) {
      vel = new PVector (-1,0); //right to left
    } 
    else {
      vel = new PVector (0,-1); //down
    }
  }

  void render() { //object can draw itself
    fill(c); //fill the dot with its own colour
    ellipse( pos.x, pos.y, s, s ); //draw the dot on the screen
  }

  void move( ) { //dots can move which in turn draws the snakes
    pos.add(vel); //add the velocity to the position
    c--; //was determined to get the snakes to change colour!! in the end the best solution was the simplest but hardest to work out!
  }
  
  void bounce() { //bouces off sides
    if (pos.x> width) {  //bounces off left hand side
      vel.x = vel.x * -1;
    }
    if (pos.x <0) {
      vel.x = vel.x * -1; //bounces off right hand side
    }
    if (pos.y> height) {
      vel.y = vel.y * -1; //bounces off the bottom
    }
    if (pos.y <0) { 
      vel.y = vel.y * -1; //bounces off the top
    }
  }
}

