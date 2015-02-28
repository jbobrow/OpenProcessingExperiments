
Ant my_ant = new Ant(20, 320); //make a new Ant object at 20, 320

void setup() {
  size(300, 600);
  smooth();
}
void draw() {
  background(200);
  my_ant.drawAnt(); //this displays the ant's graphics
  my_ant.moveAnt(); //this moves the ant, based on it's speed.
}//end of the draw. See how short that was?
//
class Ant {
  int ant_x;//keeps track of the ant's position
  int ant_y;// these are assigned in the Constructor
  int ant_x_speed = 1; //how fast it moves

  Ant(int _x, int _y) { //this is the Constructor. Think of it like the setup function for the ant
    ant_x = _x;
    ant_y = _y;//I'm passing in two variables and setting the initial condition of the Ant's Position
  }
  void moveAnt() { //you often break objects into different functions like this so you can "turn off" parts easily
    ant_x += ant_x_speed; //just like moving an ellipse
    
    if (ant_x > width) {//this wraps the ant so it returns to the other side of the screen
      ant_x = 0;
    }
  }
  void drawAnt() {
    //draw the legs:
    line(ant_x, ant_y, ant_x - 10, ant_y - 10);
    line(ant_x, ant_y, ant_x + 10, ant_y - 10);
    line(ant_x, ant_y, ant_x, ant_y - 12);
    line(ant_x, ant_y, ant_x - 10, ant_y + 10);
    line(ant_x, ant_y, ant_x, ant_y + 12);
    line(ant_x, ant_y, ant_x + 10, ant_y + 10);
    //draw antenna
    line(ant_x+10, ant_y, ant_x + 17, ant_y-4);
    line(ant_x+10, ant_y, ant_x + 17, ant_y+4);
    //
    ellipse(ant_x, ant_y, 15, 10);//draw the body
    ellipse(ant_x + 10, ant_y, 8, 8); //draw the head
  }//end of the draw function
}//end of ant classs
