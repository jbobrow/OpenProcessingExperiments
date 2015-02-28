
//The array of stars
Star[] stars;

//Global offset
PVector offset;

void setup() {
  size(800, 800);
  
  //Initialize the stars
  stars = new Star[width];
  for(int i = 0; i < stars.length; i ++) stars[i] = new Star();
  
  //Initialize the offset
  offset = new PVector(width / 2, height / 2);
  
  smooth();
}

void draw() {
  //Redraw the background
  background(0);
  
  //Display the stars
  for(int i = 0; i < stars.length; i ++) stars[i].display();
  
  //Modify the offset, using the center of the screen as a form of joystick
  PVector angle = new PVector(mouseX - width / 2, mouseY - height / 2);
  angle.normalize();
  angle.mult(dist(width / 2, height / 2, mouseX, mouseY) / 50);
  
  offset.add(angle);
}

//Star class
class Star {
  //Location
  PVector loc;
  //Size
  int size;
  //Brightness
  int bright;
  
  Star() {
    //Randomize all of the values
    size = (int) random(1, 6);
    loc = new PVector(random(width * map(size, 1, 7, 7, 1)), random(height * map(size, 1, 7, 7, 1)));
    bright = (int) random(204, 255);
  }
  
  void display() {
    pushStyle();
    
    //Setup the style
    stroke(bright);
    strokeWeight(size);
    
    //Find the actual location and constrain it to within the bounds of the screen
    int x = (int) (((loc.x - offset.x) * size / 8)) % width;
    int y = (int) (((loc.y - offset.y) * size / 8)) % height;
    if(x < 0) x += width;
    if(y < 0) y += height;
    
    //Display the point
    point(x, y);
    
    popStyle();
  }
}
