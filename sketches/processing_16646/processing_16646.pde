
Car[] cars = new Car[5]; //allows the car class to be reused.
Lanes[] lane = new Lanes[14]; //allows the lanes to be reused
Frog frog = new Frog(color(255,255,0), 410, 539, height/14); //sets parameters for the Frog
Log[] logs = new Log[5]; //allows the logs to be reused.

String[] laneType = {"title_score", //determines the order of which the lanes will appear on the screen.
"grass",
"water",
"water",
"water",
"water",
"water",
"grass",
"road",
"road",
"road",
"road",
"road",
"start_end"};

void setup(){
  size(800, 560); //sets size of the screen
  background(0);
  smooth();
  for(int i = 0; i < laneType.length; i++){ //Creates new lanes
  lane[i] = new Lanes(laneType[i], i*40);
  }
  for(int i = 0; i < cars.length; i++){ //Creates new cars.
    cars[i] = new Car(color (random(255), random(255), random(255)), random(0, 800), 500 - (i*40), (i^-1)*random(0, 2));
  }
  for(int i = 0; i < logs.length; i++){ //Creates new logs
    logs[i] = new Log(color(139,69,19), random(50, 150), random(0,800), 260 - (i*40), (i^-1)*random(0,2));
  }
}

void draw(){  
  for(int i = 0; i < laneType.length; i++){ //Display the lanes
    lane[i].display();
  }
  for(int i = 0; i < cars.length; i++){ //Displays the cars and moves them accross the lanes
    cars[i].move();
    cars[i].display();
  }
  for(int i = 0; i < logs.length; i++){ //Displays the logs and moves the accross the screen 
    logs[i].move();
    logs[i].display();
  }
  frog.display(); //draws the frog
  frog.boundary(); //creates a box that the frog can move in, but cannot penetrate
  //the walls (size of the screen)
}

void keyPressed(){ 
  if(key == CODED){ //when the 'up arrow' is pressed the frog moves up the screen by 40pixels
    if(keyCode == UP){
      frog.hop(0, -40);
    }
    if(keyCode == DOWN){ //when the 'down arrow' is pressed the frog moves down the screen 40pixels
      frog.hop(0, 40);
    }
    if(keyCode == RIGHT){ //when the 'right arrow' is pressed the frog moves right by 40pixels
      frog.hop(40, 0);
    }
    else if(keyCode == LEFT){ //when the 'left arrow' is pressed the frog moves left by 40pixels.
      frog.hop(-40, 0);
    }
  }
}

class Car{ //sets car class
  color c; //sets car color (Specified under voidSetup.
  float xPos;
  float yPos;
  float xSpeed;

  Car(color c_, float xPos_, float yPos_, float xSpeed_){ //determines the color and direction of the cars movement
    c = c_;
    xPos = xPos_;
    yPos = yPos_;
    xSpeed = xSpeed_;
  }

  void display(){     
    pushStyle();
    rectMode(CENTER); //changes the point of movement to the center instead of upper lefthand corner.
    noStroke(); //applies no stroke
    fill(c); //color
    rect(xPos, yPos, 50, 25);//displays the cars x,y,sizeX,sizeY
    popStyle();
  }

  void move(){
    xPos = xPos + xSpeed; //sets the cars speed
    if(xPos > width + 20){
      xPos = 0;
    }
    if(xPos < -25){
      xPos = width + 10;
    }
    if((frog.frogY >= yPos && frog.frogY <= yPos + 25 && frog.frogX >= xPos && frog.frogX <= xPos+50) 
      || (frog.frogY + 20 >= yPos && frog.frogY + 20 <= yPos + 25 && frog.frogX + 20 >= xPos 
      && frog.frogX + 20 <= xPos + 50)){ //when the car comes in contact with the frog
      println("Your Dead!!");//the screen will print the line "Your Dead!"
      frog.frogX = 410;
      frog.frogY = 539;
    }  
  }
}

class Frog{ //sets frog class
  color c; //sets frog color
  float xChange;
  float yChange;
  float frogX;
  float frogY;
  float change;

  Frog(color c_, float frogX_, float frogY_, float change){ //sets frog parameters
    c = c_;
    frogX = frogX_;
    frogY = frogY_;
    change = change;
  }

