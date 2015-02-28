
int ant_num = 20;
Ant[] ants = new Ant[ant_num]; //make a bunch of ants
void setup() {
  size(600, 600);
  smooth();
  for (int i=0; i<ants.length; i++) {
    ants[i] = new Ant(random(width), random(height) ); //setup each ant
  }
}
void draw() {
  background(200);

  for (int i=0; i<ants.length; i++) {
    ants[i].drawAnt(); //this displays the ant's graphics
    ants[i].moveAnt(); //this moves the ant, based on it's speed.
  }
}//end of the draw. See how short that was?
//
class Ant {
//  int 0;//keeps track of the ant's position
//  int 0;// these are assigned in the Constructor
//  int 0_speed = 1; //how fast it moves
//  
  PVector ant_position = new PVector();
  PVector ant_speed = new PVector();
  
  int change_dir = int(random(40)) + 40;
  int speed_limit = 4;
  
  color ant_color = color(95, 61, 10); 

  Ant(float _x, float _y) { //this is the Constructor. Think of it like the setup function for the ant
    ant_position = new PVector(_x, _y);
    ant_speed = new PVector(random(-3, 3), random(-3,3)); //setup a random speed
  }
  void moveAnt() { //you often break objects into different functions like this so you can "turn off" parts easily
    ant_position.add(ant_speed);
    
    //wrap walls
    if (ant_position.x > width) {
      ant_position.x = 0;
    }
    if (ant_position.x < 0) {
      ant_position.x = width;
    }
    if (ant_position.y < 0) {
      ant_position.y = height;
    }
    if (ant_position.y > height) {
      ant_position.y = 0;
    }
    
    if (frameCount%change_dir == 0) {//make the ant change direction sometimes
      ant_speed.add( new PVector(random(-2, 2), random(-2, 2))); 
      change_dir = int(random(120)) + 60;
    }
    
    if (ant_speed.mag() > speed_limit) { //speed limit
      ant_speed.normalize();
    }
  } 
  void drawAnt() {
    fill(ant_color);
    stroke(1);
    pushMatrix();
    translate(ant_position.x, ant_position.y);
    rotate(atan2(ant_speed.y, ant_speed.x));
    //draw the legs:
    float leg_move = sin(frameCount * .2) * 2; //this makes the legs wiggle
    
    line(0, 0, leg_move-10, -10);
    line(0, 0, leg_move+10, -10);
    line(0, 0, -leg_move, -12);
    line(0, 0, leg_move-10, 10);
    line(0, 0, -leg_move, 12);
    line(0, 0, leg_move+10, 10);
    //draw antenna
    line(10, 0, 17, -4);
    line(10, 0, 17, 4);
    //
    noStroke();
    ellipse(0, 0, 15, 10);//draw the body
    ellipse(10, 0, 8, 8); //draw the head
    popMatrix();
  }//end of the draw function
}//end of ant classs
