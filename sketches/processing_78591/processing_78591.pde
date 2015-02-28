
/*
**  LINE CLOCK
**  by Martin Melcher
*/

void setup() {
  size(720, 480);
  background(0);
  fill(255);
  ellipseMode(CENTER);
  stroke(255);
  smooth();
}

float x, y;
float x2, y2;
float gridSize, gridSizeX, gridSizeY;
float secondX, secondY;


void draw() {
  frameRate(1);
  background(0);
  stroke(255);
  fill(255);
  gridSizeX = width/10;
  gridSizeY = height/6;
  //translate(30, 30);

  secondX = (second() % 10);
  secondY = (second() / 10);
  
  println("secondX=" + secondX);
  println("secondY=" + secondY);
  
  for (y = 0; y <= height/gridSizeY; y++) 
  { 
    for (x = 0; x <= width/(gridSizeX); x++) 
    { 
        //line(x1, y1, x2, y2)    
        line(x*gridSizeX, y*gridSizeY, secondX * gridSizeX, secondY * gridSizeY);
    }
  }

}

void keyPressed() {
    if(keyCode == ENTER) {
     saveFrame("line-######.png");
    } 
}
