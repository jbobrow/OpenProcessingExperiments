
int s;

PFont font;

int score = 0;


int linegap = 80;
int lineWidth = 80;  // Master line (tile) width
int cHeight = 50;

float line1x;
float line2x;
float line3x;
float line4x;
float line5x;

float line1y;
float line2y;
float line3y;
float line4y;
float line5y;

float z; //variable that determines random space of the range of the line
float z2;
float z3;
float z4;
float z5;

float speed = 1;
int direction1 =1;
int direction2 =1;
int direction3 =1;
int direction4 =1;
int direction5 =1;

float cx; //circle x coordinate controlled by mouse
float cy; //circle y coordinate that changes each level
int level = 0;

int mode = 0;

boolean dropY = false;

void setup() {
  size(800, 480);
  smooth();
  noCursor();
  ellipseMode(CENTER);
  textAlign(CENTER);

  font = loadFont("Candara-90.vlw");
  mode = 0;
  score = 0;
  level = 0;
  dropY = false;
  score = 0;


  s = second();

  z = random(100, width-lineWidth); //random coordinates for where line appears
  z2 = random(0, width - lineWidth);
  z3 = random(0, width - lineWidth);
  z4 = random(0, width - lineWidth);
  z5 = random(0, width - lineWidth);

  cx = z;
  cy = 452;

  line1x = z;
  line2x = z2;
  line3x = z3;
  line4x = z4;
  line5x = z5;


  line1y = 410;
  line2y = line1y - linegap;
  line3y = line2y - linegap;
  line4y = line3y - linegap;
  line5y = line4y - linegap;
}

void draw() {
  background(0);
  stroke(255);
  fill(255);

  ////Start Screen
  if (mode == 0) {
    background(3, 6, 36);
    fill(250, 247, 154);
    textFont(font, 90);
    text("Star Chase", 400, 160);
    fill(252, 252, 224);
    textFont(font, 20);
    text("Click the mouse to jump from one shooting star to the next", 400, 230);  
    text("as it passes over the circle", 400, 260);
    text("But be careful not to miss the shooting star", 400, 300); 
    text("or you will fall back down to Earth", 400, 330);
    textFont(font, 40);
    fill(250, 247, 154);
    text("Click to begin the chase", 400, 390);
    
    
  } 
  else if (mode == 1) {



    if (dropY == true) {
      if (cy < 453) {
        cy++;
      }
      else {
        dropY = false;
      }
    }
    else {
      // set ellipse xval based on level
      if (level == 1) {
        cx = line1x + lineWidth/2;
      }
      else if (level == 2) {
        cx = line2x + lineWidth/2;
      }
      else if (level == 3) {
        cx = line3x + lineWidth/2;
      }
      else if (level == 4) {
        cx = line4x + lineWidth/2;
      }
      else if (level == 5) {
        cx = line5x + lineWidth/2;
      }
    }

    //Circle
    ellipse(cx, cy, cHeight, cHeight);


    // Tiles Change Direction
    // line 1
    if ((line1x > width-lineWidth) || (line1x < 0)) {
      direction1 = -direction1;
    }
    line1x = line1x + direction1 * (speed + 10);
    line(line1x, line1y, line1x + lineWidth, line1y);

    // line 2
    if ((line2x > width-lineWidth) || (line2x < 0)) {
      direction2 = -direction2;
    }
    line2x = line2x + direction2 * (speed + 13);
    line(line2x, line2y, line2x + lineWidth, line2y);

    // line 3
    if ((line3x > width-lineWidth) || (line3x < 0)) {
      direction3 = -direction3;
    }
    line3x = line3x + direction3 * (speed + 16);
    line(line3x, line3y, line3x + lineWidth, line3y);

    // line 4
    if ((line4x > width-lineWidth) || (line4x < 0)) {
      direction4 = -direction4;
    }
    line4x = line4x + direction4 * (speed + 17);
    line(line4x, line4y, line4x + lineWidth, line4y);

    // line5
    if ((line5x > width-lineWidth) || (line5x < 0)) {
      direction5 = -direction5;
    }
    line5x = line5x + direction5 * (speed + 19);
    line(line5x, line5y, line5x + lineWidth, line5y);
    
    //Score
  fill(250, 247, 154);
  textFont(font, 18);
  text(score, 20, 20);
  
  if (cy ==453) {
    mode = 2;
  }
  if (score == 100) {
    mode = 3;
  }
  } 
  
  else if(mode == 2) {
   background(3, 6, 36);
   fill(250, 247, 154);
   textFont(font, 90);
   text("GAME OVER", 400, 200);
   fill(252, 252, 224);
   textFont(font, 30);
   text("Now that you've very slowly fallen back to Earth...", 400, 270);
   fill(250, 247, 154);
   textFont(font, 70);
   text("Click to play again", 400, 350);
   
  } 
  if (mode ==3) {
   background(3, 6, 36);
   fill(250, 247, 154);
   textFont(font, 90);
   text("Congratulations", 400, 150);
   textFont(font, 50);
   text("You've caught all the shooting stars!",400, 225);
   fill(252, 252, 224);
   textFont(font, 70);
   text("Click to play again", 400, 340); 
}
}

void reset () {
  setup();
}

// Mouse pressed event function
void mousePressed() {

  //  // Start & End Page
  if (mode == 0) {
    mode = 1;
  }
  else if (mode==2) {
    reset();
  }
  else if (mode==3) {
    reset();
  }

  // Jumping

  if ((cx <= line2x || cx >= line2x + lineWidth) && level == 1) {
    //cy = 452;
    dropY = true;
    level = 0;
    score = score - 20;
  }
  else if ((cx <= line3x || cx >= line3x + lineWidth) && level == 2) {
    //cy = 452;
    dropY = true;
    level = 0;
    score = score -40;
  }
  else if ((cx <= line4x || cx >= line4x + lineWidth) && level == 3) {
    //cy = 452;
    dropY = true;
    level = 0;
    score = score -60;
  }
  else if ((cx <= line5x || cx >= line5x + lineWidth) && level == 4) {
    //cy = 452;
    dropY = true;
    level = 0;
    score = score -80;
  }



  else if ((cx > line1x && cx < line1x + lineWidth) && level == 0) {
    cy = line1y - cHeight/2;
    level = 1;
    score = score + 20;
  }
  else if ((cx > line2x && cx < line2x + lineWidth)  && level == 1) {
    cy = line2y - cHeight/2;
    level = 2;
    score = score + 20;
  }
  else if ((cx > line3x && cx < line3x + lineWidth)  && level == 2) {
    cy = line3y - cHeight/2;
    level = 3;
    score = score + 20;
  }
  else if ((cx > line4x && cx < line4x + lineWidth)  && level == 3) {
    cy = line4y - cHeight/2;
    level = 4;
    score = score + 20;
  }
  else if ((cx > line5x && cx < line5x + lineWidth)  && level == 4) {
    cy = line5y - cHeight/2;
    level = 5;
    score = score + 20;
  }
}




