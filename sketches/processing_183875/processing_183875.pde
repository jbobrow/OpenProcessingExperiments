
/*  
 item_collecting2
 Game Building Blocks for Processing
 (c) 2014 Brad Tober [http://www.bradtober.com]
 Licensed under The MIT License
 */

/* @pjs preload="sheep.png,fence.png,shepherd.png,title.png"; */
PImage sheep;
PImage fence;
PImage shepherd;
PImage title;
PImage gameover;
boolean menu = true;
boolean playing = false;
int startTime;
int score = 0;
boolean lose = false;

boolean shape1 = true;                                           // whether shape1 is visible or not
boolean shape2 = true;                                           // whether shape2 is visible or not
boolean shape3 = true;                                           // whether shape3 is visible or not
boolean shape4 = true;
boolean shape5 = true;
boolean shape6 = true;

boolean carryingShape1 = false;                                  // whether shape1 has been picked up
boolean carryingShape2 = false;                                  // whether shape1 has been picked up
boolean carryingShape3 = false;                                  // whether shape1 has been picked up
boolean carryingShape4 = false;
boolean carryingShape5 = false;
boolean carryingShape6 = false;

float divY = 320 ;                                               // y position of divider line; the collecting container is below this   
float divX = 180 ;
float x1, x2, x3, x4, x5, x6, y1, y2, y3, y4, y5, y6;                                                                  // x and y positions of shapes
float x1speed, x2speed, x3speed, x4speed, x5speed, x6speed, y1speed, y2speed, y3speed, y4speed, y5speed, y6speed;      // x and y speeds of shapes
int radius = 30;                                                 // radius of shapes
int shapeCount = 0;                                              // counter to track how many shapes have been collected




void setup() {
  size(800, 500);
  smooth();
  noStroke();

  x1 = random(0, width - radius * 2);                            // set random initial x position for shape1
  x2 = random(0, width - radius * 2);                            // set random initial x position for shape2
  x3 = random(0, width - radius * 2);                            // set random initial x position for shape3
  x4 = random(0, width - radius * 2);
  x5 = random(0, width - radius * 2);
  x6 = random(0, width - radius * 2);
  y1 = random(0, divY - radius * 2);                             // set random initial y position for shape1
  y2 = random(0, divY - radius * 2);                             // set random initial y position for shape2
  y3 = random(0, divY - radius * 2);                             // set random initial y position for shape3
  y4 = random(0, divY - radius * 2);
  y5 = random(0, divY - radius * 2);
  y6 = random(0, divY - radius * 2);
  x1speed = random(2.5, 1.5);                                     // set random x speed for shape1
  x2speed = random(2.5, 1.5);                                     // set random x speed for shape2
  x3speed = random(2.5, 1.5);                                     // set random x speed for shape3
  x4speed = random(2.5, 1.5);
  x5speed = random(2.5, 1.5);
  x6speed = random(2.5, 1.5);
  y1speed = random(2.5, 1.5);                                     // set random y speed for shape1
  y2speed = random(2.5, 1.5);                                       // set random y speed for shape2
  y3speed = random(2.5, 1.5);                                     // set random y speed for shape3
  y4speed = random(2.5, 1.5);
  y5speed = random(2.5, 1.5);
  y6speed = random(2.5, 1.5);

  println("Grab all three shapes with your mouse pointer and move them to the pen to win!");

  sheep = loadImage ("sheep1.png");
  fence = loadImage ("fence1.png");
  shepherd = loadImage ("shepherd2.png");
  title = loadImage ("menu.png");
  gameover = loadImage ("gameover.png");
}

