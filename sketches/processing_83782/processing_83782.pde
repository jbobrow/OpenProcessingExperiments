
PImage frog;
//images to store the open and closed mouth states
int frog_x = 100;
int frog_y = 100;

PImage frog_closed; 
PImage frog_open; 

Ant ant1;

Ant[] Ants = new Ant [10];

void setup() {
  size(600, 500);
  frog = loadImage ("frog_closed.png");
  frog_closed = loadImage ("frog_closed.png"); 
  frog_open = loadImage ("frog_open.png"); 

  ant1 = new Ant(0, random(height));
  for (int i = 0; i < 10; i = i + 1) {
    Ants[i] = new Ant (0, random(height));
  };
  imageMode(CENTER);//draw from the center of the frog
}

void draw () {
  background(0, 0, 200);
  image(frog, frog_x, frog_y);
  for (int i = 0; i < 10; i = i + 1) {
    Ants[i].moveAnt();
    Ants[i].drawAnt();
  }

  //if frog < -1 then frog = 600 
  if ( frog_x < -1) {
    frog_x = 600;
  }; 

  if (frog_x > 600) {
    frog_x = 0;
  }
}

void keyPressed() {
  //when pressed, move frog
  if (keyCode == UP) { 

    if (frog_y > 0) { 
      frog_y = frog_y+-20;
    }
  }


  if (keyCode == DOWN) {
    if (frog_y < height - 100) {
      frog_y = frog_y+20;
    }
  }

  if (keyCode == LEFT) {
    frog_x = frog_x+-20;
  }

  if (keyCode == RIGHT) {
    frog_x = frog_x+20;
  }
  //if the spacebar is pressed
  //frog = image of closed mouth

  if (key == ' ') {
    frog = frog_open;
    //go through all the ants (for loop)
    for (int i = 0; i < 10; i = i + 1) {
      //get the distance between an ant and the frog
      //      dist(frog_x, frog_y, Ants[i].ant_position.x, Ants[i].ant_position.y)
      if (dist(frog_x, frog_y, Ants[i].ant_position.x, Ants[i].ant_position.y) < 45) {
        Ants[i].isEaten = true;
      };
    }

    //see if their position is less than the radius of the frog
    //DESTROY THEM, IF IT IS!
  }
  //  frog_x = frog_x+-5;
  //  frog_y = frog_x+-5;
}

void keyReleased() {
  //if the spacebar is released
  if (key == ' ') { 
    frog = frog_closed;
  }
  //frog = image of open mouth
}
//class frog_move {
//  float frog_position_x;
//  float frog_position_y;
//
//
//  void move(int init_x, int init_y) {
//  }
//};

class Ant {
  //  int 0;//keeps track of the ant's position
  //  int 0;// these are assigned in the Constructor
  //  int 0_speed = 1; //how fast it moves
  //
  PVector ant_position = new PVector();
  PVector ant_speed = new PVector();

  int change_dir = int(random(40)) + 40;
  int speed_limit = 4;

  boolean isEaten = false;

  color ant_color = color(95, 61, 10);

  Ant(float _x, float _y) { //this is the Constructor. Think of it like the setup function for the ant
    ant_position = new PVector(_x, _y);
    ant_speed = new PVector(random(-3, 3), random(-3, 3)); //setup a random speed
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
    if (isEaten == false) {
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
    }
  }
}


