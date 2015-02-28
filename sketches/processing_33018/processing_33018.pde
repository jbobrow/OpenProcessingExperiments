

//name class Agent
class Agent {

  //set the global variables   
  PVector location;

  PVector velocity;

  float agentSize;

  float agentDist;

  int col = 0;

  int col2 = 0;

  int count = 0;

  //Each instance of the class Agent will be defined by initial location, size, colour
  //and velocity
  Agent(PVector LOCATION, float AGENTSIZE, int AGENTCOLOUR, PVector VELOCITY) {

    location = LOCATION;
    agentSize =AGENTSIZE;
    col = AGENTCOLOUR;
    velocity = VELOCITY;
  }

//function run, runs the functions render, updatePos and flock
  void run() {

    render();
    updatePos();
    flock();
  }

//render creates circles with and initial location and size
  void render() {

    fill(col,0,col2,100);
    stroke(col, 0, col2, 50);
    strokeWeight(2);
    ellipse(location.x, location.y, agentSize, agentSize);
  }

//updatePos shifts the position of the cirlce by adding a PVector velocity to the
//existing location of the circle
  void updatePos() {

    location.add(velocity);

//if statement allows cirlce to appear on other side of screen when it passes out of
//the screen
    if (location.x < 0 ) {

      location.x = width;
    }


    if (location.x > width ) {

      location.x = 0;
    }

    if (location.y > height ) {

      location.y = 0;
    }

    if (location.y < 0 ) {

      location.y = height;
    }
  }


//Function flock used to make cirlces align and avoid one another
  void flock() {

//arbitrarily high minDist
    float minDist = 1000000;

//create for loop to run through all circles in array list
    for (int i = 0; i < numAgents; i++) {
      
//pulls out each cirle in the array list to compare to circle currently running
//through the class
      Agent a = (Agent) agentPop.get(i);

//measure the distance between the current circle and all the others
      float agentDist = location.dist(a.location);
//to check we are not measuring the dist from the same circle
      if (agentDist > 0) {

        if (agentDist < minDist) {
          minDist = agentDist;
        }
//check if circles are within a certain dist from each other
//defined by the variable allign
        if (agentDist < align) {

//get the velocity of the other circle a and store in the vector addVec.

          PVector addVec = a.velocity.get();
//multipy by the inverse of the distance so that those closer will have
//more affect
          addVec.mult(falloff/agentDist);
//add the velocity of the other addVec to our current circles velocity
//which obviously pulls our current circle in the direction of the other one.
          velocity.add(addVec);
//give the velocity a magnitude of 1 so that speeds don't get to high.
          velocity.normalize();
//those that are attracted continue to shrink
          agentSize = agentSize - 0.1;
        }

//this if statement prevents the cirlces from becoming completely conjoined
        if (agentDist < avoid) {
//this is pretty much the same as above however now we subtract rather than add.
          PVector addVec = a.location.get();

          addVec.sub(location);

          addVec.mult(falloff/agentDist);

          velocity.sub(addVec);

          velocity.normalize();

          agentSize = agentSize + 0.2;
        }
      }
//Now we create line between the small circles that have been trapped in a flock
//and the large circles still cruisin round with some autonomy
//ig the dist is between 20 and 60 and one circle is big and one small make a 
//line between them.
      if (agentDist < 60 && agentDist > 20 && agentSize > 20 && a.agentSize < 9) {
        stroke(150);
        strokeWeight(1);
        line(location.x, location.y, a.location.x, a.location.y);
      }
    }
//make sure circels don't get too small and give them a colour when they do go small
    if (agentSize <8) {
      agentSize = 8;
      col2 = 200;
    }
//give the circles that are big a separate colour
    if (agentSize >40) {
      
      col = 200;
    }
  }
}  



