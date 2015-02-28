
PFont myChosenFont;
String Pass = "", password = "pong";
boolean matched = false;
float X_pos, Y_pos;  // tracks movement for the x & y positions of the ball    
float R_pad; 
float L_pad;
float x_speed ;
float y_speed;  
int X = 15;  // integer for paddle
int B = 195; // integer for paddle
int targetscore = 5;
int p1Score = 0;
int p2Score = 0;


void setup() {

  size(600, 400);
  background(0);
  myChosenFont = loadFont("CenturyGothic-Bold-48.vlw");
  textFont(myChosenFont, 15);
  smooth();
  noStroke();

  X_pos = width/2;    // the ball will start from here
  Y_pos = height/2;   // and from here
  x_speed = 1.9;
  y_speed = 1.3;
}

void draw() {

  background(259, 10, 157);
  text("Enter text here: " +  password, 0, height/2 - 20);
  X_pos +=x_speed;         // this will move the ball in along x axis
  Y_pos +=y_speed;         // this will move the ball in along y axis
  Password();
  texts();                 // this is a function to display name and score
  paddles();           // this is the function that will control the paddles
  borders();               // function to draw all the boarders
  objects();               // this is where i drew all the objects
  impact();             // this is the function that will hold all code for impacts
  winner();
}

void keyPressed()
{
           /* you do not need to say key.toString() in the processing application. You can just say:
           pass(String pass) += key;
           However, when uploading to openprocessing, you will need to use toString()
           */
  if (key != CODED)
    password += key;
  if(password.equalsIgnoreCase(password))
    matched = true;
}
 
void Password() {
  if(matched == true)
  {

  }
}

void texts() {
  textAlign(CENTER);
  text("PONG", width/2 +2, 25);

  textAlign(LEFT);
  text("Player 1 = ", 05, 20);
  text(p1Score, 80, 20);

  textAlign(RIGHT);
  text("Player 2 = ", width - 30, 20);
  text(p2Score, width - 20, 20);

}

void borders() {
  line(0, 30, width, 30);
  stroke(255);
  fill(255);
  line(0, height-2, width, height-2);
  fill(255);
  for(int i = 5; i<height; i+=5){        // for loop to draw the dotted center line
  ellipse (width/2,i,0.2,0.2);  
}
}

void objects() {

  strokeWeight(0);
  fill(0);
  rect(width-(X + 5), B, 10, 50);          //  right paddle
  rect(X, mouseY - 50, 10, 50);              //  left paddle
  ellipse(X_pos, Y_pos, 15, 15);        // game ball with x and y variables so that the ball will move
}

void paddles() {

  if ( X_pos > width -30 && X_pos < width -20 && Y_pos > mouseY - 50- X && Y_pos < mouseY - 50 +2 ) {
     L_pad = mouseY - 50;
     if (mouseY - 50 >= height - 80) {
     }
   }

  if (keyPressed) {
    
    if (key == 'o' || key == 'O')        // these are the keys im using to move paddle up on the right side
    {  
      R_pad  = B;
      B = B - 6;        //  this is the speed at which i have set my paddle. minus so it travels up
      if (B <= 30)         // if the paddle is < = to 30 it stops (boarder)
      {
        B = B + 6;    
      }
    }
  }
  
  if (keyPressed) {

    if (key == 'l' || key == 'L')
    {
      R_pad = B;
      B= B + 6;    // the + will move the paddle in a downward direction
      if (B >= height - 50)     // this will stop the paddle if it meets the height + 50(height of paddle)
      {
        B = height - 52;
      }
    }
  }
}


