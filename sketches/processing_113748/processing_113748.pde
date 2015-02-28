
//////////////////////////////////////////////////
// IDEA 9101 LAB 1 
// Assignment 2   : Interaction
// Lecturer       : Dr. Lian Loke & Ingrid Pohl
// Date           : 27/MAR/2013
// Submitted by Yoko Tomishima (ytom4097)
/////////////////////////////////////////////////
// vivid drawing tool


// Declair all the variables 
int CIRCLES = 1;
int MINI_CIRCLES = 2;
int FLOWERS = 3;
int TRIES = 4;
// Set itnitial draw mode to LINES
int drawMode = CIRCLES;
// Declair array x & y
float[] x,y;
float cx,cy;
int MAX_POINTS = 100;
int NUM_POINTS = 0;
// Declair a color array that stores color values
color[] myColors = new color[4];
color[] rainbowColors = new color[6];

// Set the action when certain key is released
void keyReleased() {
      // if 1 is released
     if (key == '1'){
       // Set draw mode to CIRCLES
       drawMode = CIRCLES;
     // if 2 is released
     }else if (key == '2'){
       // Set draw mode to MINI_CIRCLES
       drawMode = MINI_CIRCLES;
     // if 3 is released
     }else if (key == '3'){
       // Set draw mode to FLOWERS
       drawMode = FLOWERS;
     // if 4 is released
     }else if (key == '4'){
       // Set draw mode to TRIES
       drawMode = TRIES;
     // if s is released
     }else if(key == 's'){
       // save image as png
     save("myDrawing.png");
     }else if (key ==  CODED) {
     // if shift is released
     if (keyCode == SHIFT){
       // Erase drawing
       background(255);
   }
  }
}



//-------- Tools functions

void drawCircles(){
  // culcurate distance between mouse position
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  noStroke();
  // random color chosen from red range
  fill(250,random(100),random(100));
  // draw circles with different size
  ellipse(mouseX,mouseY,mouseX-300,mouseX-300);
  // random color chosen from blue range
  fill(random(100),random(150),255);
  // draw circles by flipping with different size
  ellipse(width-mouseX,height-mouseY,mouseX-300,mouseX-300);
}


void drawMiniCircles(){
  float r = dist(pmouseX,pmouseY,mouseX,mouseY)*0.3;
  // chose random color from the array
  int circleColor = floor(random(0,3));
  noStroke();
  // fill the circles with the chosen color
  fill(myColors[circleColor]);
  // draw circles
  ellipse(pmouseX,pmouseY,r,r);
}


void drawFlowers(){
  // random value for radius of the flower
  float radius = random(50);
  // get random number to chose color from the array
  int col = floor(random(0,5));
  // assign the color
  strokeWeight(1);
  stroke(rainbowColors[col]);
  // draw a flower shape
  for (int i = 0; i < 360; i+=12){
    float angle = radians(i);
    float cx = cos(angle) * radius;
    float cy = sin(angle) * radius;
    line(mouseX,mouseY,mouseX+cx,mouseY+cy);
  }
}


void drawTriangles(){
  //get random number to chose color from array
  int col = floor(random(0,5));
  noStroke();
  // fill with the chosen color
  fill(rainbowColors[col]);
  // draw different triangles if the distance between the points are less than 30
  for (int i = 0; i < NUM_POINTS; i++){
      float distance = dist(mouseX,mouseY,x[i],y[i]);
      if (distance < 30){
      float radius = random(100);
      float angle = random(60);
      float cx = cos(angle) * radius;
      float cy = sin(angle) * radius;
      triangle(mouseX,mouseY,x[i],y[i],x[i]+cx,y[i]+cy); 
      }
  }
      // store value to array
      x[NUM_POINTS] = mouseX;
      y[NUM_POINTS] = mouseY;
      // culcurate NUM_POINTS
      NUM_POINTS = (NUM_POINTS + 1) % MAX_POINTS;     
}

//-------- drawing functions end


void setup() {
  // Set background size 800 x 600
  size(800,600);
  // Allow to draw smoothly
  smooth();
  // Set color mode to RGB
  colorMode(RGB);
  // Assign background color to white
  background(255);
  // Set float x to array
  x = new float[MAX_POINTS];
  // Set float y to array
  y = new float[MAX_POINTS];
  // Put color values to the array
  myColors[0] = color(87,209,252);//light blue
  myColors[1] = color(219,252,87);// light green
  myColors[2] = color(255,250,144);// yellow
  myColors[3] = color(217,224,224); // gray
  rainbowColors[0] = color(252,54,60); //red
  rainbowColors[1] = color(252,101,0); //orange
  rainbowColors[2] = color(252,228,0); //yellow
  rainbowColors[3] = color(87,157,8); //green
  rainbowColors[4] = color(14,156,193);// light blue
  rainbowColors[5] = color(242,12,124);//pink 
}


void draw() {
  // initialise background to white
  fill(0);
  // Put instructions
  textSize(20);
  text("1,2,3,4 - brush", 20,40);
  text("SHIFT - erase", 20,60);
  text("s - save", 20,80);
  
  //When mouse is pressed check which mode
  if(mousePressed == true) {
  // if its CIRCLES 
  if (drawMode == CIRCLES){
    // draw with circles
    drawCircles();
  // if its MINI_CIRCLES
  }else if (drawMode == MINI_CIRCLES){
    // draw with small circles
    drawMiniCircles();
  // if its FLOWERS
  }else if (drawMode == FLOWERS){
    // draw with flower shape
    drawFlowers();
  // if its TRIES
  }else if (drawMode == TRIES){
    // draw with triangles
    drawTriangles();
  }
 }
}




