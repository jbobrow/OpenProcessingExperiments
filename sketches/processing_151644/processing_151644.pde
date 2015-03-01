
int frame_rate_value;
int col1;
int col2;
int col3;
void setup() {

  // make the display window the full size of the screen
  size(600, 600);

  frame_rate_value = 12;
  rectMode(CENTER);
  background(0);
}


void draw() {

  background(0);

  int num = 20;
  int margin = 0;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

doble (mouseX); //double

  int circleNumber = 0; // counter
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      circleNumber = (i * num) + j; // different way to calculate the circle number from w2_04

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber);
    }
  }
} //end of draw 


void movingCircle(float x, float y, float size, int offset) {

  float circlePeriod = (float)frame_rate_value;
  float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;

  float circleSize = size * 2.0 * sin(circleAge * HALF_PI);
 
  
  
  strokeWeight(2);
  stroke( col1%255, col2%255, col3%255, lerp(255, 0, circleAge));
  fill(lerp(128, 0, circleAge), lerp(120, 0, circleAge));
  ellipse(x-size/2, y-size/2, circleSize, circleSize);
}


void doble (float x){

  if (keyPressed == true && key == 'd') {
  //void frames (float x) {
  col1=mouseX;
  col2=mouseX+mouseY;
  col3=mouseY;
         
    if (x < width/2) {
    frame_rate_value = int(map(x, 0, width/2, 2, 60));
   }
   if (x > width/2) {
     frame_rate_value = int(map(x, width/2, 0, 60, 120));
   }
    
  }  //if keyPressed


/*
*/ if (mousePressed == true){


  col1=mouseX;
  col2=mouseX+mouseY;
  col3=mouseY;
   
  if (mouseX < width/2 && frame_rate_value < 120 ) {
   frame_rate_value = int(map(x, 0, width/2, 2, 60));
   // ++frame_rate_value;
  }

 
  if (mouseX  > width/2 && frame_rate_value > 2) {
    frame_rate_value = int(map(x, width/2, 0, 60, 120));
   // --frame_rate_value;  
}
} //if mousePressed 
  println("mouse position: " + frame_rate_value);

}

void keyReleased() {

  // right arrow -- increase frame_rate_value
  if (keyCode == RIGHT && frame_rate_value < 120) {
    frame_rate_value++;
  }

  // left arrow -- decrease frame_rate_value
  if ( keyCode == LEFT && frame_rate_value > 2) {
    frame_rate_value--;
  }

  // print the current value on the screen
  println("Current frame Rate is: " + frame_rate_value);
}

