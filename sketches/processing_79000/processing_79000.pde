
// Creative Coding - Assignment 2
// 15. November 2012
// Jana Heyden
//
// Report: http://jana.creativetechnologies.info/2012/11/14/cc_assignment2/
//
//
//////////////////////////////////////////////////////////////////////////////////



//// GLOBAL VARIABLES ////
int x = int(random(30,670));       // random x-coordinate of ball
int y = int(random(30,670));       // random y-coordinate of ball
int speedX = int(random(8,16));   // random speed of ball
int speedY= int(random(8,16));    // random speed of ball
int ballSizeX = 120;               // global variable for changing size
int ballSizeY = 120;               // global variable for changing size
boolean nosecolor = false;         // global variable for changing nose color


void setup(){
  size(700,700);  // window size
  smooth();
}

void draw(){
  background(255);   // background color = white
  drawrudolph();     // function which draws the face
  switchcolor();     // function for switching Rudolphs nose color
  drawball();        // function which draws the ball
  hitball();         // function for what happens when the mouse touches the moving ball
  drawbackground();  // function for creating the background
  drawtext();        // creates the infotext
}


//// FUNCTIONS ////
void drawbackground(){
  ellipseMode(CENTER);      // background balls
  fill(255,100,20);         // red ball
  ellipse(60,150,230,230);
  fill(50,100,20);          // green ball
  ellipse(200,600,80,80);
  fill(138,39,220);         // purple ball
  ellipse(650,200,150,150);
  fill(60,2,230);           // info ball for keyPressed function
  ellipse(500,610,300,300);
  // Info
  fill(255);                                // font color is white
  PFont font;                               // new variable 
  font = loadFont("Verdana-15.vlw");        // font = Verdana
  textFont(font, 15);                       // font size
  text("To minimize the speed of the  ", 390,630);  // text
  text("ball click somewhere and ", 390,650);
  text("press ENTER", 390, 670);
  fill(0);
}

void drawtext(){
  fill(255);                                // font color is white
  PFont font;                               // new variable 
  font = loadFont("Verdana-15.vlw");        // font = Verdana
  textFont(font, 15);                       // font size
  text("Go and catch the",20,100);            // text
  text("red ball!!",20,120);
  text("Touch it with", 20, 160);
  text("the mouse ", 20, 180);
  text("until it",20,200);
  text("disappears!", 20, 220);
}

void drawrudolph(){                   // function which contains all elements of Rudolph's face
  noStroke();                         // no outline for all elements
  fill(194,147,74);                   // light brown color
  ellipse(mouseX-40,mouseY-40,46,21); // left ear
  ellipse(mouseX,mouseY-10,85,120);   // head
  ellipse(mouseX+40,mouseY-40,46,21); // right ear
  fill(130,100,50);                   // dark brown color
  ellipse(mouseX,mouseY-10,55,90);    // face
  fill(194,147,74);                   // light brown color
  ellipse(mouseX,mouseY+30,130,70);   // nose
  fill(0);                            // black color
  ellipse(mouseX-10,mouseY-25,13,23); // left eye
  ellipse(mouseX+9,mouseY-25,13,23);  // right eye
}

void keyPressed(){
  if(key == ENTER){
     speedX = speedX/2;
     speedY = speedY/2;
  }
}
  
void switchcolor(){                   // function for switching nose color
  if (nosecolor){                     // if nosecolor == true do this...
    fill(mouseX,0,mouseY);            // nose in random color
    ellipse(mouseX,mouseY+30,90,40);  // random colored nose
  } else {                            // if nosecolor == false do this ...
    fill(200,20,20);                  // nose is red
    ellipse(mouseX,mouseY+30,90,40);  // red nose
  }  
  // button
  fill(157,235,250);
  rect(400,30,260,40,10);
  fill(0);
  // button text
  PFont font;
  font = loadFont("Verdana-15.vlw");
  textFont(font, 15);
  text("Click here to change nose colour", 412,55);
}


void mouseClicked(){  // function to switch the button = switch nose color
  if (mouseX > 400 && mouseX < 660 && mouseY > 30 && mouseY < 70){ // field which activates the function
    nosecolor = !nosecolor; // switches the button when mouse is clicked 
  }
}


void drawball(){                     // function which draws a ball
  fill(200,20,20);                   // color of the ball
  noStroke();
  ellipseMode(CENTER);               // parameters of the ball
  ellipse(x,y,ballSizeX,ballSizeY);  // x and y are random values, the value of the size is inside a variable
}
  

void hitball(){                           // function for changing ball size when the mouse hits the ball
  x = x + speedX;                         // moves the ball in  x direction with a random speed
  y = y + speedY;                         // moves the ball in  y direction with a random speed
  if ((x > width -30) || (x < 0 +30)){    // if the ball touches a border of the window it turns back
    speedX = speedX * -1;                 
  }
  if ((y > height -30) || (y < 0 +30)){
    speedY = speedY * -1;
  } 
  if (mouseX <= x+ballSizeX/3 && mouseX >= x-ballSizeX/3 && mouseY <= y+ballSizeY/3 && mouseY >= y-ballSizeY/3){
                                          // if mouse touches the center of the ball, the size of the ball will be minimized
    ballSizeX = ballSizeX - 20;
    ballSizeY = ballSizeY - 20;
  } 
  if (ballSizeX == 0){                    // if the ball is gone (size = 0) 
     PFont font;                          // this text is displayed then
     font = loadFont("Verdana-15.vlw");
     textFont(font, 15);
     text("You did it! Congratulations!", 270,355);
  } 
    fill(0);
    PFont font;
    font = loadFont("Verdana-15.vlw");
    textFont(font, 15);  
    
  // to check if function works  
  //  text("Speed X " +speedX, 20, 300);          // prints out the value od the speed variable X
  //  text("Speed Y " +speedY, 20, 320);          // prints out the value od the speed variable Y
   
}



 


