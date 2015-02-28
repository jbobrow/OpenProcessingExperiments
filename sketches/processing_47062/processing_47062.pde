
// PVectors are like floats exept that they hold to points instead of one (x,y), a postiton!
PVector Pos, mousePos;

// You know what these are
float Mouth =0;
float change =1;
float rot = 0;
float rto = 0;
float speed =3;

int state =2;
int score = 0;

void setup() {
  //the size of the screen
  size(500,500);
  //PVectors
  Pos = new PVector(250,250);
  mousePos = new PVector(mouseX,mouseY);
  
  //feel free to put this smooth fuction in if you think your computer can handle it
 // smooth();
}



void draw() {
  background(0);
// ingnore this V, it's just some failed math
  // Pos.x += ((mouseX - Pos.x)/abs( mouseX -Pos.x)/100) *100 +0.01;
  // Pos.y += ((mouseY - Pos.y)/abs( mouseY -Pos.y)/100) *100 +0.01;
// ingnore this ^ 
  
  // sets a PVector for some math later
  mousePos.x = mouseX;
  mousePos.y = mouseY;
  
//a switch statement is like an if statement exept it has multiple different states
//depending on the number
  switch(state) {
    //case(0) is the game when it is running
    case(0):

    //checks to see which side the mouse cursor is on for math purposes
    if(mouseX <= Pos.x) rto = 180;
    else rto = 0;
    
// some rotatonal math
    rot = atan((Pos.y-mouseY)/(Pos.x-mouseX))+radians(rto);
    
// this makes the Chompy move towards the mouse cursor using more math
    Pos.x += speed*cos(rot);
    Pos.y += speed*sin(rot);
    speed += 0.01;
    
//  mouth animations
    if(Mouth > 78) change = -10;
    else if(Mouth <= 0) change =10;
    
//  checks to see if chompy ate the cursor yet. (Using more math).
    if(Pos.dist(mousePos) < 20) {
      noCursor(); // gets rid of the mouse cursor if it gets eaten
      Mouth = 0; // closes chompys mouth
      state =1; // sets the state of the game to 1 which ends the game
    } 
    else {// this is an else statement
      cursor(ARROW);// this makes your mouse cursor appear if it hasn't been eaten
      Mouth += change; // makes chompys mouth open and close
    }
//  score count and display
    score += 1;
    text("The score is " + score, 0,10);
// A break function is simply a statement that stops the code in the case() from
// continuing on for to long and just cuts to the end of the switch statment
    break;

    case(1):// case(1) is what happens after you get eaten
    // this displayes final score.
    text("The final score is " + score, 0,10);

//  game over text and a scale to make it bigger, simple
    scale(5);
    text("GAME OVER", 12,50);
    // this second scale is to prevent everything else from getting bigger
    scale(0.2);
    
    text("Press a key on the keyboard to retstart", 130,350);
    if(keyPressed) state = 2;//sets tells the game to go back to the starting 
    //                         screen if a key is pressed
    
// this break means that this is the end of the code that case(1) is soppoesed to run
    break;
    case(2):// case(2) oddly enough is what happens before the game starts
    //this resets some floats int and variables in case you decied to restart
    Pos.x = 250;
    Pos.y = 250;
    score = 0;
    speed = 3;
    cursor(ARROW);
    
    //this displays instructions
    text("click me to start",100,100);
    text("don't let Chompy eat your mouse",260,350);
    
    //this checks to see if the mouse is being pressed. If so start the game
    if(mousePressed) state =0;
    
    // break here means this is the end of case(2).
    break;
    
  }
  //and finaly we draw Chompy
  translate(Pos.x,Pos.y);
  rotate(rot);
  arc(0, 0, 40,40, radians(Mouth), radians(-Mouth +360));
  
  
}// end of draw function


