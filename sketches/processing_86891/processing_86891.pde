
// Homework 4
// © Joseph Oak 2013

float x, y, diam, posx, posy, ranx, rany, coor, coor2, oldranx, oldrany;
int rancoor, rancoor2, rancol, rancol1, rancol2, oldrancol, oldrancol1, oldrancol2, score;

void setup() {
  size(400, 400);
  background(0);
  smooth();
  frameRate(800);
  x = width/2;
  y = height/2;
  ranx = width/2;
  rany = height/4;
  rancol = int(random(0, 255));
  rancol1 = int(random(0, 255));
  rancol2 = int(random(0, 255));
  oldranx = 0;
  oldrany = 0;
  score = 0;
}

void draw() {
  noFill();
  stroke(255);
  strokeWeight(.1);
  
  // Draws horizontal grid
  line(width - ((width/8) * 7), 0, width - ((width/8) * 7), height);
  line(width - ((width/8) * 6), 0, width - ((width/8) * 6), height);
  line(width - ((width/8) * 5), 0, width - ((width/8) * 5), height);
  line(width - ((width/8) * 4), 0, width - ((width/8) * 4), height);
  line(width - ((width/8) * 3), 0, width - ((width/8) * 3), height);
  line(width - ((width/8) * 2), 0, width - ((width/8) * 2), height);
  line(width - (width/8), 0, width - (width/8), height);
  line(width, 0, width, height);
  
  // Draws vertical grid
  line(0, height - ((height/8) * 7), width, height - ((height/8) * 7));
  line(0, height - ((height/8) * 6), width, height - ((height/8) * 6));
  line(0, height - ((height/8) * 5), width, height - ((height/8) * 5));
  line(0, height - ((height/8) * 4), width, height - ((height/8) * 4));
  line(0, height - ((height/8) * 3), width, height - ((height/8) * 3));
  line(0, height - ((height/8) * 2), width, height - ((height/8) * 2));
  line(0, height - (height/8), width, height - (height/8));
  line(0, height, width, height);
  
  // Draws Circle
  strokeWeight(1);
  stroke(255);
  fill(oldrancol, oldrancol1, oldrancol2);
  diam = width/8;
  ellipse(x, y, diam, diam);
  
  // Draws Item
  strokeWeight(1);
  stroke(255);
  fill(rancol, rancol1, rancol2);
  ellipse(ranx, rany, diam/2, diam/2);
  
  // Writes score
  fill(255);
  text("Score: "+score, 0, width*.125);
}

void keyPressed() {
  // Movement commands 
  if (posx >= width * .25 && posx <= width * .75 && posy >= height * .25 && posy <= height * .75) {
    if (key == 'w') {
      y = y - (height/8);
    }
    if (key == 'd') {
      x = x + (width/8);
    }
    if (key == 's') {
      y = y + (height/8);
    }
    if (key == 'a') {
      x = x - (width/8);
    }
  }
  
    // Left border
    else if (posx <= width * .125 && posy >= height * .25 && posy <= height * .75) {
      if (key == 'w') {
        y = y - (height/8);
      }
      if (key == 'd') {
        x = x + (width/8);
      }
      if (key == 's') {
        y = y + (height/8);
      }
    }
    
    // Top left corner 
    else if (posx <= width * .125 && posy <= height * .125) {
      if (key == 'd') {
        x = x + (width/8);
      }
      if (key == 's') {
        y = y + (height/8);
      }
    }
    
    // Top border
    else if (posx >= width * .25 && posx <= width * .75 && posy <= height * .125) {
      if (key == 'd') {
        x = x + (width/8);
      }
      if (key == 's') {
        y = y + (height/8);
      }
      if (key == 'a') {
        x = x - (width/8);
      }
    }
    
    // Top right corner 
    else if (posx <= width * .875 && posy <= height * .125) {
      if (key == 's') {
        y = y + (height/8);
      }
      if (key == 'a') {
        x = x - (width/8);
      }
    }
    
    // Right border
    else if (posx <= width * .875 && posy >= height * .125 && posy <= height * .75) {
      if (key == 'w') {
        y = y - (height/8);
      }
      if (key == 's') {
        y = y + (height/8);
      }
      if (key == 'a') {
        x = x - (width/8);
      }
    }
    
    // Bottom right corner
    else if (posx >= width * .875 && posy >= height * .875) {
      if (key == 'w') {
        y = y - (height/8);
      }
      if (key == 'a') {
        x = x - (width/8);
      }
    }
    
    // Bottom border
    else if (posx >= width * .25 && posx <= width * .875 && posy >= height * .875) {
      if (key == 'w') {
        y = y - (height/8);
      }
      if (key == 'd') {
        x = x + (width/8);
      }
      if (key == 'a') {
        x = x - (width/8);
      }
    }
    
    // Bottom left corner
    else if (posx <= width * .25 && posy <= height * .875) {
      if (key == 'w') {
        y = y - (height/8);
      }
      if (key == 'd') {
        x = x + (width/8);
      }
    }
  
  // Store coordinates
  posx = x;
  posy = y;
  
  // Calls randomizing functions
  function();
  function2();
  
  // Stores old coordinates
  oldranx = ranx;
  oldrany = rany;
  
  // Re-places item
  if (posx == ranx && posy == rany) {
    score++;
    ranx = width * coor;
    rany = height * coor2;
    // Stores old color
    oldrancol = rancol;
    oldrancol1 = rancol1;
    oldrancol2 = rancol2;
    // Fills new color
    rancol = int(random(0, 255));
    rancol1 = int(random(0, 255));
    rancol2 = int(random(0, 255));
  }
  
  // Scrim
  noStroke();
  fill(0, 300);
  rect(0, 0, width, height);
}

// Randomizes coordinates
void function() {
  rancoor = int(random(0, 6));
  
  if (rancoor == 0) {
    coor = .125;
  }
  if (rancoor == 1) {
    coor = .25;
  }
  if (rancoor == 2) {
    coor = .375;
  }
  if (rancoor == 3) {
    coor = .5;
  }
  if (rancoor == 4) {
    coor = .625;
  }
  if (rancoor == 5) {
    coor = .75;
  }
  if (rancoor == 6) {
    coor = .875;
  }
}

// Randomizes coordinates
void function2() {
  rancoor2 = int(random(0, 6));
  
  if (rancoor2 == 0) {
    coor2 = .125;
  }
  if (rancoor2 == 1) {
    coor2 = .25;
  }
  if (rancoor2 == 2) {
    coor2 = .375;
  }
  if (rancoor2 == 3) {
    coor2 = .5;
  }
  if (rancoor2 == 4) {
    coor2 = .625;
  }
  if (rancoor2 == 5) {
    coor2 = .75;
  }
  if (rancoor2 == 6) {
    coor2 = .875;
  }
}

