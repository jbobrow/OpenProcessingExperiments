
/** "The Lonely Runner Conjecture"
 The Lonely Runner conjecture states that for each runner, 
 there will come a time when he or she will be a distance 
 of at least 1/k along the track from every other runner.
 Owner: Aryelle Player
 */


//=========================================================================
//this section creates all of the necessary variables-runners, pvectors, etc.

final float NumOfRunners = 8;
float radius = 100;
float diameter = 2*radius;

Runner red; 
Runner blue; 
Runner green;
Runner yellow;
Runner orange;
Runner purple;
Runner white;
Runner rainbow; //can this runner prove or disprove the conjecture?

PVector redpos = new PVector(radius*cos(0), radius*sin(0));
PVector bluepos = new PVector(radius*cos(0), radius*sin(0));
PVector greenpos = new PVector(radius*cos(0), radius*sin(0));
PVector yellowpos = new PVector(radius*cos(0), radius*sin(0));
PVector orangepos = new PVector(radius*cos(0), radius*sin(0));
PVector purplepos = new PVector(radius*cos(0), radius*sin(0));
PVector whitepos = new PVector(radius*cos(0), radius*sin(0));
PVector rainbowpos  = new PVector(radius*cos(0), radius*sin(0));

PVector[] pos = {
  redpos, bluepos, greenpos, yellowpos, orangepos, purplepos, whitepos, rainbowpos
};

//===========================================================================
//this section initializes all runners and sets up the screen

void setup() {
  float radius = 200;
  red = new Runner(PI/120, "red", redpos);
  blue = new Runner(PI/170, "blue", bluepos);
  green = new Runner(PI/190, "green", greenpos);
  yellow = new Runner(PI/150, "yellow", yellowpos);
  orange = new Runner(PI/140, "orange", orangepos);
  purple = new Runner(PI/230, "purple", purplepos);
  white = new Runner(PI/210, "white", whitepos);
  rainbow = new Runner(PI/100, "rainbow", rainbowpos);
  size(500, 500);
  smooth();
  pushMatrix();
}


//============================================================================
//this section adds a background, translate the grid, draws the track, and gives
//the runners movement

void draw() {
  background(245, 222, 179);
  translate(width/2, height/2);

  pushMatrix();
  drawTrack();

  red.run();
  red.display();
  if (red.lonely(rainbowpos) == true && red.lonely(bluepos) == true &&  red.lonely(greenpos) == true && red.lonely(yellowpos) == true && red.lonely(orangepos) == true && red.lonely(purplepos) == true && red.lonely(whitepos) == true) {
    text("red", -10, -20);
  }

  blue.run();
  blue.display();
  if (blue.lonely (rainbowpos) == true && blue.lonely(redpos) == true &&  blue.lonely(greenpos) == true && blue.lonely(yellowpos) == true && blue.lonely(orangepos) == true && blue.lonely(purplepos) == true && blue.lonely(whitepos) == true) {
    text("blue", -12, -10);
  }

  green.run();
  green.display();
  if (green.lonely(rainbowpos) == true && green.lonely(bluepos) == true &&  green.lonely(redpos) == true && green.lonely(yellowpos) == true && green.lonely(orangepos) == true && green.lonely(purplepos) == true && green.lonely(whitepos) == true) {
    text("green", -15, -0);
  }

  yellow.run();
  yellow.display();
  if (yellow.lonely(rainbowpos) == true && yellow.lonely(bluepos) == true &&  yellow.lonely(greenpos) == true && yellow.lonely(redpos) == true && yellow.lonely(orangepos) == true && yellow.lonely(purplepos) == true && yellow.lonely(whitepos) == true) {
    text("yellow", -18, 10);
  }

  orange.run();
  orange.display();
  if (orange.lonely(rainbowpos) == true && orange.lonely(bluepos) == true &&  orange.lonely(greenpos) == true && orange.lonely(yellowpos) == true && orange.lonely(redpos) == true && orange.lonely(purplepos) == true && orange.lonely(whitepos) == true) {
    text("orange", -18, 20);
  }

  purple.run();
  purple.display();
  if (purple.lonely(rainbowpos) == true && purple.lonely(bluepos) == true &&  purple.lonely(greenpos) == true && purple.lonely(yellowpos) == true && purple.lonely(orangepos) == true && purple.lonely(redpos) == true && purple.lonely(whitepos) == true) {
    text("purple", -18, 30);
  }

  white.run();
  white.display();
  if (white.lonely(rainbowpos) == true && white.lonely(bluepos) == true &&  white.lonely(greenpos) == true && white.lonely(yellowpos) == true && white.lonely(orangepos) == true && white.lonely(purplepos) == true && white.lonely(redpos) == true) {
    text("white", -15, 40);
  }

  rainbow.run();
  rainbow.display();
  if (rainbow.lonely(whitepos) == true && rainbow.lonely(bluepos) == true &&  rainbow.lonely(greenpos) == true && rainbow.lonely(yellowpos) == true && rainbow.lonely(orangepos) == true && rainbow.lonely(purplepos) == true && rainbow.lonely(redpos) == true) {
    text("rainbow", -20, 50);
  }
  popMatrix();
}

