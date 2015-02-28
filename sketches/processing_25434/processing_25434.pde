
  float wideInit = -0.01;
  float highInit = 200;
  float wide = wideInit;
  float high = highInit;
  
  float xIncrement = 1;
  float xInit = -parabolaX (0, wide, high);
  float x = xInit;
  float y;


void setup () {
  size(600, 600);
  smooth();
}

void draw () {
  background(0, 10);  
  translate(300, 500); //move origin
  
//  text (wide, 0, 0);
//  text (high, 0, 20);
//  text (xIncrement, 0, 30);
  
  if (keyPressed && (key == CODED)) {

    //if up key pressed increase height
    if (keyCode == UP && high <= 450) {
      high += 2;
    
    //if down key, decrease
    }else if (keyCode == DOWN && high >= 30) {
      high -= 2;
      
    //if right key pressed increase width
    }else if (keyCode == RIGHT && wide + 0.01 < 0) {
      wide += 0.01;
      
    //if left key, decrease
    }else if (keyCode == LEFT && wide - 0.01 > -0.5) {
      wide -= 0.01;  
    }
    
  }else if (keyPressed) {
    
    //if '.' key pressed decrease speed
    if (key == '.' && x < 10) {
      xIncrement += 0.1;
      
    //if '.' key, increase
    }else if (key == ',' && xIncrement - 0.1 > 0) {
      xIncrement -= 0.1;
    }
  }

  y = parabolaY (x, wide, high);
  ball(x, -y);
  
  //keep the ball looping
  if ((x <= -xInit) && (y >= 0)) {
    x += xIncrement;
  }else{
    xInit = -parabolaX (0, wide, high);
    x = xInit;
  }
}

//draws a ball at (x, y)
void ball (float x, float y) {
//  println(x + " " + y);
  ellipse(x, y, 10, 10);
}

//returns y-value of parabola
float parabolaY (float x, float wideness, float highness) {
  //equation of parabola
  float y = wideness*(x*x) + highness;

  return y;
}

//returns x-value of parabola
float parabolaX (float y, float wideness, float highness) {
  //equation of parabola
  float x = sqrt((y - highness)/wideness);

  return x;
}

