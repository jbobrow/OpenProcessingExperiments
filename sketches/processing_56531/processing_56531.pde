
float r;                                  //These are variables.
float g;                                  //this tells it to store a number called r, a number called g etc.
float b;
float x;
float y;

void setup() {
  size (600, 600);                         //this is the size of the window
  smooth();                                //this makes the picture smooth
}

void draw() {

  background (0);
  fill(255);
  ellipse (2, 2, 2, 2);                    //these are the stars
  ellipse (60, 70, 2, 2);                  //this is telling the computer to draw circles which are the stars.
  ellipse (100, 30, 2, 2);                 //the first number says how far from the left
  ellipse (50, 290, 2, 2);                 //the second number is how far from the top it will be drawn.
  ellipse (90, 300, 2, 2);                 //the third and fourth number is how big you want it.
  ellipse (80, 243, 2, 2);
  ellipse (94, 402, 2, 2);
  ellipse (94, 124, 2, 2);
  ellipse (78, 85, 2, 2);
  ellipse (500, 32, 2, 2);
  ellipse (1000, 80, 2, 2);
  ellipse (2000, 90, 2, 2);
  ellipse (200, 300, 2, 2);
  ellipse (300, 400, 2, 2);
  ellipse (400, 500, 2, 2);
  ellipse (70, 80, 2, 2);
  ellipse (400, 400, 2, 2);
  ellipse (300, 50, 2, 2);
  ellipse (200, 80, 2, 2);
  ellipse (350, 200, 2, 2);
  ellipse (150, 500, 2, 2);
  ellipse (100, 550, 2, 2);
  ellipse (330, 330, 2, 2);
  fill (255, 196, 0);
  ellipse (1000, 60, 1000, 1000);           //this is the sun
  
  if (mousePressed) {                       //this means that when the mouse is clicked, this thing will happen.
    fill (0, 14, 255);                      //these are the planets
    ellipse (100, 150, 50, 50);
    fill (190, 193, 111);                   
    ellipse (200, 260, 50, 50);
    fill (80, 75, 75);
    ellipse (300, 370, 50, 50);
    fill (250, 10, 14);
    ellipse (50, 40, 50, 50);
  }
  if (keyPressed) {
    r = random(255);                         //these lines give the varibles number values that the program can use.
    g = random(255);
    b = random(255);
    x = random(width);
    y = random(height);
    fill (r,g,b);                            //this uses the random numbers given to r, g, b variables to make a random colours.
    ellipse (x, y, 40, 40);                  //this draws a 40 by 40 random coloured circle at random co-ordinates. This is Planet Random.
    delay(500);                              //This is how long it must wait before the circle is in a new place. 500 milliseconds = half a second.
  }
}





