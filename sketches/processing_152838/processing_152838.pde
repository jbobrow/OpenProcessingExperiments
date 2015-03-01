
int     num;    // the number of items in the array (# of circles)

float[] stopped;
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle

float red = 120;
float green = 120;
float blue = 120;

void setup() {
  size(500, 500);

  num = 20;
  
  stopped = new float[num];
  // allocate space for each array
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(10);
    phase[i] = random(TWO_PI);
    stopped[i] = -1.0;
  }
}


void draw() {
  background(red, green, blue);




  for (int i=0; i<num; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    float x = calculateX(speed[i],phase[i], stopped[i]);
    ellipse(x, y[i], 20, 20);
  }
}

void mouseClicked(){
    for (int i=0; i<num; i++) {
        float x = calculateX(speed[i],phase[i], stopped[i]);
        println("distance : " + dist(mouseX,mouseY,x, y[i]));
        if (dist(mouseX,mouseY,x, y[i]) < 20){
          if (stopped[i] < 0){
              stopped[i] = x;
              break;
          } else {
             stopped[i] = -1.0;
             speed[i] = random(10);
             phase[i] = random(TWO_PI);
             break;
          }          
        }
    }
    println("---exit mousePressed---"); 
    
}

float calculateX(float speed, float phase, float stopped) {
  float aux = width/2 + sin(radians(frameCount*speed ) + phase)* 200;
  if (stopped > 0) return stopped;
  return aux;
} 

// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}

