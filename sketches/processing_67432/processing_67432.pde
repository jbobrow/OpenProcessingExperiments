
//Practice Code

//mouse drop
int dropX; 
int dropY; 



//on-off for ingredients going into bowl
boolean grab = false;

//this is in the bowl //outside owl
boolean isBowl = false;

//mouse/item
float ballX;
float ballY;

//moves the ball
float circX = 0.0;
float circY = 0.0;

//value of ball???
int ball = 100; 

//grab ball and moves it
boolean boxes = false;
boolean locked = false;

//the setup
void setup() {
  size(700, 700);
  ballX = width/2.0;
  ballY = height/2.0;
  rectMode(RADIUS);
}

//the shapes
void draw() {
  background(0);
  noStroke();
  smooth();
  fill(255);

  //mouse over the box
  if (mouseX > ballX - ball && mouseX < ballX + ball && mouseY > ballY - ball && mouseY < ballY + ball) {
    boxes = true;

    if (!locked) {
      stroke(255, 0, 0);
      fill(255);
    }
    else {
      stroke(255, 0, 255);
      fill(105);
      boxes = false;
    }
  }
  //shape ellipse(x, y, width, height) //test ingredients

  if (isBowl == false) {
    rect(ballX, ballY, ball, ball);
  }

  //test bowl
  rect(100, 100, 50, 50);
}

//clicking and holding the mouse/item
void mousePressed() {
  if (boxes) {
    locked = true;
    fill(255, 255, 0);
  }
  else {
    locked = false;
  }
  circX = mouseX - ballX;
  circY = mouseY - ballY;
}

//dragging the mouse/item to the place I want
void mouseDragged() {
  if (locked) {
    ballX = mouseX - circX;
    ballY = mouseY - circY;
  }
}

//dropping the mouse/item into the bowl
void mouseReleased() {
  locked = false;

  //distance to bowl //  //dist(x1, y1, x2, y2)
  float distance = dist(100, 100, mouseX, mouseY);

  if (distance <= ball) {
    isBowl = true;
    //more stuff needs to go here?!?!
  }

  println("X =" + ballX +"Y=" + ballY);
}


