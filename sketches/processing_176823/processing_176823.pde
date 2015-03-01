
float counter1 = 0.0; // points in circle
float counter2 = 0.0; // points all

void setup() {
  size(640, 640);
  background(255);//keep the dots on screen
  ellipse(0, 0, 1280, 1280); //don't want the circle redrawed every frame
}

//r = quarter:square = 0.25*PI*sq(640) : sq(640)

void draw() {
  strokeWeight(5);
  float x = random(641);
  float y = random(641);
  float d = dist(x, y, 0, 0);
  
  if ( d <= 640) { //in quarter of circle
    stroke (255, 0, 0);
    counter1 ++;
  } else {
    stroke (255, 255, 0);
  }

  point(x, y);
  counter2 ++; 
 
  float pi = 4*counter1/counter2; //whole circle is 4*quarter circle(counter1)
  println("Estimate:"+pi);
}
