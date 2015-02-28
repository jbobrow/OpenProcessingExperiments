
  float[] x = new float [300]; // X axis// I wanted to experiment with 4 digit arrays so i choose to do (1000)
  float[] y  = new float [300]; // Y axis
  float[] speed = new float[300]; // speed
   
    void setup() {
      smooth();
      size (500, 500);
      
      for (int i=0; i < 200; i++) {         // Looped X, Y and Speed to random positions, I will soon be attatching the X & Y to my fly figure
    
        x[i] = (int) random (0, width);  // width
        y[i] = (int) random (0, height); // height
        speed[i] = (int) random  (-3, 10); //animates speed at which they move of the screen
      }
      frameRate(7); // increased framerate to make it seem more abstract and speedy, gives it a smoother animation
      }
      


    
    void draw () { 
      background (200,100,140);
      int ButterFlylimit = 300;    // set a limit of 300 so it doesnt get too crowded
      int fly = (int) random (0,4);
      
      while (ButterFlylimit > fly == true) {
        color numberOne = (color) random (0,255);
        color numberTwo = (color) random (0,255);
        color numberThree = (color) random (0,255);
        stroke(100); // heavier stroke to define the butterflies better
        fill(numberOne,numberTwo,numberThree); // for the wings
        
        
        // right wing
        triangle(x[fly], y[fly], x[fly]-12, y[fly]-12, x[fly]-12, y[fly]+12);
        // left wing
        triangle ( x[fly], y[fly], x[fly]+12, y[fly]-12, x[fly]+12, y[fly]+12);
        // body
        fill(0);
        noStroke();
        ellipse(x[fly], y[fly], 10, 18);
        
        
        // Add spped to both the X and Y so it allowes them to move, in blinks, the speed is (-3-10) i liked the way that looked.
        y[fly] = y[fly] + speed[fly];
        x[fly] = x[fly] + speed[fly]; // (int) random (0,100) (0, width);
        fly++; // runs the code, creates the flies and keeps them going as long as they're under the butterfly limit i created which is 300
        
      }
    }
        

