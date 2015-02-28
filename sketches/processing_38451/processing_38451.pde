
void setup() {
  size(500, 500);
  smooth();
  colorMode (RGB, height+width/20); //Changing the color scale
}

int numOfWalls = 2; // pre-determined number of curved walls
int numOfObjects = 15; // pre-determined number of Objects or "program elements"


//producing a random variation of the studio project's program

void draw() {
  if (mousePressed == true) {
    for (int x = 0; x < numOfObjects; x++) {
      largeRed(); //see below for function
      smallRed(); //see below for function
      float rectSize = (1000);
      strokeWeight(1.5);
      rect(random(width/1.5), random(height/1.5), random(width/5), random(height/5));
      noLoop(); //cancels the computer from running the rects to infinity
    }
  }


//keeping the walls static

  else {
    for (int y = 0; y < numOfWalls; y++) {
      //float arcSize = random(1000);
      noFill();
      strokeWeight(7);
      arc(width/2, height/2, 400, 400, PI/2, PI);
      arc(width/5, height/2, 400, 400, TWO_PI-PI/2, TWO_PI);
    }
  }
}





// FUNCTIONS BELOW 


// function that returns random rect SIZE and LOCATION
void myRect (float x, float y, float w, float h) {
  rect (random(width), random(height), random(width), random(height));
}



//function that returns a lighter red for large to largest rects 
void largeRed() {

  int lgrd = floor(random(1, 4));

  if (lgrd == 1) {
    fill (255, 0, 0, 50);
  };
  if (lgrd == 2) {
    fill (255, 0, 0, 60);
  };
  if (lgrd == 3) {
    fill (255, 0, 0, 70);
  };
}



//function that returns a darker for small to smallest rects
void smallRed() {
  int smrd = floor(random(1, 4));

  if (smrd == 1) {
    fill (255, 0, 0, 80);
  };
  if (smrd == 2) {
    fill (255, 0, 0, 90);
  };
  if (smrd == 3) {
    fill (255, 0, 0);
  };
}


