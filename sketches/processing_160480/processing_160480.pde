
// a colorful garden of flower pinwheels. the flowers are created in random
// locations, grow to a maximum size, then quickly shrink and disappear.
// the code could be simpler if using classes, but i'll save that for later. :)

// colors:          lt blue  red      yellow   orange   violet   green    off white dk green
color[] palette = { #0099CC, #E00000, #CCFF00, #FF3300, #330033, #00CC00, #EEEEEE, #003300 };

int[][] flowers; // 2D array of flowers positions, size and color
int step = 0; // frame number, used for rotation

// constants
int X = 0, Y = 1, SIZE = 2, COLOR = 3, GROW = 4; // used for flower data 
int MAX_FLOWERS = 10; // change to a higher number if running in Java
int MAX_FLOWER_SIZE = 120;
int NUM_PETALS = 10;
float PETAL_ANGLE = 2.0 * PI / float(NUM_PETALS);
int[] WINDOW_SIZE = { 1280, 720 };

// initial setup
void setup() {
  // size(WINDOW_SIZE[0], WINDOW_SIZE[1], P2D);  // uncomment this line and comment out the next line if running on Java
  size(800, 600); // Processing export to JS barfs on the line above so changed to this
  flowers = new int[MAX_FLOWERS][5];  // array of flowers
}

void draw() {
  background(palette[0]);
  
  step++;

  for (int i = 0; i < MAX_FLOWERS; i++) {
    // draw flower if created
    if (flowers[i][X] > 0) {
      // grow or shrink flowers
      if (flowers[i][GROW] < 1) { // shrinking state
        flowers[i][SIZE] -=8; // shrink 8x faster than growth
        if (flowers[i][SIZE] <= 0) {
          flowers[i][X] = 0; // mark flower as destroyed
          continue;  // skip drawing it
        }
      }
      else { // growing state
        flowers[i][SIZE]++;
        if (flowers[i][SIZE] >= MAX_FLOWER_SIZE) {
          flowers[i][SIZE] = MAX_FLOWER_SIZE;
          flowers[i][GROW] = -1; // change direction of growth next frame
        }
      }
        
      // draw stem
      fill(palette[7]); 
      rect(flowers[i][X] - 3, flowers[i][Y], 5, height);
      
      // draw center of flower 
      ellipseMode(CENTER); 
      fill(palette[7 - flowers[i][COLOR]]);
      ellipse(flowers[i][X], flowers[i][Y], 30, 30);
      
      //draw petals rotating around center of flower
      ellipseMode(CORNER); 
      pushMatrix(); // save default rotation and coordinate state
      translate(flowers[i][X], flowers[i][Y]); // set rotation center to middle of flower
      fill(palette[flowers[i][COLOR]]);
      // each flower has a different starting angle, and rotation changes slightly each frame
      rotate((i/float(MAX_FLOWERS - 1)) * PI / 2.0 + step * PI / 35.0); 
      for (int j = 0; j < NUM_PETALS; j++) {
        rotate(PETAL_ANGLE); // default is 2.0 * PI / 10.0, evenly spaced for 10 petals around flower
        ellipse(-15, 15, 30, 30 + flowers[i][SIZE]);
      }
      popMatrix(); // restore rotation and coordinate state      
    }
    else {
      // 2% chance per frame of empty flower array position creating a new flower
      if (random(1) < 0.02) {
        flowers[i][X] = int(random(width - MAX_FLOWER_SIZE / 2.0) + MAX_FLOWER_SIZE / 2.0);
        flowers[i][Y] = int(random(height - MAX_FLOWER_SIZE / 2.0) + MAX_FLOWER_SIZE / 2.0);
        flowers[i][SIZE] = 0;
        flowers[i][COLOR] = int(random(6)) + 1;
        flowers[i][GROW] = 1;
      }
    }
  }
}