  void display(){     
    pushStyle();
    noStroke(); //no stroke 
    fill(c); //sets fill color
    ellipse(frogX, frogY, 20, 20); //sets shape of frog, its starting postition and size
    popStyle();
  }

  void hop(float xChange, float yChange){ //allows the frog to hop
    frogX = frogX + xChange;
    frogY = frogY + yChange;
  }

  void boundary(){ //sets the boundaries of the frog so it doesnt go off the screen
    if(frogX + 10 >= width){ // right limit
      frogX = width - 10;
    }
    if(frogX - 10 <= 0){ // left limit
      frogX = + 10;
    }
    if(frogY >= height){ // lower limit
      frogY = height -10;
    }
    if(frogY <= 60){ // upper limit
      println("Congratulations! You Win!");//the screen will print the line "Congratulations! You Win!"
      frog.frogX = 410;
      frog.frogY = 539;
    }
  }
}

class Lanes{ //sets lane class
  String laneType; 
  int yPos;

  Lanes(String laneType_, int yPos_){
    laneType = laneType_;
    yPos = yPos_;
  }


  void display(){ 
    if(laneType.equals("road")){//if the laneType (coordinates with the sting) is called "road"
      fill(0);// then the fill will equal 0
      noStroke(); //no stroke applied
      rect(0, yPos, width, height/14); //sets the position and size of the lanes
    }
    if(laneType.equals("water")){ //if laneType equals "water"
      fill(25,25,112);//then the fill will be blue
      noStroke(); //no stroke applied
      rect(0, yPos, width, height/14);//sets the position and size of lane
    }
    if(laneType.equals("grass")){ //if laneType equals "grass"
      fill(34,139,34);//then the fill will be green
      noStroke(); // no stroke will be applied
      rect(0, yPos, width, height/14); //sets the position and size of lane.
    }
    if(laneType.equals("start_end")){ //if laneType equals "start_end"
      fill(160,32,240);//then the fill will be purple
      noStroke(); // no stroke will be applied
      rect(0, yPos, width, height/14); //sets the position and size of lane.
    }
    if(laneType.equals("title_score")){ //if laneType equals "title_score"
      fill(238,232,170);//then the fill will be purple
      noStroke(); // no stroke will be applied
      rect(0, yPos, width, height/14); //sets the position and size of lane.
    }
  }
}

class Log{ //sets log class
  color c;
  float logLength;
  float xPos;
  float yPos;
  float xSpeed;

  Log(color c_, float logLength_, float xPos_, float yPos_, float xSpeed_){
    //sets log parameters
    c = c_;
    logLength = logLength_;
    xPos = xPos_;
    yPos = yPos_;
    xSpeed = xSpeed_;
  }

  void display(){     
    pushStyle();
    rectMode(CENTER); //changes the point of movement to the center
    noStroke(); //no stroke applied
    fill(c); //color fill
    rect(xPos, yPos, logLength, 25); //applies the starting position and size of the logs
    popStyle();
  }

  void move(){ //allows the log to move accross the screen.
    xPos = xPos + xSpeed;
    if(xPos > width + 20){
      xPos = 0;
    }
    if(xPos < -25){
      xPos = width + 10;
    }
    if(
        (
        frog.frogY >= yPos && 
        frog.frogY <= yPos + 25 && 
        frog.frogX >= xPos && 
        frog.frogX <= xPos + logLength
        ) 
        || 
        (
        frog.frogY + 20 >= yPos && 
        frog.frogY + 20 <= yPos + 25 && 
        frog.frogX + logLength/2 >= xPos && 
        frog.frogX + logLength/2 <= xPos + logLength
        )
      )
        { //when the frog comes in contact with the log
        println("Your on a log!!");//the screen will print the line "Your on a log!"
        frog.frogX = frog.frogX + xSpeed;
    }         
    if(
        (
        frog.frogX < xPos && 
        frog.frogX > xPos + logLength
        ) 
      || 
        (
        frog.frogX + logLength/2 < xPos && 
        frog.frogX + logLength/2 > xPos + logLength
        )
      )
        { //when the frog misses or falls off the log
        println("You fell off and are dead!!");//the screen will print the line "You fell off and are dead!!"
        frog.frogX = 410;
        frog.frogY = 539;
    }     
  }
}





