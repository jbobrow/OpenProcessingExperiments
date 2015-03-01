
// The idea is to draw stars with lines placed by the center of the lines
// finaly, with transparency, it should draw an abstract landscape, a kind of firework

// Code Blocks setup AND draw = OK
// Variables int OR float = OK AND
// Arrays Color Pallette = OK
// Loops While OR for =OK for

// color Pallette for the stroke of lines that will draw the stars
color[] pallette ={#0F6C7F, #6BE5FF, #1ED8FF, #52787F, #18ADCC, #9455FF, #FF771C};

// global variables to define variables for the position and the dimension of the stars
int rayon;
float centreX;
float centreY;

float angle;

int nombre_etoiles = 45;

// setup code block
// canvas min 800x600, max 1280x720
void setup() {
  size (1024, 700);
  background (#020146); 
  noLoop();
}

// draw code block
void draw() {
  
  background (#020146); 

  // local variables to calculate the coordinates of the points of each line
  float aX = centreX + cos(angle)*rayon;
  float aY = centreY + sin(angle)*rayon;
  float bX = centreX - cos(angle)*rayon;
  float bY = centreY - sin(angle)*rayon;
  
  // loop to draw each star; the varaibles depends on random
  // and creates each time a different star in position, dimension and color
  for (int n=0; n < nombre_etoiles; n++) {
    centreX = random(0, width);
    centreY = random(0, height-100);
    rayon = int(random(20, 200));
    
    int alpha = int(random(100, 255));
    stroke(pallette[int(random(1, 7))], alpha);
    
    // loop to draw 360 lines for each star
    for (int i=0; i<360; i++) {
      angle = i*PI/180;
      aX = centreX + cos(angle)*rayon;
      aY = centreY + sin(angle)*rayon;
      bX = centreX - cos(angle)*rayon;
      bY = centreY - sin(angle)*rayon;
      line(aX, aY, bX, bY);
    }
  }  
    
}


