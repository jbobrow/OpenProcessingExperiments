
import ddf.minim.*;
Minim minim;//sound object
AudioSample yum, delicious, iLikeIt, chomp, ouch;//sound to be triggered when eating
PVector vel;
PVector food = new PVector();
PVector prevFood = null;
float radius = 25;//radius of snake segments
int score = 0;
int s = 9;//speed of the snake
boolean gameOver;
ArrayList<PVector> snake = new ArrayList<PVector>();
PVector foodLoc;
PVector newLoc, current;
int stepsUntilAdd;
boolean newSegmentNeeded;


void drawBorder() {
  stroke(0);
  rectMode(CENTER);
  rect(width/2, height/2, width-radius, height-radius);
}
//ensures drawFood() only draws one food particle
//technique derived from Endless Snake by Vinjn Zhang
void newFood() {
  float x = random(width-radius);
  float y = (int)random(height-radius);
  while (x <= radius ) {
    x = random(width-radius);
  }
  while (y <= radius) {
    y = random(height-radius);
  }
  food = new PVector(x, y);
  prevFood = food;
}

//draws food particles
void drawFood(PVector position) {
  fill(0, 0, 255);
  stroke(0);
  rectMode(CENTER);
  rect(position.x, position.y, radius, radius);
  fill(255);
}

PVector getSnakeHead() {
  return (PVector)snake.get(0);
}

PVector getTail() {
  return (PVector)snake.get(snake.size()-1);
}

void setup() {
  frameRate(16);
  size(400, 400);
  smooth();
  stepsUntilAdd = 0;
  newSegmentNeeded = false;
  //loads audio file
  minim = new Minim(this);
  //System.out.println("loading");
  yum = minim.loadSample("YUM.wav", 2048);
  //System.out.println("loaded Yum");
  //System.out.println("loading delicious");
  delicious = minim.loadSample("DELICIOUS.wav", 2048);
  //System.out.println("loaded delicious");
  //System.out.println("loading ilikeit");
  iLikeIt = minim.loadSample("ILIKEIT.wav", 2048);
  //System.out.println("loaded ilikeit");
  //System.out.println("loading chomp");
  chomp = minim.loadSample("CHOMP.wav", 2048);
  //System.out.println("loaded chomp");
  //System.out.println("loading ouch ");
  ouch = minim.loadSample("OUCH.wav", 2048);
  //System.out.println("loaded ouch");
  //initial food particle
  newFood();
  //initial snake head's location
  snake.add(new PVector(width/4, height/4));

  //at game start, snake moves right
  vel = new PVector(s, 0);
}

