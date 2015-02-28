
//------ global variables--------//

int cols = 20;
int rows = 20;

float distance = 50; //distance of slider
boolean rollover = false;


float rw = 12;
float rh = 10; 


float sliderX = 420;
float sliderY; // slider's y 

float sliderStart = sliderX;
float sliderEnd = 500;
float offsetX = 0;


//is it being selected or dragged?
boolean draggingOn = false; 


//----Array----//

Grid[][] gridArray;



//----------------------------- setup

void setup() {
  size(520, 400);



  //add grid array
  gridArray = new Grid [cols][rows];
  for (int i = 0 ; i < cols ; i++) {
    for (int j = 0 ; j < rows; j++) {
      gridArray[i][j] = new Grid(i*20, j*20, 20, 20);
    }
  }
}

//----------------------------- draw

void draw() {

  background(#B9EFF5); // background color of toolbar
  display(50);
  mixingColors();

  //array grids
  for (int i = 0 ; i < cols; i++) {
    for (int j = 0 ; j < rows; j++) {
      gridArray[i][j].display();
    }
  }
}


void mousePressed() {

  for ( int i = 0 ; i < cols; i++) {
    for ( int j = 0 ; j < rows; j++) {
      gridArray[i][j].click(mouseX, mouseY);
      //color
    }
  }

  pressed(mouseX, mouseY);
}


void mouseReleased() {
  released();
}





//----------------------------- functions

void pressed( int mx, int my) {
  if ( mx > sliderX && mx < sliderX+ rw && my > sliderY && my < sliderY+rh) {
    draggingOn =! draggingOn;
    offsetX = sliderX- mx;
  }
}


void released() {
  draggingOn = false;
}



void display(float tempY) {

  sliderY = tempY;

  if (draggingOn) {
    sliderX = mouseX + offsetX;
  } 


  sliderX = constrain ( sliderX, sliderStart, sliderEnd - rw);



  //line for a slider
  stroke(100);
  strokeWeight(1);
  line(sliderStart, sliderY+rh/2, sliderEnd-2, sliderY+rh/2);

  if (draggingOn) {
    noStroke();
    fill(0);
  } 
  else {
    noStroke();
    fill(255);
  }

  rect(sliderX, sliderY, rw, rh);
}


void mixingColors() {
  float b = map(sliderX, sliderStart, sliderEnd-rw, 0, 255);
  fill(b);
  rect(sliderStart, 100, sliderEnd- sliderStart, 50);
}


class Grid {
  float x, y;
  float w, h;
  float myColor;

  //Grids starts with white
  boolean GridOn; 

  Grid(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;


    GridOn = false; // grids always starts as off
  }




  void click( int mx, int my) {
    // check to see if a point is inside the rectangle
    if ( mx > x && mx < x+ w && my> y && my < y+h) {
      GridOn =! GridOn;
      myColor = map(sliderX, sliderStart, sliderEnd-rw, 0, 255);
    }
  }




  void display() {
    stroke(200);



    // the color changes based on the state of the button
    if (GridOn) {
      fill(myColor);
    } 
    else {
      fill(255);
    }
    rect(x, y, w, h );
  }
}



