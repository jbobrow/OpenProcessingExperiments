
// UCLA DMA INTERACTIVITY - SUMMER 2012 
// Michael Honhongva
// August 5, 2012 - Project 2 (REVISED)

// DODGE
// Use your mouse to avoid the red ellipses while accumulating points for surviving. Click to continue or restart the game. 
// The screen "FASTER" will cause the ellipses to move faster, be warned 
// Red loses
// Black adds 30 points
// Grey slows the speed

PFont font;
PFont font350;

float speed = random(3, 5); // initial speed
int level = 0;
int last_level = 1;         // game duration
int mode = 0; 
float maxDistance;
float time = 0;
int score = 0;

float cursorX, cursorY;     // white cursor
float cursorRad = 10;
 
float ell1X = 25;    // red (lose)
float ell1Y = 25;
float ell1R = 25;
float ell2X = 25;
float ell2Y = 25;
float ell2R = 25;
float ell3X = 25;
float ell3Y = 25;
float ell3R = 25;
float ell4X = 25;
float ell4Y = 25;
float ell4R = 25;
float ell5X = 25;
float ell5Y = 25;
float ell5R = 25;
float ell6X = 25;
float ell6Y = 25;
float ell6R = 25;
float ell7X = 20;    // black (+30 points)
float ell7Y = 20;
float ell7R = 20;
float ell8X = 20;
float ell8Y = 20;
float ell8R = 20;
float ell9X = 10;    // grey (decrease speed)
float ell9Y = 10;
float ell9R = 10;
float ell10X = 10;   
float ell10Y = 10;
float ell10R = 10;

void setup() {
  size(800, 480);
  ellipseMode(RADIUS);
  font = loadFont("ko150.vlw");
  font350 = loadFont("ko350.vlw");
  noStroke();
  smooth();
  maxDistance = dist(0, 0, width, height);
}

/*  
0 - start
1 - play
2 - final
*/

// mouse 
void mousePressed() {
  if (mode == 0)    {
    mode = 1;       }
}

