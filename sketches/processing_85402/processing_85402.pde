
/* Andre Blyth
 rule 1. Objects are created by a Timer.
 rule 2. Collisions trigget events.
 rule 3. Mouse movement affects creation of objects.
 
 */

//vars
Squares[] squaresArray = new Squares[500];  //500 squares
int arrayIndex;
float sqColor1, sqColor2, sqColor3;
float startTime;
float c1xPos, c1yPos;
float c2xPos, c2yPos;
float c3xPos, c3yPos;
float c4xPos, c4yPos;
float c5xPos, c5yPos;
int cxdirection, cydirection;
float cxspeed, cyspeed;
PImage image01;
PImage image01emblem;
PImage image02;
PImage image02emblem;
PImage image03;
PImage image03emblem;
PImage image04;
PImage image04emblem;
int counter01, counter02, counter03, counter04;
int savecounter;


//end vars

//setup
void setup() {
  size (750, 750);
  background(0);
  rectMode(CENTER);
  smooth();
  frameRate(60);

  arrayIndex=0;

  //coordinates for circles
  c1xPos = 187;
  c2xPos = 562;
  c3xPos = 187;
  c4xPos = 562;
  c5xPos = 187;
  c1yPos = 187;
  c2yPos = 187;
  c3yPos = 562;
  c4yPos = 562;
  c5yPos = 187;

  //speed and direction for moving circle
  cxdirection =1;
  cydirection =1;
  cxspeed=random(4.0, 12.0);
  cyspeed=random(4.0, 14.0);

  //timers for circles 
  counter01 = 0;
  counter02 = 0;
  counter03 = 0;
  counter04 = 0;

  //save counter
  savecounter = 0;
}
//end setup

//draw
void draw() {
  //load image files
  image01=loadImage("01.png"); 
  image01emblem=loadImage("01emblem.png");
  image02=loadImage("02.png");
  image02emblem=loadImage("02emblem.png");
  image03=loadImage("03.png");
  image03emblem=loadImage("03emblem.png");
  image04=loadImage("04.png");
  image04emblem=loadImage("04emblem.png");
  //end load images

  //random colors
  sqColor1 = (mouseX/3);      //create number under 255
  sqColor2 = (mouseY/3);      // using mouse position.
  sqColor3 = random(0, 255);

  //background
  fill(sqColor3, sqColor2, sqColor1, 200);
  rect(375, 375, 750, 750);
  //second rectangle
  fill(random(255), random(255), random(255));
  rect(375, 375, 500, 500);
  //third rectangle
  fill(sqColor2, sqColor3, sqColor1, 100);
  rect(375, 375, 250, 250);
  //draw 4 circles
  fill(random(255), random(255), random(255));
  ellipse(c1xPos, c1yPos, 100, 100);
  ellipse(c2xPos, c2yPos, 100, 100);
  ellipse(c3xPos, c3yPos, 100, 100);
  ellipse(c4xPos, c4yPos, 100, 100);
  ellipse(c5xPos, c5yPos, 100, 100);

  ////keep moving circle inbounds
  if (c1xPos<50 || c1xPos>width-50) { 
    cxdirection = cxdirection*-1;
    c1xPos+=cxspeed*cxdirection;
  }
  c1xPos+=cxspeed*cxdirection;

  if (c1yPos<50 || c1yPos>height-50) { 
    cydirection = cydirection*-1;
    c1yPos+=cyspeed*cydirection;
  }
  c1yPos+=cyspeed*cydirection;
  //end circle inbounds

  // display an image in a random location when
  // moving circle intercepts one of the three
  // static circles. Timer goes up for each frame
  // moving circle is in static one.
  if (dist(c1xPos, c1yPos, c4xPos, c4yPos)<100) {
    rotate(random(PI));
    image(image01, random(width), random(height));
    counter01++;
  }
  if (dist(c1xPos, c1yPos, c2xPos, c2yPos)<100) {
    rotate(random(PI));
    image(image02, random(width), random(height));
    counter02++;
  }
  if (dist(c1xPos, c1yPos, c3xPos, c3yPos)<100) {
    rotate(random(PI));
    image(image03, random(width), random(height));
    counter03++;
  }
  if (dist(c1xPos, c1yPos, c5xPos, c5yPos)<100) {
    rotate(random(PI));
    image(image04, random(width), random(height));
    counter04++;
    println(counter04);
  }
  //end
  
  
  //if timer in each cirlce reaches 20, display emblem
  //like a trophy.
  if (counter01>20) {
    image(image01emblem, width/2-225, 50);
  }

  if (counter02>20) {
    image(image02emblem, width/2 - 125, 50);
  }

  if (counter03>20) {
    image(image03emblem, width/2+125, 50);
  }

  if (counter04>20) {
    image(image04emblem, width/2+225, 50);
  }
  //end
  
  //if all timers add up to 100, freeze loop
  if (counter01+counter02+counter03+counter04==100) {
    noLoop();
  }
  //end

  fill(sqColor1, sqColor2, sqColor3);



  //call squares
  for (int j=0; j<squaresArray.length; j++) {
    if (squaresArray[j]!=null) {
      squaresArray[j].display();
      squaresArray[j].rotateSquare();
      squaresArray[j].move();
    }
  }
}
//end draw

// mouse moved.
// When the mouse is moved, add squares to array.
void mouseMoved() {
  Squares mySquares;
  mySquares= new Squares(mouseX, mouseY, int(random(40)));
  if (arrayIndex<500) {
    squaresArray[arrayIndex]=mySquares;
    arrayIndex++;
  }
}
// end mouse moved.

// mouse pressed.
// when mouse is pressed, change frame rate to 1,
// slowing the sequence down for a second.
// if mouse is pressed after noloop is called,
// resume loop.
void mousePressed() {
  frameRate(1);
  if (counter01+counter02+counter03+counter04==100) {
    loop();
  }
}
// end mouse pressed.

// mouse released.
// after mouse is released, change frame rate
// back to 60.
void mouseReleased() {
  frameRate(60);
}
// end mouse released.

//If S key is hit, save a .tif file at current frame
void keyPressed() {
  if (key == 's' || key== 'S') {
    save("ThirdSketch"+savecounter+".tif");
    savecounter++;
  }
}
//end save

//end sketch.


