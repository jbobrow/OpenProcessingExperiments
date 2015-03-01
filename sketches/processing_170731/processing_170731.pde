
//declares a variable for the timer
float timer1 = 0;
float timer2 = 0;
float delay1 = 1000/12f;
float delay2 = 10/1f;
float circle = 100; //sets circle variable which is used as the width and height to form a circle 

int score = 0; //sets score 

boolean  clicked = true;


void setup() {
  size(400, 400); //sets screen size
}
 //speed the black circles will be drawn at
void draw() {
  if (millis() > timer1) {
    drawRandomCircles();
    timer1+=delay1; //timer
  }


  fill(0, 79, 250); //color of text 
  textSize(15);
  text("score = " + score, 10, 10); //score board

if (score == 20) { //checks if the score is 20
  noLoop();
  textSize(100);
  text("End Of Game",100, 200); //when score is 20, end of game will print
  
}
else {
  loop();
}

  if (mousePressed == true) {//checking for the action of the mouse being pressed 
    fill(255, 0, 0);
    ellipse(random(0, width), random(0, height), circle, circle); //red circles appear when mouse is pressed
  } else if (keyPressed == true ) {
    background(255);
    score = 0; //restart game
  }
}

void drawRandomCircles() { 
  fill(0);
  ellipse(random(0, width), random(0, height), circle, circle);
}


void mousePressed() {
  if ( clicked = true ) {
    score = score + 1; //when mouse pressed, score increase by 1
    if (millis() > timer2) {             //timer 2
      timer2+=delay2; 
    }
  }
}