void draw() {
    background(200);

// start
  if (mode == 0) {
    score = 0;
    
    for (int i = 0; i <= width; i += 25) {                        // all of these are for background ellipse
    for (int j = 0; j <= height; j += 25) {
    float mouseDist = dist(mouseX, mouseY, i, j);
    float diameter = (mouseDist / maxDistance) * 7.5;    
    ellipse(i, j, diameter, diameter);  
    }}
    textFont(font350);   
    textAlign(CENTER);
    fill(250, 0, 0);
    text("DODGE", 400, 350);    
  }

// play
  else if (mode == 1) { 
    time = time;
    score = score + 1;

    cursorX = mouseX;
    cursorY = mouseY;
    
  // RED - LOSE
  if ((circleCircleIntersect(ell1X, ell1Y, ell1R, cursorX, cursorY, cursorRad)) || (circleCircleIntersect(ell2X, ell2Y, ell2R, cursorX, cursorY, cursorRad)) ||
     (circleCircleIntersect(ell3X, ell3Y, ell3R, cursorX, cursorY, cursorRad))  || (circleCircleIntersect(ell4X, ell4Y, ell4R, cursorX, cursorY, cursorRad)) ||
     (circleCircleIntersect(ell5X, ell5Y, ell5R, cursorX, cursorY, cursorRad))  || (circleCircleIntersect(ell6X, ell6Y, ell6R, cursorX, cursorY, cursorRad))  == true) 
     {
     fill(20);                 // final text - lose
     mode = 2;                 // mode 1  
  }  else {
     background(200);
     
  // BLACK - PLUS SCORE
  { 
  if ((circleCircleIntersect(ell7X, ell7Y, ell7R, cursorX, cursorY, cursorRad)) || (circleCircleIntersect(ell8X, ell8Y, ell8R, cursorX, cursorY, cursorRad))  == true)    
  {
     score +=30;
     
  // GREY - SLOW SPEED
  { 
  if ((circleCircleIntersect(ell9X, ell9Y, ell9R, cursorX, cursorY, cursorRad)) || (circleCircleIntersect(ell10X, ell10Y, ell10R, cursorX, cursorY, cursorRad)) == true)    
  {
  speed -= 0.1;
  }}}    
  
  for (int i = 0; i <= width; i += 25) {
  for (int j = 0; j <= height; j += 25) {
  float mouseDist = dist(mouseX, mouseY, i, j);
  float diameter = (mouseDist / maxDistance) * 7.5;
  ellipse(i, j, diameter, diameter);
  
  fill(250);
  textFont(font);
  text("" + score, 700, 450);   
  }}
  // SHAPES
  fill(255, 0, 0);                                          // red
  ellipse(ell1X, ell1Y, ell1R, ell1R);
  ellipse(ell2X, ell2Y, ell2R, ell2R);
  ellipse(ell3X, ell3Y, ell3R, ell3R);
  ellipse(ell4X, ell4Y, ell4R, ell4R);
  ellipse(ell5X, ell5Y, ell5R, ell5R);
  ellipse(ell6X, ell6Y, ell6R, ell6R);
  fill(20);                                                 // black
  ellipse(ell7X, ell7Y, ell7R, ell7R);
  ellipse(ell8X, ell8Y, ell8R, ell8R);
  fill(200);                                                // grey
  strokeWeight(1.5);
  stroke(20);
  ellipse(ell9X, ell9Y, ell9R, ell9R);
  ellipse(ell10X, ell10Y, ell10R, ell10R);  
  noStroke();
  fill(250);
  ellipse(cursorX, cursorY, cursorRad, cursorRad);          // white
  
// SPEED  
// red  
    ell1X -= speed;
    ell2X -= speed;
    ell3X -= speed;
    ell4Y -= speed;
    ell5Y -= speed;
    ell6Y -= speed;
 // black       
    ell7X -= speed;
    ell8Y -= speed;
 // grey
    ell9Y -= speed;
    ell10X -= speed;
    
 // STARTING POINTS 
 // red
    if (ell1X < -250) {
      ell1X = width;
      ell1Y = random(height);
    }
    if (ell2X < -150) {
      ell2X = width;
      ell2Y = random (height);
    }
    if (ell3X < -50) {
      ell3X = width;
      ell3Y = random(height);
    } 
    if (ell4Y < -250) {
      ell4X = random(width);
      ell4Y = height;
    } 
    if (ell5Y < -150) {
      ell5X = random(width);
      ell5Y = height;
    } 
    if (ell6Y < -50) {
      ell6X = random(width);
      ell6Y = height;
      level++;  
    }
// black      
    if (ell7X < -500) {
      ell7X = width;
      ell7Y = random(height);
    } 
    if (ell8Y < -500) {
      ell8X = random(width);
      ell8Y = height;     
// grey
    } 
    if (ell9Y < - 700) {
      ell9X = random(width);
      ell9Y = height;       
    }
    if (ell10X < -700) {
      ell10X = width;
      ell10Y = random(height);
    } 
    
    if ((level % 10) == 0) {
      speed += .3;
    }
    if ( level == (last_level +1)) {
      mode = 3;
}}}}
  else if (mode == 2) {
    for (int i = 0; i <= width; i += 25) {
    for (int j = 0; j <= height; j += 25) {
    float mouseDist = dist(mouseX, mouseY, i, j);
    float diameter = (mouseDist / maxDistance) *7.5;
    ellipse(i, j, diameter, diameter);  
}}
    fill(250);
    textFont(font350);
    text("" + score, 400, 350);
    
    reset();
    if (mousePressed) {
    mode = 0;
    speed = random(3, 5);
    score = 0;
    ell1R = 25; 
    ell2R = 25;
    ell3R = 25;
    ell4R = 25;
    ell5R = 25;
    ell6R = 25;
    ell7R = 20;
    ell8R = 20;
    ell9R = 10;
    ell10R = 10;
}}  
  else if (mode == 3) {    
    for (int i = 0; i <= width; i += 25) {
    for (int j = 0; j <= height; j += 25) {
    float mouseDist = dist(mouseX, mouseY, i, j);
    float diameter = (mouseDist / maxDistance) * 7.5;
    ellipse(i, j, diameter, diameter);  
// increase ellipse size every "faster"
}
  if (score > 100) {
    ell1R+=.002;
    }
  if (score > 200) {
    ell1R+=.002;
    }
  if (score > 100) {
    ell2R+=.002;
    }
  if (score > 200) {
    ell2R+=.002;
    }      
  if (score > 100) {
    ell3R+=.002;
    }
  if (score > 200) {
    ell3R+=.002;
    }
  if (score > 100) {
    ell4R+=.002;
    }  
  if (score > 200) {
    ell4R+=.002;
    }      
  if (score > 100) {
    ell5R+=.002;
    }  
  if (score > 200) {
    ell5R+=.002;
    }
  if (score > 100) {
    ell6R+=.002;
    }
  if (score > 200) {
    ell6R+=.002;
    }
  if (score > 100) {
    ell7R+=.002;
    }
  if (score > 200) {
    ell7R+=.002;
    }
  if (score > 100) {
    ell8R+=.002;
    }
  if (score > 200) {
    ell8R+=.002;
      } 
      }
    fill(20);
    textFont(font350);
    text("FASTER", 400, 350);
    speed += 0.01;
    reset();
    if (mousePressed) {
    mode = 1; 
}
}
}
 void reset() {
 level = 0;
}

// REAS  
boolean circleCircleIntersect(float cx1, float cy1, float cr1, float cx2, float cy2, float cr2) {
  if (dist(cx1, cy1, cx2, cy2) < cr1 + cr2) {
    return true;
  } else {
    return false;
}
}



