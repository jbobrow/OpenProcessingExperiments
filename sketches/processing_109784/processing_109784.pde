
int x,colour; // declare x and colour

void setup() {
  size(300,300); // define the size of the window
  background(255); // define the colour of the background
  smooth(); // make the edges of the lines become smooth
  frameRate(100); // make the programme displays 100 frames per second
 ;
}

void draw() {
  x = int(x+5); // 5 units will be added to the x-aixs of the first point when the programme draw the next line
  if (x>300){x=0;} // if the x-axis of the first point exceed the window size, the line will go back to the first line and draw again
  
  line(x, 300, 150, 150); // the coordinate of the line
  
   if (colour==0) { 
   stroke (random(150));// fill the line to grey colourtone
  }
  else if (colour==1) { // 
    stroke (random(255), 0, 0);// fill the line to red colourtone
  }
  else if (colour==2) { 
    stroke (0, random(255), 0);// fill the line to green colourtone
  }
  else if (colour==3) { 
    stroke (0, 0, random(255));// fill the line to blue colourtone
  }  
}

void keyPressed() {
  if (key == '0') {
    colour = 0; // the colour of the line will turn grey when people pressed the key '0'
  }
  else if (key == '1') {
    colour = 1; // the colour of the line will turn red when people pressed the key '1'
  }
  else if (key == '2') {
    colour = 2; // the colour of the line will turn green when people pressed the key '2'
  }
  else if (key == '3') {
    colour = 3; // the colour of the line will turn blue when people pressed the key '3'
  }
  
}