void draw() {
  boolean debug = true;
  if (! gameOver) {
    background(0);
    drawBorder();   


    //if(debug) println(" steps until add = " + stepsUntilAdd + "new needed = " + newSegmentNeeded + " new Loc " + newLoc);  
    //update # steps left until we add last segment of body
    if ( stepsUntilAdd > 0 ) stepsUntilAdd--;

    if ( stepsUntilAdd == 0 && newSegmentNeeded ) {
      snake.add( newLoc );
      newLoc = null;
      newSegmentNeeded = false;
    }

    //only draws food once, until eaten
    if (prevFood != null) {
      drawFood(food);
    }


    //draws the head and changes direction
    //updates the snake segments
    for (int i = snake.size() - 1 ; i >= 0 ; i-- ) {
      //head position update determined by velocity vector
      current = (PVector)snake.get(i);
      if ( i == 0 ) { //current is head of snake
        //print("updating head's location from " + current + " to");
        current.add(vel);
        //println(" " + current);
      }
      else {
        //update position according to (i-1)'s position
        PVector next = (PVector) snake.get(i-1);
        //PVector prev = (PVector)snake.get(i-1);
        current.x= next.x;
        current.y= next.y;
      }
    }
    //for(PVector p : snake ) {
    //  println(p);
    //}
    //println();println();


    //for loop to draw snake -- in REVERSE
    for (int i = snake.size()-1; i >=0; i--) {
      fill(0, 255, 0);
      noStroke();
      //stroke(0);
      ellipseMode(CENTER);
      PVector current = (PVector)snake.get(i);
      ellipse(current.x, current.y, radius, radius);
      fill(255);
    }



    checkCollision();

    //checks to see if food particle is close enough to be eaten
    if ( getSnakeHead().dist(food) < radius) {
      //defer for now:
      //snake.add(new PVector(head.x, head.y));
      newSegmentNeeded = true;
      if (newLoc == null)
        newLoc = new PVector(getTail().x, getTail().y);
      stepsUntilAdd = s; //draw called this many times before we add.
      newFood();
      score++;       
      //triggers random audio clip
      int random = (int) (Math.random()*4);
      //System.out.println(random);      
      if (random == 0) {
        yum.trigger();
      }
      else if (random == 1) {
        delicious.trigger();
      }
      else if (random == 2) {
        chomp.trigger();
      }
      else if (random == 3) {
        iLikeIt.trigger();
      }
    }
    else {
      drawFood(food);
    }
  }
  else {//game over and score is displayed.
    fill(0);
    textAlign(CENTER);
    PFont font1;
    font1 = loadFont("Algerian-48.vlw");
    textFont(font1, 48);
    text("Game Over", width/2, height/2);

    PFont font2;
    font2 = loadFont("Algerian-20.vlw");
    textFont(font2, 20);
    text("Press ENTER to Restart", width/2, height/1.5);
    text("SCORE: " + score, width/2, height/4);

    //reset game when clicked, only works in processing program
    //since cannot call the setup() method twice in openprocessing.org.

    //if (keyPressed) {
      if (key == ENTER) {
        gameOver = false;
        score = 0;
        for ( int i = snake.size()-1; i >= 0; i-- ) {
          snake.remove(i);
        }
        newFood(); 
        snake.add(new PVector(width/4, height/4));
        vel = new PVector(s, 0);  
        redraw();
      }
    }
  //}
}

void keyPressed() {
  //ensures that the snake only moves in 90 degree movements
  if (vel.y == 0) {
    if (key == 'w') {
      //move upwards
      vel = new PVector(0, -s);
    }
    else if (key == 's') {
      //move downwards
      vel = new PVector(0, s);
    }
  }
  else if (vel.x == 0) {
    if (key =='d') {
      //move to the right
      vel = new PVector(s, 0);
    }
    else if ( key == 'a') {
      //move to the left
      vel = new PVector(-s, 0);
    }
  }
}

//checks to see if snake's head hits the wall or other body parts
//precondition:  gameOver = false
void checkCollision() {
  PVector head = getSnakeHead();
  PVector north = new PVector(width, radius);
  PVector east = new PVector(width-radius, height);
  PVector south = new PVector(width, height-radius);
  PVector west = new PVector (radius, height);
  //boolean debug = true;

  //if ( debug ) println("curLen = " + snake.size() );

  if (head.x <= west.x || head.x >= east.x || head.y <= north.y || head.y >= south.y) {
    gameOver = true;
    ouch.trigger();
    //if ( debug ) println("collided with wall!");
    return;
  }

  //see if there's a collision btwn head and body segment (at least 4 units back)
  if ( snake.size() > 6) {  //min last index must be 5
    for ( int i = 6 ; i < snake.size() ; i++ ) {
      //if ( debug ) {
      //println("head loc = " + head + "; curLoc = " + snake.get(i));
      //}
      if ( head.dist(snake.get(i)) < radius ) {
        //if ( debug ) println("ouch, HEAD COLLISION!" + snake.size());
        gameOver = true;
        ouch.trigger();
        return;
      }
    }
    //gameOver state not changed, continue
    return;
  }
  //if ( debug ) println("fall-through case, continue game..."); 
  gameOver = false;
}

//ends the audio clips after they have been triggered
void stop() {
  ouch.close();
  yum.close();
  delicious.close();
  chomp.close();
  iLikeIt.close();
  minim.stop();

  super.stop();
}  


