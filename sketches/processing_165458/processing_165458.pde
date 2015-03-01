
// 5 if the user presses the 's' or 'S' key, the current image will be saved as 
// "screenshot.png" in the Processing project

/**
  By Carol Chung. Artistic statement: using interaction to rotate shapes, suggest colors, and randomize scale.
  1 When the user clicks the mouse, a starter square will be drawn.
  2 Afterward, if the user drags the mouse from the left to the right, the square will be
  rotated by a factor of 5 degrees.
  3 If the user drags the mouse from the right to the left, a smaller set of squares will be
  drawn and rotated (no fill).
  4 If the user presses a keyboard key (not 's' or 'S'), the scale of the unfilled squares
  will be changed (observed when dragging the mouse from right to left again).  
*/

// global vars
  int count_mouse_press;
  int[] mouse_loc;
  float scale_x, scale_y;

// setup
  void setup() {
    size(800, 800);
    background(#ffffff);
    colorMode(HSB, width, height, 100);
    count_mouse_press = 0;
    mouse_loc = new int[2];
    scale_x = 0.7;
    scale_y = 0.7;
    
  }

// drawing
  void draw() {

    // waits until mouse pressed to draw on canvas 
    if (mousePressed == true) {
      count_mouse_press++;
      mouse_loc[0] = mouseX;
      mouse_loc[1] = mouseY;
      
      //rectMode(CENTER);
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(45));
      rect(0, 0, int(width*(0.3)), int(height*(0.3)));
      popMatrix();       
    }
    
    if (keyPressed == true) {
      if (key != 's' && key != 'S') {
        //background(random(mouseX), random(mouseY), 180, 50);
        scale_x = random(1.5);
        scale_y = random(1.5);
      }    
    }
    
  }
  
  void mouseDragged() {
    if (mouseX > mouse_loc[0]) {
      //println("mouseX: " + mouseX + " ; mouse_loc[0]: " + mouse_loc[0]); 
      
      stroke(random(mouseX), random(mouseY), 100);
      fill(random(mouseX), random(mouseY), 100, 100);
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(5) * (mouseX - mouse_loc[0]));
      rect(0, 0, int(width*(0.3)), int(height*(0.3)));
      popMatrix();      
      
    } else {
      
      noFill();
      stroke(random(mouseY*2), random(mouseX*2), 150);
      pushMatrix();
      translate(width/2, height/2);
      scale(scale_x, scale_y);
      rotate(radians(5) * (mouseX - mouse_loc[0]));
      rect(0, 0, int(width*(0.3)), int(height*(0.3)));
      popMatrix();      
      
    }
  }
  
  void mouseMoved() {
    //background(random(mouseX), random(mouseY), 180, 50);
  }
  
  /* commenting out to avoid excess disk space usage
  void keyPressed() {
    if (key == 's' || key == 'S') {
      save();
    } 
  }
  */
  
  // enhances the saveFrame() function by appending a date and timestamp to the saved image file name
  // this prevents overwriting previously saved frames (unless you save more than one frame per second
  void save() {  
    int d = day();
    int m = month();
    int y = year();
    int h = hour();
    int min = minute();
    int sec = second();
    String s = stringMonthDay(m) + stringMonthDay(d) + String.valueOf(y);
    s += "-" + String.valueOf(h) + String.valueOf(min)+ String.valueOf(sec); 
    
    //saveFrame("screenshot" + s + ".png");   
  }

  // for greater date readability, appends "0" to the month or day when it is a single-digit number
  String stringMonthDay(int i) {
    if ((String.valueOf(i)).length() == 1) 
      return "0" + String.valueOf(i);
    else
      return String.valueOf(i);
  }


