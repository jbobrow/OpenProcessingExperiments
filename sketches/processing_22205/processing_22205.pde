
// Putting the final touches on our Snowflake objects to make the motion
// more realistic. 

Snowflake[] flakes = new Snowflake[500];

//----------------------------------------------------------
void setup() {
  size(300, 300);
  smooth();
  
  // make the framerate more consistent by slowing things down a bit
  frameRate(30);
  
  for (int i=0; i < flakes.length; i++) {
    // we must create each Snowflake object by calling the constructor  
    flakes[i] = new Snowflake( random(width), random(height) );
  }
}


//----------------------------------------------------------
void draw() {
  background(0, 0, 64);
  
  for (int i=0; i < flakes.length; i++) {
    flakes[i].display();
    flakes[i].fall();  
  }
}

//----------------------------------------------------------

// A new data type: snowflakes!
class Snowflake {
  
  // fields 
  float x;
  float y;
  float speed;
  float wind;
  
  float shade;
  float dia;
  
  // constructor
  Snowflake(float x, float y) {
    this.x = x;
    this.y = y;
    
    // we can omit the "this." here since there is no confusion possible,
    // unlike with "x" and "y" 
    speed = random(0.2, 2);
    
    // let's use map() and speed to give each flake a size/colour based on their
    // speed!

    // depending on the value of speed, this will results in diameters
    // between 1 and 6
    dia = map(speed, 0.1, 2, 1, 6);
    
    // samething for the shade, except this time the result will be 
    // between 128 and 255
    shade = map(speed, 0.2, 2, 128, 255);
    
    // we'll use this variable to give each snow flake a slight 
    // horizontal motion as well
    wind = random(-1, 1);
  } 
  
  void display() {
    strokeWeight(dia); 
    stroke(shade);
    point(x, y);
  }
  
  void fall() {
    y += speed;
    if ( y > height ) y = 0;  
    
    // the wind variable + the mouse position combined move the snowflakes
    // horizontally. 
    x += wind + map(mouseX, 0, width, -3, 3);
    if ( x < 0 ) x = width;
    if ( x > width ) x = 0;
  }
  
  
}
