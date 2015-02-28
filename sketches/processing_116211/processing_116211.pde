
int cols = 20;
int rows = 20;

float distance = 50; //distance of slider
boolean rollover = false;


int total = 3; // number of sliders

//rectangle's width,height
float rw = 12;
float rh = 10; 

float sliderX = 410;
float sliderY; // slider's y 

float sliderStart = sliderX;
float sliderEnd = 500;
float offsetX = 0;

//----Array----//

Grid[][] gridArray;
ColorSlider [] sliders = new ColorSlider[total];



//-----------setup-----------//

void setup() {
  size(520, 400);



  //add grid array
  gridArray = new Grid [cols][rows];
  for (int i = 0 ; i < cols ; i++) {
    for (int j = 0 ; j < rows; j++) {
      gridArray[i][j] = new Grid(i*20, j*20, 20, 20);
    }
  }



  //add slider array
  for (int i = 0; i<sliders.length; i++) {
    sliders[i] = new ColorSlider(distance+i*50); // slider's y distance is 50
  }
}


//----------draw-----------//

void draw() {

  background(200); // background color of toolbar

  //array grids
  for (int i = 0 ; i < cols; i++) {
    for (int j = 0 ; j < rows; j++) {
      gridArray[i][j].display();
    }
  }


  //array slider
  for (int i = 0; i< sliders.length;i++) {
    sliders[i].display();
  }

  // r =  float colorVal = map(sliders[0].sliderX, sliders[0].sliderStart,sliders[0].sliderEnd,0,255);


  float r = sliders[0].getColor();
  float g = sliders[1].getColor();
  float b = sliders[2].getColor();

  fill(r, g, b);
  rect (420, 200, 82, 50);
}


void mousePressed() {

  for ( int i = 0 ; i < cols; i++) {
    for ( int j = 0 ; j < rows; j++) {
      gridArray[i][j].click(mouseX, mouseY);
    }
  }


  sliders[0].pressed(mouseX, mouseY);
  sliders[1].pressed(mouseX, mouseY);
  sliders[2].pressed(mouseX, mouseY);


  //knows the position
  println("(x,y):" + mouseX + "," + mouseY);
}



void mouseReleased() {
  sliders[0].released();
  sliders[1].released();
  sliders[2].released();
}


class ColorSlider {


  //rectangle's width,height
  float rw = 12;
  float rh = 10; 


  float sliderX = 420;
  float sliderY; // slider's y 

  float sliderStart = sliderX;
  float sliderEnd = 500;
  float offsetX = 0;



  //is it being selected or dragged?
  boolean draggingOn = false; 


  ColorSlider(float tempY) {
    sliderY = tempY;

    //dragging always starts as off
    draggingOn = false;
  }

  //instead of void - calls the function
  //palette 
  float getColor() {
    float colorVal = map(sliderX, sliderStart, sliderEnd-rw, 0, 255);
    return colorVal;
  }

  void pressed( int mx, int my) {
    if ( mx > sliderX && mx < sliderX+ rw && my > sliderY && my < sliderY+rh) {
      draggingOn =! draggingOn;
      offsetX = sliderX- mx;
    }
  }


  void released() {
    draggingOn = false;
  }




  void display() {

    if (draggingOn) {
      sliderX = mouseX + offsetX;
    } 


    sliderX = constrain ( sliderX, sliderStart, sliderEnd-rw);



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
}



class Grid {
  float x, y;
  float w, h;
  float myColorR, myColorG, myColorB;


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
      myColorR = map(sliders[0].sliderX, sliders[0].sliderStart, sliders[0].sliderEnd-rw, 0, 255);
      myColorG = map(sliders[1].sliderX, sliders[1].sliderStart, sliders[1].sliderEnd-rw, 0, 255);
      myColorB = map(sliders[2].sliderX, sliders[2].sliderStart, sliders[2].sliderEnd-rw, 0, 255);
    }
  }




  void display() {
    stroke(200);

    // the color changes based on the state of the button
    if (GridOn) {
      //color
      fill(myColorR, myColorG, myColorB);
    } 
    else {
      fill(255);
    }
    rect(x, y, w, h );
  }
}


