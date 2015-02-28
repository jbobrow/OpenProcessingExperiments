
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/63201*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
float x = 0;       // used for vertical pattern 1
float x2 = 0;      // used for vertical pattern 2
float x3 = 0;      // used for vertical pattern 3
float x4 = 0;      // used for vertical pattern 4
float y = 0;       // used for horizontal pattern 1
float y2 = 0;      // used for horizontal pattern 2
float y3 = 0;      // used for horizontal pattern 3
float y4 = 0;      // used for horizontal pattern 4
float dy = 0;      // used for diagonal up pattern 1,2,4 upper half ( and 4 lower half)
float ddy = 10;    // used for diagonal up pattern 1 lower half
float ddy2 = 210;  // used for diagonal up pattern 2 lower half
float dy3 = 600;   // used for diagonal up pattern 3 upper half
float ddy3 = 610;  // used for diagonal up pattern 3 lower half
float d2 = 0;
float d3 = 0;
float d4 = 0;
float kx = 0;      // used for diagonal up pattern 1,2,4 upper half ( and 4 lower half)
float kkx = 10;    // used for diagonal up pattern 1 lower half
float kkx2 = 210;  // used for diagonal up pattern 2 lower half
float kx3 = 200;   // used for diagonal up pattern 3 upper half
float kkx3 =210;   // used for diagonal up pattern 3 lower half
float k2 = 0;
float k3 = 0;
float k4 = 0;

// some booleans to control program flow
boolean horizontal_patterns_done = false;    
boolean vertical_patterns_done = false;
boolean diagonaldown_patterns_done = false;
boolean diagonalup_patterns_done = false;
boolean dup_one_done = false;    // diagonal up pattern 1 upper part
boolean dlo_one_done = false;    // diagonal up pattern 1 lower part
boolean dup_two_done = false;    // diagonal up pattern 2 upper part
boolean dlo_two_done = false;    // diagonal up pattern 2 lower part
boolean dup_three_done = false;  // diagonal up pattern 3 upper part
boolean dlo_three_done = false;  // diagonal up pattern 3 lower part
boolean dup_four_done = false;   // diagonal up pattern 4 upper part
boolean dlo_four_done = false;   // diagonal up pattern 4 lower part

void setup () {
  size(800, 800);
  background(200, 190, 160, 190);
  smooth();
  frameRate(30);
}

void draw () {
  //vert lines
  line(2*width/4, 0, 2*width/4, height);
  line(width/4, 0, width/4, height);
  line(3*width/4, 0, 3*width/4, height);

  //horz lines
  line(0, width/4, height, width/4);
  line(0, 2*width/4, height, 2*width/4);
  line(0, 3*width/4, height, 3*width/4);

  //hor drawn patterns
  if (!horizontal_patterns_done) {
    stroke(0);
    if (y < 200) {
      line(0, y, width/4, y);
      y = y + 9;
    } 
    else {
      stroke(0);
      if (y2 < 200) {
        line(400, y2, 3*width/4, y2);
        y2 = y2 + 30;
      } 
      else {
        stroke(0);
        if (y3 < 200) {
          line(400, y3+600, 3*width/4, y3+600);
          y3 = y3 + 15;
        } 
        else {
          stroke(0);
          if (y4 < 200) {
            line(200, y4+400, 2*width/4, y4+400);
            y4 = y4 + 4;
          }
          else {
            horizontal_patterns_done = true;
          }
        }
      }
    }
  }

  if (horizontal_patterns_done && !vertical_patterns_done) {
    //vert drawn pattern
    stroke(0);
    if (x < 200) {
      line(x, 200, x, 2*height/4);
      x = x + 11;
    } 
    else {
      stroke(0);
      if (x2 < 200) {
        line(x2, 400, x2, 3*height/4);
        x2 = x2 + 5;
      } 
      else {
        stroke(0);
        if (x3 < 200) {
          line(x3+400, 400, x3+400, 3*height/4);
          x3 = x3 + 19;
        } 
        else {
          stroke(0);
          if (x4 < 200) {
            line(x4+600, 0, x4+600, 200);
            x4 = x4 + 9;
          }
          else {
            vertical_patterns_done = true;
          }
        }
      }
    }
  }

  // diagonal up patterns
  if (horizontal_patterns_done && vertical_patterns_done && !diagonalup_patterns_done) {
    stroke(0);
    // upper half of pattern 1
    if ((kx < 200 && dy < 400) && (!dup_one_done)) { 
      line(200, dy, kx+200, 0);
      kx+=15;
      dy+=15;
    } 
    else {
      dup_one_done = true;
    }
    // lower half
    if ((kkx < 200) && (ddy < 400) && (dup_one_done)) {

      line(kkx+200, 200, 400, ddy);
      kkx+=15;
      ddy+=15;
    }
    else if (dup_one_done) {
      dlo_one_done = true;
    }

    // upper half of pattern 2
    if (dup_one_done && dlo_one_done) {
      if ((kx < 400) && (dy < 600) && (!dup_two_done)) { 
        line(400, dy, kx+200, 200);
        kx+=25;
        dy+=25;
      } 
      else {
        dup_two_done = true;
      }
      // lower half
      if ((kkx2 < 400) && (ddy2 < 600) && (dup_two_done)) { 
        line(kkx2+200, 400, 600, ddy2);
        kkx2+=25;
        ddy2+=25;
      } 
      else if (dup_two_done) {
        dlo_two_done = true;
      }
    }

    // pattern 4
    // this one only works because its the bottom right square of the drawing
    if (dlo_two_done && dup_two_done) {
      if ((kx < 800) && (dy < 800) && (!dup_four_done) && (!dlo_four_done)) { 
        line(600, dy+200, kx+200, 600);
        kx+=25;
        dy+=25;
      }
      else {
        dup_four_done = true;
        dlo_four_done = true;
      }
    } 
    
    // pattern 3 upper half
    if (dup_four_done && dlo_four_done) {
      stroke(0);
      if ((kx3 < 400) && (dy3 < 800) && (!dup_three_done)) { 
        line(200, dy3, kx3, 600);
        kx3+=15;
        dy3+=15;
      }
      else {
        dup_three_done = true;
      }
      
      // lower half
      if ((kkx3 < 400) && (ddy3 < 800) && (dup_three_done)) { 
        line(kkx3, 800, 400, ddy3);
        kkx3+=15;
        ddy3+=15;
      }
      else if (dup_three_done) {
        dlo_three_done = true;
      }
    }
  }
  if (dup_one_done && dlo_one_done && dup_two_done && dlo_two_done && dup_three_done && dlo_three_done && dup_four_done && dlo_four_done) {
    diagonalup_patterns_done = true;
  }
  
  // diagonal down patterns
  // this remains to be done the same way as with the diagonal up patterns
  
  //
  stroke(0);
}


