
import java.util.Collections;

int x = 15; // Needs to be 15 so it is not right against the edge
int y = 15;
boolean gridOn = true; // To stop it from drawing so can draw image
boolean imageOn = false; // used to draw image and time it with drawing shapes
PImage image; // Used to display orignal art piece
int SHUFFLE_SPEED = 7; // The speed at which the squares move

ArrayList<Square> square_list; // List of Square objects
ArrayList<Integer> order_list; // A list of indexes of squares

// Basic Setup
void setup() {
  size(530,580,P2D);
  square_list = new ArrayList<Square>(110);
  order_list = new ArrayList<Integer>(110);
  image = loadImage("Painting.jpg");
}

void drawGrid() {
  int index = 1; // Index of square
  // Clear out the lists to allow the lists to be updated
  square_list.clear();
  order_list.clear();
  for(int j = 0; j < 11; j++) {
    for(int i = 0; i < 10; i++) {
      Square square = new Square(x,y); // Create Square object
      // Add to lists
      if(order_list.size() < 110) {
       square_list.add(square);
       order_list.add(index);
      }
      square.drawSquare(index); // Draw square
      x += 50; // increment to the right
      index++;
    }
    x = 15; // Reset x position
    y += 50; // Increment down
  }
  // Reset vaiables
  x = 15;
  y = 15;
  index = 1;
  gridOn = false;
}

void draw() {
  if(gridOn == true) {
    background(1);
    drawGrid();
  }
  if(imageOn == true)
    image(image,0,0);
  
  // If you hold the 'm' key down you will move the squares and if you shuffled them  
  if(key == 'm' && keyPressed) {
    move_squares();
    int index = 1;
    for(Square square : square_list) {
      square.drawSquare(index);
      index++;
    }
  }

}

// When you mouse click it will toggle between showing you the
// original art piece and the generated one
void mousePressed() {
  if(imageOn == false)
    imageOn = !imageOn;
  else {
    gridOn = !gridOn;
    imageOn = !imageOn;
  }
}

void keyPressed() {
  // Shuffle the square position values so they will move around
  if(key == 's') {
    Collections.shuffle(order_list);
  }
  // Reset to original image
  if(key == 'r') {
    drawGrid();
  }
}

// Will move all the squares one turn in the right direction
void move_squares() {
  int x = 15;
  int y = 15;
  int index = 1;
  for(Square square : square_list) {
    x = getNewX(order_list.get(index-1), square.getX());
    y = getNewY(order_list.get(index-1), square.getY());
    square.setX(x);
    square.setY(y);
    index++;
  }
}

// Get the row of a square given the index
int getRow(int x) { // x = index of square
  if(x <= 10)
    return 1;
  else if(x <= 20)
    return 2;
  else if(x <= 30)
    return 3;
  else if(x <= 40)
    return 4;
  else if(x <= 50)
    return 5;
  else if(x <= 60)
    return 6;
  else if(x <= 70)
    return 7;
  else if(x <= 80)
    return 8;
  else if(x <= 90)
    return 9;
  else if(x <= 100)
    return 10;
  else
    return 11;
}

// Will give you the new x position of the square based on index of
// where the square needs to go and where it is.
int getNewX(int index, int curX) { // index is where the square is going
  // Compute the x end goal position
  int row = getRow(index);
  int col = index - (row-1)*10;
  if(col == 0)
    col = 10;
  int goalX = 15 + (col-1)*50;
  
  // return the next position the square needs to be at to get to goal
  if(goalX > curX) {
    if(goalX-curX >= SHUFFLE_SPEED)
      return goalX;
    return curX+SHUFFLE_SPEED;
  }
  else if(goalX < curX) {
    if(goalX-curX >= -SHUFFLE_SPEED)
      return goalX;
    return curX-SHUFFLE_SPEED;
  }
  else
    return curX;
}

// Will give you the new y position of the square based on index of
// where the square needs to go and where it is.
int getNewY(int index, int curY) { // index is where the square is going
  // Compute the y end goal position
  int row = getRow(index);
  int goalY = 15 + (row-1)*50;
  
  // return the next position the square needs to be at to get to goal
  if(goalY > curY) {
    if(goalY-curY >= SHUFFLE_SPEED)
      return goalY;
    return curY+SHUFFLE_SPEED;
  }
  else if(goalY < curY) {
    if(goalY-curY >= -SHUFFLE_SPEED)
      return goalY;
    return curY-SHUFFLE_SPEED;
  }
  else
    return curY;
}
class Square { 
  int wid;
  int len;
  int xpos;
  int ypos;
  int id;
  