//=============================================================================
void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        radius += 50;
      } else if(keyCode == DOWN){
        radius -= 50;
      }
    }
    else{
     radius = 100; 
    }
}

//==============================================================================
//this section is my runner class

class Runner {
  //each runner has a position, speed, and team(color)
  PVector position;         
  float speed;
  String team; 

  Runner(float speed_, String team_, PVector position_) {
    position = position_;
    speed = speed_;
    team = team_;
  }


  //the runner is given its team(color) and position(PVector)
  void display() {
    fill(Team(team)[0], Team(team)[1], Team(team)[2]);
    ellipse(position.x, position.y, 14, 14);
  }

  // this method allows the runner to run
  void run() {
    position.rotate(speed);
  }

  //this method determines if the runner is lonely, returning true or false
  boolean lonely(PVector otherRunner) {
    float radius = 100;
    float distance = dist(position.x, position.y, otherRunner.x, otherRunner.y); 

    float angle = 2*acos((distance/2)/radius);

    float lonely = (angle/360)*((TWO_PI)*radius);

    while (map (lonely, 0, 5, 1, 0) > (1.0/NumOfRunners)) {
      return true;
    }

    return false;
  }
}


//========================================================================
//this section is full of all other methods

//this method draws the track
void drawTrack() {
  background(245, 222, 179);

  fill(255, 255, 255, 0);
  ellipse(0, 0, diameter+50, diameter+50);

  fill(255, 255, 255, 0);
  ellipse(0, 0, diameter-50, diameter-50);

  fill(0, 0, 0);
  textSize(12);
  text("Who's lonely?", -40, -40);
  text("-----------", -40, -30);
}

//this method translates a string into the specified color
float[] Team(String teamcolor) {
  float[] person = {
    0, 0, 0
  };

  if (teamcolor.equals("red")) {
    person[0] = 255;
  } 
  if (teamcolor.equals("green")) {
    person[1] = 255;
  } 
  if (teamcolor.equals("blue")) {
    person[2] = 255;
  }
  if (teamcolor.equals("yellow")) {
    person[0] = 255;
    person[1] = 255;
  } 
  if (teamcolor.equals("purple")) {
    person[0] = 128;
    person[2] = 128;
  } 
  if (teamcolor.equals("orange")) {
    person[0] = 255;
    person[1] = 100;
  }
  if (teamcolor.equals("white")) {
    person[0] = 255;
    person[1] = 255;
    person[2] = 255;
  }
  if (teamcolor.equals("rainbow")) {
    person[0] = random(0, 255);
    person[1] = random(0, 255);
    person[2] = random(0, 255);
  }

  return person;
}

