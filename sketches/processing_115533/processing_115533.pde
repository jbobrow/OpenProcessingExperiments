

//Implementing integers to be used later for the drawing of the flower.
int x = 5;
int y = 5;
//Implementing integers for the snow-function
int[] a;
float[] b, c;
int r = 1000;


//setup function for background-color, size and variables
void setup () {
  // setting window size
  size( 600, 600);
  // setting background-color
  background( 111, 163, 250);
  
  //variables needed for snow-function
  a = new int[r];
  b = new float[r];
  c = new float[r];
  //general snowflake-setup setup for the beginning of the voidSnow function
  for(int k = 0; k < r; k++){
  //sets the snowflakes width
  c[k] = random(10)/5;
  //flakes are set on random positions inside the window
  a[k] = int(random(600));
  b[k] = random(600);
  }  
}


// draw function in which drawFlower and drawSnow are put together
void draw(){
  //settings to draw the flower without leafs
  //weight and color of stroke are changed  
  strokeWeight(20);
  stroke(3, 72, 24);
  //drawing a line
  line(width/2, height/2 + 10, width/2, height);
  //setting strokeweight back to normal
  strokeWeight(1);
  //setting color for fill() now to be yellow 
  fill(255, 230, 0);
  //drawing a yellow ellipse 
  ellipse(width/2, height/2, 20, 20);
  /* the block in the if changes the color for fill() with every frameCount, 
  this part is taken from the processing tutorial and just changed slightly
  (cf. http://processing.org/tutorials/transform2d/) 
  */
  if (frameCount % 10 == 0) {
    fill(frameCount * 7 % 255, frameCount * 3 % 255, frameCount * 7 % 255);
  /*this if calls the void-function drawFlower every time the left mousebutton is
  pressed and drawSnow everytime the right mousebutton is pressed
  */
    if(mousePressed  && (mouseButton == LEFT)) {
      drawFlower();    
    } 
    if(mousePressed && (mouseButton == RIGHT)) {
      drawSnow();
    }
  }
 }


// In this void the leafs are created.
void drawFlower() {
    //the "leafs" are translated/defered into the middle of the window
    translate(300, 300);
    //with every frameCount the leafs rotate
    rotate(radians(frameCount * 2  % 360));
    // these three quads form the shape of the leaf using the defined variables
    // from the beginning
    quad(x * 10, y * 10, x * 26, y * 12, x * 30, y * 32, x * 13, y * 27);
    quad(x * 3, y *3, x * 10, y * 4, x * 14, y * 16, x * 3, y * 9);
    quad(x, y, x * 2, y, x * 4, y * 4, x, y * 3); 
}

void drawSnow(){
  //setting the background to a big rectangel in the normal background color 
  fill(111, 163, 250);
  rect(0, 0, 600, 600);
  //in this block the snow is created
  for (int i = 0; i < r; i++) {
    //strokes are removed
    noStroke();
    //color set 
    fill(200);
    //the snowflakes are made out of little ellipses
    ellipse(a[i], b[i], c[i], c[i]);
    //the equation in the next line adds the snowflakes width to their y-coordinate to 
    //move it in the direction of the bottom
    b[i] = b[i] + c[i];
    //this function runs till the end of the window is reached, 
    //then the y- and x-coordinates are reseted
    if ( b[i] >= 600) {
      //random selects a position on the x-axis
      a[i] = int(random(600));
      //the variable for the y-axis is set to zero again
      b[i] = 0;
    }
  }
}
  


