
float posX = 56;
int counter = 0; // SET FIRST FRAME COUNTER
int counter2 = 0; // SET SECOND FRAME COUNTER

void setup() {
  size (457, 658);
  frameRate(5);
  smooth();
  noStroke();
  PImage bugs;
  bugs = loadImage("lightningbugs.jpg");
  image (bugs,0,0, 457, 658);
}




void draw() {


 {
   PImage bugs;
 bugs = loadImage("lightningbugs.jpg");
image (bugs,0,0, 457, 658);
 }

  counter++; // EVERY FRAME, ADD 1 TO FIRST FRAME COUNTER
  
  if (counter>2) { // WHEN IT REACHES 3,
    counter=0; // RESET THE FRAME COUNTER
    counter2++; // ADD 1 TO SECOND FRAME COUNTER - EVERY 5 FRAMES, FIRST COUNTER RESETS, SECOND COUNTER ADD 1

    if (counter2<3) { // AS LONG AS THE SECOND COUNTER IS LESS THAN 3, PRINT THE OBJECTS
      fill (#F1F525);
      ellipseMode(CORNER);
      ellipse(300, 500, 10, 10);

      fill (#F1F525);
      ellipseMode(CORNER);
      ellipse(200, 400, 17, 17);

      fill (#F1F525);
      ellipseMode(CORNER);
      ellipse(250, 300, 24, 24);


      fill (#F1F525);
      ellipseMode(CORNER);
      ellipse(320, 225, 38, 38);

      fill (#F1F525);
      ellipseMode(CORNER);
      ellipse(325, 375, 24, 24);

      fill (#F1F525);
      ellipseMode(CORNER);
      ellipse(150, 325, 17, 17);
      //x,y

      fill (#F1F525);
      ellipseMode(CORNER);
      ellipse(200, 228, 10, 10);
      
      fill (#F1F525);
      ellipseMode(CORNER);
      ellipse(250, 175, 17, 17);
      
       fill (#F1F525);
      ellipseMode(CORNER);
      ellipse(150, 170, 10, 10);  

    
    } 
    else { // IF THE SECOND COUNTER IS GREATER THAN 3, RESET IT AND CREATE THE PAUSE
      counter2=0; // THIS RESETS THE SECOND COUNTER TO 0 TO RESET THE LOOP
    }
   
    
  }
}


