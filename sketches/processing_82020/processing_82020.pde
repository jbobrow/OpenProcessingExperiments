
float [] yr = { 
  1990, 1996, 1998, 1998.5, 1999, 2004, 2007, 2008, 2009, 2009.5
}; // Independent Variable
float [] fl = { 
  60, 64, 78, 83, 98, 101, 107, 108, 127, 189
}; // Dependent Variable

// Setup Arrays and Get Properties 
int yrnumb = yr.length;
int flnumb = fl.length;
float [] yrad = new float[yrnumb];
float [] flad = new float[flnumb];
int [] ptx = new int [yrnumb];
int [] pty = new int [flnumb];
float yrmin = min(yr);
float flmin = min(fl);

// Establish Graph Space
int spacex;
int spacey;
int graphx;
int graphy;

PFont f;  // Define font


void setup() {
  //Set Window and Font Properties
  frameRate(30);
  smooth();
  size(800, 600); 
  f = createFont("Arial", 14, true);
  
  // Set Graph Space Properties - Change .07 to whatever margin you'd like arround your graph
  spacex = int(.07*width);
  spacey = int(.07*height);
  graphx = int(width-2*spacex);
  graphy = int(height-2*spacey);

  // Load Adujusted Arrays
  for (int i=0; i<yrnumb; i++) {
    yrad[i] = yr[i]-yrmin;
    flad[i] = fl[i]-flmin;
  }
  for (int i=0; i<yrnumb; i++) {
    ptx[i] = int((yrad[i]/max(yrad))*(graphx-2*spacex)+2*spacex); 
    pty[i] = height-int((flad[i]/max(flad))*(graphy-2*spacey)+2*spacey);
  }
}


void draw() {
  //Draw Background
  background(#5FC0CE); 
  stroke(255, 255, 255);

  //Draw Graph
  line(int(spacex), int(spacey), int(spacex), int(height-spacey));
  line(int(spacex), int(height-spacey), int(width-spacex), int(height-spacey));
  noStroke();

  //Draw Points
  color(255, 255, 255);
  for (int i = 0; i<yrnumb; i++) {
    ellipse(ptx[i], pty[i], 10, 10);
  }
  stroke(255, 255, 255);
  for (int i = 0; i<yrnumb-1;i++) {
    line(ptx[i], pty[i], ptx[i+1], pty[i+1]);  //Only works if independent variable array is ordered from least to greatest
  }
  noStroke();

  // Display Text on Mouse Over
  for (int i=0; i<yrnumb; i++) {
    if (mouseX>ptx[i]-5 && mouseX<ptx[i]+5 && mouseY<pty[i]+5 && mouseY>pty[i]-5) {

      textFont(f, 14);
      text("Height: " + int(fl[i]) + " feet", ptx[i]-20, pty[i]-20);
      text("Year: " + int(yr[i]), ptx[i]-20, pty[i]-33);
    }
  }
}


