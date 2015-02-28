
//declaring the variables for RGB triangle dimensions
float red;
float green;
float blue;
float alpha;
float trianglew;
float triangleh;
float num;

int counter;

//instructions to create the new circles
Circle myCircle = new Circle (150, 150, 10);
Circle myCircle2 = new Circle (200, 200, 20);
Circle myCircle3 = new Circle (250, 250, 30);

void setup() {
  //set window size
  size(600, 600);
  smooth();
  //set background to a randomly generated color
  background(red, green, blue);
  frameRate(10);
  counter = 0;
}

void draw() {
  //attributes for the text instruction box situated at the bottom of window
  fill(0, 0, 0, 150);
  noStroke();
  rect(0, 600, width, -30);
  //white text with size 14
  textSize(14);
  fill(255);
  //centrally aligned text
  textAlign(CENTER, CENTER);
  text("MOUSECLICK generates circles. SPACE resets interaction. ENTER saves an image.", 300, 580);
  
  //values for the variables
  //randomly generated red, green and blue decimal values
  red = random(255);
  green = random(255);
  blue = random(255);
  //randomly generated alpha value up to the decimal of 155
  alpha = random(155);
  //randomly generated heights and widths of the triangles
  trianglew = random(width);
  triangleh = random(570);
  num = random(600);
  
  //randomly generated color and dimensions of triangles from mouse co-ordinates in window
  fill(red, green, blue, alpha);
  triangle(trianglew, triangleh, num, num, mouseX, mouseY);
  
  //randomly generated color of "mouse clicked" circles in window
  counter++;
  fill (red, green, blue);
  //randomly generated sized circles from mouse co-ordinates when clicked in window
  if(mousePressed == true) {
    ellipse(mouseX, mouseY, 75*sin(counter), 75*sin(counter));
  }
  
  //calls the update for circles colliding with window walls
  myCircle.checkCollisions ();
  myCircle2.checkCollisions ();
  myCircle3.checkCollisions ();
  
  //calls the update for the speed of the circles
  myCircle.update ();
  myCircle2.update ();
  myCircle3.update ();
  
  //calls the update to draw the circles
  myCircle.drawCircle();
  myCircle2.drawCircle();
  myCircle3.drawCircle();
    
}

class Circle {
  //defining the circles, speed and position
  float x;
  float y;
  
  float xspeed;
  float yspeed;
  
  float circleSize;
  
  Circle (float xpos, float ypos, float cSize) {
    
    x = xpos;
    y = ypos;
    circleSize = cSize;
    
    //creating a speed for the circles
    //adding random changes from -25 backwards speed to +25 forwards speed
    xspeed = random (-25, 25);
    yspeed = random (-25, 25);
    
  }
  
  void update () {
    //update function as another class to the circle
    x += xspeed;
    y += yspeed;
    
  }
  
  void checkCollisions () {
    //checks the collisions to prevent the circles from exiting the window
    //if x is less than or more than window width, minus speed
    if ( (x<0) || (x>width)) {
      xspeed = -xspeed;
    }
    
    //if y is less than or more than window height, minus speed 
    if ( (y<0) || (y>height)) {
      yspeed = -yspeed;
    }
    
  }
  
  void drawCircle () {
    //set randomly generated color sizes
    fill (random (255), random (255), random (255));
    ellipse (x, y, circleSize, circleSize);
  }
  
}
    
void keyPressed() {
  //resets the interaction when space bar is pressed
  if (key == ' ') {
    background(red, green, blue);
  }
  
  //screenshots the interaction when enter is pressed
  if (key == ENTER) {
    saveFrame("screenshot.png");
  }
  
}