  // Basic constructor
  Square(int x, int y) {
    wid = 50;
    len = 50;
    xpos = x;
    ypos = y;    
  }
  
  int getX() {
    return xpos;
  }
  
  int getY() {
    return ypos;
  }
  
  void setX(int x) {
    xpos = x;
  }
  
  void setY(int y) {
    ypos = y;
  }
  
  // Will draw a specific kind of square based on the index/id number given
  // The lines and dots on the squares have some randomness to them
  void drawSquare(int id) {
    strokeWeight(8);
    // Black squares
    if(id == 1 || id == 11 || id == 21 || id == 47 || id == 54 || id == 81 || id == 85) {
      // Draw square
      fill(30);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,false);
    }
    // Speckled squares
    else if(id == 2 || id == 41 || id == 51 || id == 52 || id == 61) {
      fill(219, 243, 193);
      stroke(38);
      rect(xpos,ypos,wid,len);
      for(int i = 0; i < 500; i++) {
        strokeWeight(2);
        point(xpos+random(45), ypos+random(45));
      }
      drawLines(false,false);
    }
    // gold foil squares
    else if(id == 8 || id == 9 || id == 10 || id == 20 || id == 100 || id == 107 || id == 110) {
      fill(253, 230, 136);
      stroke(38);
      rect(xpos,ypos,wid,len);
      strokeWeight(1);
      stroke(201,163,118);
      for(int i = 0; i < 800; i++) {
        point(xpos+random(35) + 5, ypos+random(35) + 5);
      }
      strokeWeight(1);
      stroke(131,95,43);
      for(int i = 0; i < 600; i++) {
        point(xpos+random(35) + 5, ypos+random(35) + 5);
      }
      stroke(38);
      for(int i = 0; i < 150; i++) {
        strokeWeight(2);
        point(xpos+random(45), ypos+random(45));
      }
      
      drawLines(false,false);
    }
    // Light grey squares
    else if(id == 3 || id == 14 || id == 27 || id == 30 || id == 37 ||
            id == 43 || id == 46 || id == 71 || id == 79 || id == 84
             || id == 90 || id == 92 || id == 103 || id == 106 || id == 109) {
      fill(209);
      stroke(38);
      rect(xpos,ypos,wid,len);
      //Special case only two lines
      stroke(5);
      strokeWeight(2);
      line(xpos+17+random(4)-2, ypos, xpos+17+random(4)-2, ypos+wid);
      line(xpos+34+random(4)-2, ypos, xpos+34+random(4)-2, ypos+wid);
      stroke(38);
    }
    // special white squares
    else if(id == 33 || id == 83) {
      fill(232,233,235);
      stroke(38);
      rect(xpos,ypos,wid,len);
      
      // Background lines
      stroke(84);
      strokeWeight(2);
      //Horizontal
      line(xpos+7, ypos+10+random(4)-2, xpos+wid, ypos+10+random(4)-2);
      line(xpos+7, ypos+25+random(4)-2, xpos+wid, ypos+25+random(4)-2);
      line(xpos+7, ypos+39+random(4)-2, xpos+wid, ypos+39+random(4)-2);
      //vertical
      line(xpos+10+random(4)-2, ypos+5, xpos+10+random(4)-2, ypos+wid);
      line(xpos+25+random(4)-2, ypos+5, xpos+25+random(4)-2, ypos+wid);
      line(xpos+39+random(4)-2, ypos+5, xpos+39+random(4)-2, ypos+wid);
      
      
      //Special case only two lines
      stroke(5);
      strokeWeight(2);
      line(xpos+17+random(4)-2, ypos, xpos+17+random(4)-2, ypos+wid);
      line(xpos+34+random(4)-2, ypos, xpos+34+random(4)-2, ypos+wid);
      stroke(38);
    }
    // grey squares
    else if(id == 40 || id == 82) {
      // Draw square
      fill(165,169,168);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // purple squares
    else if(id == 97) {
      // Draw square
      fill(110,79,159);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // light purple squares
    else if(id == 60) {
      // Draw square
      fill(157,148,203);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // light purple red squares
    else if(id == 102) {
      // Draw square
      fill(151,96,102);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // redish squares
    else if(id == 104) {
      // Draw square
      fill(182,72,73);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
     // off white squares
    else if(id == 4 || id == 15 || id == 64 || id == 67 || id == 86 || id == 89) {
      // Draw square
      fill(248);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
     // slightly different off white squares
    else if(id == 17 || id == 34 || id == 58 || id == 75 || id == 96) {
      // Draw square
      fill(234,248,218);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // Square number 5 brownish
    else if(id == 5) {
      // Draw square
      fill(87,74,66);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,false);
    }
    // Off yellow squares
    else if(id == 6 || id == 16 || id == 25) {
      // Draw square
      fill(236,229,112);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // Off yellow darker squares
    else if(id == 38 || id == 101) {
      // Draw square
      fill(188,161,46);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
     // Off yellow squares
    else if(id == 36 || id == 72 || id == 93) {
      // Draw square
      fill(78,74,13);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,false);
    }
    // light yellow brown squares
    else if(id == 55 || id == 59 || id == 87) {
      // Draw square
      fill(252,213,96);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // orange squares
    else if(id == 62) {
      // Draw square
      fill(225,130,38);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // brownish squares
    else if(id == 44 || id == 48 || id == 63 || id == 77) {
      // Draw square
      fill(175,129,7);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // darker brownish squares
    else if(id == 73 || id == 78 || id == 91 || id == 108) {
      // Draw square
      fill(112,53,0);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,false);
    }
    // Green squares
    else if(id == 7 || id == 26 || id == 42 || id == 57 || id == 99) {
      // Draw square
      fill(0,152,46);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // Dark Green squares
    else if(id == 76 || id == 88) {
      // Draw square
      fill(40,77,70);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,false);
    }
     // torqoise squares
    else if(id == 45 || id == 50 || id == 94) {
      // Draw square
      fill(0,148,127);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // Square number 12 dark gray
    else if(id == 12) {
      // Draw square
      fill(88,114,105);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,false);
    }
    // skin color squares
    else if(id == 13 || id == 31 || id == 35 || id == 53 || id == 70) {
      // Draw square
      fill(255,234,167);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // light blue squares
    else if(id == 32 || id == 56 || id == 68 || id == 69 || id == 95) {
      // Draw square
      fill(2,178,225);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // medium blue squares
    else if(id == 23) {
      // Draw square
      fill(0,99,141);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    } 
    // medium-dark blue squares
    else if(id == 24 || id == 29) {
      // Draw square
      fill(0,70,135);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // dark blue squares
    else if(id == 19 || id == 98 || id == 105) {
      // Draw square
      fill(20,51,80);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // grey blue squares
    else if(id == 39) {
      // Draw square
      fill(80,112,127);
      stroke(38);
      rect(xpos,ypos,wid,len);
      drawLines(true,true);
    }
    // darker red tight grid squares
    else if(id == 22 || id == 49) {
      // Draw square
      fill(158,72,0);
      stroke(38);
      rect(xpos,ypos,wid,len);
      
      //draw grid
      strokeWeight(1);
      stroke(5);
      //Vertical
      for(int i = 1; i < 10; i++) {
        line(xpos+(i*5)+random(2)-1,ypos, xpos+(i*5)+random(2)-1,ypos+wid);
      }
      //Horizontal
      for(int i = 1; i < 10; i++) {
        line(xpos,ypos+(i*5)+random(2)-1, xpos+wid,ypos+(i*5)+random(2)-1);
      }
      drawLines(true,false);
    }
    // lighter red tight grid squares
    else if(id == 65) {
      // Draw square
      fill(228,133,51);
      stroke(38);
      rect(xpos,ypos,wid,len);
      //draw grid
      strokeWeight(1);
      stroke(5);
      //Vertical
      for(int i = 1; i < 10; i++) {
        line(xpos+(i*5)+random(2)-1,ypos, xpos+(i*5)+random(2)-1,ypos+wid);
      }
      //Horizontal
      for(int i = 1; i < 10; i++) {
        line(xpos,ypos+(i*5)+random(2)-1, xpos+wid,ypos+(i*5)+random(2)-1);
      }
      
      drawLines(true,false);
    }
    // light blue tight grid squares
    else if(id == 28) {
      // Draw square
      fill(34,195,224);
      ;
      rect(xpos,ypos,wid,len);
      //draw grid
      strokeWeight(1);
      stroke(5);
      //Vertical
      for(int i = 1; i < 10; i++) {
        line(xpos+(i*5)+random(2)-1,ypos, xpos+(i*5)+random(2)-1,ypos+wid);
      }
      //Horizontal
      for(int i = 1; i < 10; i++) {
        line(xpos,ypos+(i*5)+random(2)-1, xpos+wid,ypos+(i*5)+random(2)-1);
      }
      
      drawLines(true,false);
    }
    // white tight grid squares
    else if(id == 74) {
      // Draw square
      fill(255,250,243);
      stroke(38);
      rect(xpos,ypos,wid,len);
      //draw grid
      strokeWeight(1);
      stroke(5);
      //Vertical
      for(int i = 1; i < 10; i++) {
        line(xpos+(i*5)+random(2)-1,ypos, xpos+(i*5)+random(2)-1,ypos+wid);
      }
      //Horizontal
      for(int i = 1; i < 10; i++) {
        line(xpos,ypos+(i*5)+random(2)-1, xpos+wid,ypos+(i*5)+random(2)-1);
      }
      drawLines(false,false);
    }
    // white super tight grid squares
    else if(id == 18) {
      // Draw square
      fill(255,250,243);
      stroke(38);
      rect(xpos,ypos,wid,len);
      //draw grid
      strokeWeight(1);
      stroke(5);
      //Vertical
      for(int i = 1; i < 15; i++) {
        line(xpos+(i*4)+random(2)-1,ypos, xpos+(i*4)+random(2)-1,ypos+wid);
      }
      //Horizontal
      for(int i = 1; i < 15; i++) {
        line(xpos,ypos+(i*4)+random(2)-1, xpos+wid,ypos+(i*4)+random(2)-1);
      }
      drawLines(true,false);
    }
    // black super tight grid squares
    else if(id == 80) {
      // Draw square
      fill(96,97,99);
      stroke(38);
      rect(xpos,ypos,wid,len);
      //draw grid
      strokeWeight(1);
      stroke(2);
      //Vertical
      for(int i = 1; i < 20; i++) {
        line(xpos+(i*3)+random(2)-1,ypos, xpos+(i*3)+random(2)-1,ypos+wid);
      }
      //Horizontal
      for(int i = 1; i < 20; i++) {
        line(xpos,ypos+(i*3)+random(2)-1, xpos+wid,ypos+(i*3)+random(2)-1);
      }
      drawLines(true,false);
    }
    // yellow super tight grid squares
    else if(id == 66) {
      // Draw square
      fill(242,240,153);
      stroke(38);
      rect(xpos,ypos,wid,len);
      //draw grid
      strokeWeight(1);
      stroke(2);
      //Vertical
      for(int i = 1; i < 20; i++) {
        line(xpos+(i*3)+random(2)-1,ypos, xpos+(i*3)+random(2)-1,ypos+wid);
      }
      //Horizontal
      for(int i = 1; i < 20; i++) {
        line(xpos,ypos+(i*3)+random(2)-1, xpos+wid,ypos+(i*3)+random(2)-1);
      }
      drawLines(true,false);
    }
    else {
      fill(255);
      //fill(random(255),random(255),random(255));
      stroke(38);
      rect(x,y,wid,len);
    }
  }
  
  void drawLines(boolean verBlack, boolean horBlack) {
      //Draw lines
      strokeWeight(2); 
      //Horizontal
      if(verBlack == true)
        stroke(5);
      else
        stroke(75);
      line(xpos, ypos+17+random(4)-2, xpos+wid, ypos+17+random(4)-2);
      line(xpos, ypos+34+random(4)-2, xpos+wid, ypos+34+random(4)-2);
      //vertical
      if(horBlack == true)
        stroke(5);
      else
        stroke(75);
      line(xpos+17+random(4)-2, ypos, xpos+17+random(4)-2, ypos+wid);
      line(xpos+34+random(4)-2, ypos, xpos+34+random(4)-2, ypos+wid);
  }
  
}


