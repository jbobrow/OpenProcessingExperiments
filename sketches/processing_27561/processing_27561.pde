
//set values and types of variable of RGB.

float r = mouseX;
float g = 100;
float b = 150;

// set window size and enable anti-aliasing
void setup() {
  size(200,200);
  smooth();
}

//start loop
void draw() {

  if (r > 255) { //if 'r' is bigger than 255 set it to 255 (i.e. limit it)
    r = 255;
  } 
  else if(r < 0) { //if 'r' is smaller than 0 set it to 0 (limit it)
    r = 0;
  } 
  else {
    println("r = " + r); //print line to debug to make sure 0<r<255
  }



  if (mouseX <= 100) { //if mouseX is on the left increase 'r' value by 5
    r = r + 5;
  } 
  else if (mouseX > 100) { // if mouseX is on the right decrease 'r' value by 5
    r = r - 5;
  }
  background(r,g,b);
}