void impact() {
  
  if (X + 7 >= X_pos && (mouseY - 50 <= Y_pos && mouseY - 50 + 10 >= Y_pos)) {   // conditions if the ball meets paddle or boarder on the left side of the screen
    x_speed = -x_speed - 1;

    if (y_speed > 0 && L_pad > mouseY - 50) {
      y_speed  = -y_speed ;
    }
    else if (y_speed  < 0 && L_pad < mouseY - 50) {
      y_speed  = -y_speed ;
    }
  }
  
  if ((width - X)-6 <= X_pos && (B <= Y_pos && B+10 >= Y_pos)) {  // conditions if the ball meets paddle on right side of screen 
    x_speed  = (-x_speed - 1);

    if (y_speed > 0 && R_pad < B) {
      y_speed = -y_speed;
    }
    else if ( y_speed < 0 && R_pad < B) {
      y_speed =- y_speed;
    }
  }
  
  if (X + 7 >= X_pos && (mouseY - 50 + 10 < Y_pos && mouseY - 50 + 20 >= Y_pos)) {   // left side impacts
    x_speed = -x_speed - 1;

    if (y_speed > 0 && L_pad > mouseY - 50) {
      y_speed = -y_speed;
    }
    else if (y_speed < 0 && (L_pad < mouseY - 50)) {
      y_speed = -y_speed;
    }
  }
  
  if ((width - X) - 6 <= X_pos && (B + 10 < Y_pos && B + 20 >= Y_pos)) {    // right side impacts
    x_speed = -x_speed - 1;

    if ( y_speed > 0 && (R_pad < B )) {
      y_speed = -y_speed;
    }
    else if ( y_speed < 0 && (R_pad < B)) {
      y_speed = -y_speed;
    }
  }

  if ((X + 7 >= X_pos && (mouseY - 50+20 < Y_pos && mouseY - 50 + 30 >= Y_pos)))    // left side impacts
  {

    x_speed = -x_speed;

    if (y_speed > 0 && (L_pad > mouseY - 50))
    {
      y_speed = -y_speed;
    }
    else if (y_speed < 0 && (L_pad < mouseY - 50))
    {
      y_speed = -y_speed;
    }
  }
  
  if ((width-X)-6 <= X_pos && (B + 20 < Y_pos && B + 30 >=Y_pos))   // right side impacts
  {
    ;
    x_speed = -x_speed;
    if (y_speed > 0 && (R_pad > B))
    {
      y_speed = -y_speed;
    }
    else if (y_speed < 0 && (R_pad < B))
    {
      y_speed = -y_speed;
    }
  }


  if ((X + 7 >= X_pos && (mouseY - 50 + 30 < Y_pos && mouseY - 50 + 40 >= Y_pos)))    // left side impacts
  {

    x_speed = -x_speed + .20;
    if (y_speed > 0 && (L_pad > mouseY - 50))
    {
      y_speed = -y_speed;
    }
    else if (y_speed < 0 && (L_pad < mouseY - 50))
    {
      y_speed = -y_speed;
    }
  }
  
  if ((width-X)-6 <= X_pos && (B  +30 < Y_pos && B + 40 >= Y_pos))    // right side impacts
  {

    x_speed = -x_speed + 1;
    if (y_speed > 0 && (R_pad > B))
    {
      y_speed = -y_speed;
    }
    else if (y_speed < 0 && (R_pad < B))
    {
      y_speed = -y_speed;
    }
  }

  if ((X + 7 >=X_pos && (mouseY - 50 + 40 < Y_pos && mouseY - 50 + 50 >= Y_pos)))      // left side impacts
  {

    x_speed = -x_speed + 1;
    if (y_speed > 0 && (L_pad > mouseY - 50))
    {
      y_speed = -y_speed;
    }
    else if (y_speed < 0 && (L_pad < mouseY - 50))
    {
      y_speed = -y_speed;
    }
  }
  
  if ((width-X)-6 <= X_pos && (B + 40 < Y_pos && B + 50 >= Y_pos))     // right side impacts
  {

    x_speed = -x_speed - 1;
    if (y_speed > 0 && (R_pad > B))
    {
      y_speed = -y_speed;
    }
    else if (y_speed < 0 && (R_pad < B))
    {
      y_speed = -y_speed;
    }
  }

  if (Y_pos >= height-5 || Y_pos <= 35)   // If the ball if it comes into contact with the top or bottom boarder. - 5 on the bottom is so none of the ball goes outside the boarder.
  { 
    y_speed = -y_speed;        // this will reverse the speed
  }
  
  
  if (X_pos <= -5) {      //  If the ball goes below - 5  
     p2Score++;
     X_pos = width/2;       // the ball will reset at this point
     Y_pos = height/2;      // and this point
     x_speed = 2.9;
     y_speed = 1.7;
  }
  
  if (X_pos >= width + 5) {     // If the ball goes past width + 5 
     p1Score++;
     X_pos = width/2;          // the ball will reset to this point
     Y_pos = height/2;
     x_speed =  -2.9;        // this is negitive here so that the ball will shoot in a different direction depending who scores
     y_speed = 1.7;
     
     if (p2Score >= 3) {
      R_pad = B;
      B = B - 3;
      if (B <= 30)
      {
        B = B + 3;
      }
    }
  }
}

void winner() {
  if ( p1Score == targetscore) {
    

    x_speed = 0;
    y_speed = 0;
    text("Player 1 Wins!", width/2-10, height/2);
    text("Press X to play again, press Z to quit", (width/2)+20, (height/2)+20);
    if (keyPressed) {
      if ( key == 'x' || key == 'X') {  
      }
      if ( key == 'z' || key == 'Z') {
         exit();
      }
    }
  }
  if (p2Score == targetscore) {

    x_speed = 0;
    y_speed = 0;
    text("Player 2 Wins!", width/2-10, height/2);
    text("Press X to play again, press Z to quit", (width/2)+20, (height/2)+20);
    if (keyPressed) {
    if ( key == 'x' || key == 'X') {
    }
    if ( key == 'z' || key == 'Z') {
        exit();
      }
    }
  }
}