void draw() {
  background(135, 175, 63);

  fill(192);
  image(fence, 0, divY, 200, height - divY);
  fill(18);


  if (menu) {
    playing = false;
    lose = false;
    image(title, 0, 0, 800, 500);
    if ((keyPressed == true) && (keyCode == SHIFT)) {
      playing = true;
      startTime = millis();
    }
  }
  if (playing) {
    lose = false;
    menu = false;



    for (int i = 0; i < shapeCount; i++) {
      // image(sheep, ((i + 1) * 25) + radius + (i * (radius * 2)), divY + 50, radius * 2, radius * 2);  // draw collected shapes in the container
      if (i < 3) {
        image(sheep, i*radius*2, divY+50);
      } else {
        image(sheep, (i-3)*radius*2, (divY+50)+(radius*2));
      }
    }


    if (shape1) {                                                  // if shape1 is visible
      if (carryingShape1) {
        image(sheep, mouseX, mouseY, radius * 2, radius * 2);           // draw shape1 at mouse pointer
      } else {
        sheep = loadImage("sheep1.png");
        image(sheep, x1, y1, radius * 2, radius * 2);                   // draw shape1
      }
      if (mouseX > x1 - radius && mouseX < x1 + radius && mouseY > y1 - radius && mouseY < y1 + radius && !carryingShape1 && !carryingShape2 && !carryingShape3 && !carryingShape4 && !carryingShape5 && !carryingShape6) {              // if the mouse pointer intersects shape1 and a shape isn't already being carried
        carryingShape1 = true;                                     // player is now carrying shape1
      }
      x1 += x1speed;                                               // change the x position of shape1 using its speed value
      if (x1 > width - radius || x1 < radius) {                    // if shape1 hits the right or left side of the window
        x1speed = -x1speed;                                        // invert the x speed of shape1 (change its horizontal direction)
      }
      y1 += y1speed;                                                    // change the y position of shape1 using its speed value
      if (y1 > divY - radius || y1 < radius) {                         // if shape1 hits the bottom or top of the window
        y1speed = -y1speed;                                            // invert the y speed of shape1 (change its vertical direction)
      }
    }
    if (shape2) {                                                      // if shape2 is visible
      if (carryingShape2) {
        image(sheep, mouseX, mouseY, radius * 2, radius * 2);           // draw shape2 at mouse pointer
      } else {
        image(sheep, x2, y2, radius * 2, radius * 2);                   // draw shape2
      }
      if (mouseX > x2 - radius && mouseX < x2 + radius && mouseY > y2 - radius && mouseY < y2 + radius && !carryingShape1 && !carryingShape2 && !carryingShape3 && !carryingShape4 && !carryingShape5 && !carryingShape6) {              // if the mouse pointer intersects shape2 and a shape isn't already being carried
        carryingShape2 = true;                                     // player is now carrying shape2
      }
      x2 += x2speed;                                               // change the x position of shape2 using its speed value
      if (x2 > width - radius || x2 < radius) {                    // if shape2 hits the right or left side of the window
        x2speed = -x2speed;                                        // invert the x speed of shape2 (change its horizontal direction)
      }
      y2 += y2speed;                                               // change the y position of shape2 using its speed value
      if (y2 > divY - radius || y2 < radius) {                   // if shape2 hits the bottom or top of the window
        y2speed = -y2speed;                                        // invert the y speed of shape2 (change its vertical direction)
      }
    }
    if (shape3) {                                                  // if shape3 is visible
      if (carryingShape3) {
        image(sheep, mouseX, mouseY, radius * 2, radius * 2);           // draw shape3 at mouse pointer
      } else {
        image(sheep, x3, y3, radius * 2, radius * 2);                   // draw shape3
      }
      if (mouseX > x3 - radius && mouseX < x3 + radius && mouseY > y3 - radius && mouseY < y3 + radius && !carryingShape1 && !carryingShape2 && !carryingShape3 && !carryingShape4 && !carryingShape5 && !carryingShape6) {              // if the mouse pointer intersects shape3 and a shape isn't already being carried
        carryingShape3 = true;                                     // player is now carrying shape3
      }
      x3 += x3speed;                                               // change the x position of shape3 using its speed value
      if (x3 > width - radius || x3 < radius) {                    // if shape3 hits the right or left side of the window
        x3speed = -x3speed;                                        // invert the x speed of shape3 (change its horizontal direction)
      }
      y3 += y3speed;                                               // change the y position of shape3 using its speed value
      if (y3 > divY - radius || y3 < radius) {                   // if shape3 hits the bottom or top of the window
        y3speed = -y3speed;                                        // invert the y speed of shape3 (change its vertical direction)
      }
    }

    if (shape4) {                                                      // if shape4 is visible
      if (carryingShape4) {
        image(sheep, mouseX, mouseY, radius * 2, radius * 2);           // draw shape4 at mouse pointer
      } else {
        image(sheep, x4, y4, radius * 2, radius * 2);                   // draw shape4
      }
      if (mouseX > x4 - radius && mouseX < x4 + radius && mouseY > y4 - radius && mouseY < y4 + radius && !carryingShape1 && !carryingShape2 && !carryingShape3 && !carryingShape4 && !carryingShape5 && !carryingShape6) {              // if the mouse pointer intersects shape4 and a shape isn't already being carried
        carryingShape4 = true;                                     // player is now carrying shape4
      }
      x4 += x4speed;                                               // change the x position of shape4 using its speed value
      if (x4 > width - radius || x4 < radius) {                    // if shape4 hits the right or left side of the window
        x4speed = -x4speed;                                        // invert the x speed of shape2 (change its horizontal direction)
      }
      y4 += y4speed;                                               // change the y position of shape2 using its speed value
      if (y4 > divY - radius || y4 < radius) {                     // if shape4 hits the bottom or top of the window
        y4speed = -y4speed;                                        // invert the y speed of shape2 (change its vertical direction)
      }
    }

    if (shape5) {                                                      // if shape5 is visible
      if (carryingShape5) {
        image(sheep, mouseX, mouseY, radius * 2, radius * 2);           // draw shape5 at mouse pointer
      } else {
        image(sheep, x5, y5, radius * 2, radius * 2);                   // draw shape5
      }
      if (mouseX > x5 - radius && mouseX < x5 + radius && mouseY > y5 - radius && mouseY < y5 + radius && !carryingShape1 && !carryingShape2 && !carryingShape3 && !carryingShape4 && !carryingShape5 && !carryingShape6) {              // if the mouse pointer intersects shape4 and a shape isn't already being carried
        carryingShape5 = true;                                     // player is now carrying shape5
      }
      x5 += x5speed;                                               // change the x position of shape4 using its speed value
      if (x5 > width - radius || x5 < radius) {                    // if shape5 hits the right or left side of the window
        x5speed = -x5speed;                                        // invert the x speed of shape5 (change its horizontal direction)
      }
      y5 += y5speed;                                               // change the y position of shape5 using its speed value
      if (y5 > divY - radius || y5 < radius) {                     // if shape4 hits the bottom or top of the window
        y5speed = -y5speed;                                        // invert the y speed of shape5 (change its vertical direction)
      }
    }

    if (shape6) {                                                      // if shape6 is visible
      if (carryingShape6) {
        image(sheep, mouseX, mouseY, radius * 2, radius * 2);           // draw shape6 at mouse pointer
      } else {
        image(sheep, x6, y6, radius * 2, radius * 2);                   // draw shape6
      }
      if (mouseX > x6 - radius && mouseX < x6 + radius && mouseY > y6 - radius && mouseY < y6 + radius && !carryingShape1 && !carryingShape2 && !carryingShape3 && !carryingShape4 && !carryingShape5 && !carryingShape6) {              // if the mouse pointer intersects shape4 and a shape isn't already being carried
        carryingShape6 = true;                                     // player is now carrying shape4
      }
      x6 += x6speed;                                               // change the x position of shape4 using its speed value
      if (x6 > width - radius || x6 < radius) {                    // if shape4 hits the right or left side of the window
        x6speed = -x6speed;                                        // invert the x speed of shape6 (change its horizontal direction)
      }
      y6 += y6speed;                                               // change the y position of shape6 using its speed value
      if (y6 > divY - radius || y6 < radius) {                     // if shape6 hits the bottom or top of the window
        y6speed = -y6speed;                                        // invert the y speed of shape6 (change its vertical direction)
      }
    }


    if (mouseY > divY && mouseX < divX) 

    {
      if (carryingShape1) {
        shape1 = false;                                            // hide shape1 because it has been collected
        shapeCount++;                                              // increase the number of shapes collected
        carryingShape1 = false;
      }
      if (carryingShape2) {
        shape2 = false;                                            // hide shape2 because it has been collected
        shapeCount++;                                              // increase the number of shapes collected
        carryingShape2 = false;
      }  
      if (carryingShape3) {
        shape3 = false;                                            // hide shape3 because it has been collected
        shapeCount++;                                              // increase the number of shapes collected
        carryingShape3 = false;
      }  

      if (carryingShape4) {
        shape4 = false;                                            // hide shape4 because it has been collected
        shapeCount++;                                              // increase the number of shapes collected
        carryingShape4 = false;
      } 

      if (carryingShape5) {
        shape5 = false;                                            // hide shape5 because it has been collected
        shapeCount++;                                              // increase the number of shapes collected
        carryingShape5 = false;
      } 

      if (carryingShape6) {
        shape6 = false;                                            // hide shape6 because it has been collected
        shapeCount++;                                              // increase the number of shapes collected
        carryingShape6 = false;
      }
    }
  }
  fill(0);
  image(shepherd, mouseX, mouseY, 50, 50);                        // draw the collector at the mouse pointer location

  if (shapeCount < 6) {                                          // if fewer than 3 shapes have been collected
    text("Items collected: " + shapeCount, 10, 20);              // display the number of shapes collected
  } else { 
    image(gameover, 0, 0, 800, 500);      // otherwise the player wins
    lose = true;
  }


  if (lose) {
    playing = false;
    menu = false;
    if ((keyPressed == true) && (keyCode == SHIFT)) {
      lose = false;
      playing = true;
      startTime = millis();
      shapeCount = 0;
      shape1 = true;
      shape2 = true;
      shape3 = true;
      shape4 = true;
      shape5 = true;
      shape6 = true;
      println("lose");
    }
  }
}


