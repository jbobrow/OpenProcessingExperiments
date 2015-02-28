
float resolution = 260; // how many points in the circle
float rad = 150;
float x = 1;
float y = 1;
//float prevX;
//float prevY;

float t = 0; // time passed
float tChange = .02; // how quick time flies

float nVal; // noise value
float nInt = 1; // noise intensity
float nAmp = 1; // noise amplitude

boolean filled = false;


void setup() {
  size(400, 400);
  noiseDetail(8);
}

void draw() {
  background(255);
  translate(width/2, height/2);

  if (filled) {
    noStroke();
    fill(0);
  } 
  else {
    noFill();
    stroke(0);
    strokeWeight(1);
  }
  nInt = map(mouseX, 0, width, 0.1, 30); // map mouseX to noise intensity
  nAmp = map(mouseY, 0, height, 0.0, 1.0); // map mouseY to noise amplitude

  beginShape();
  for (float a=0; a<=TWO_PI; a+=TWO_PI/resolution) {

    nVal = map(noise( cos(a)*nInt+1, sin(a)*nInt+1, t ), 0.0, 1.0, nAmp, 1.0); // map noise value to match the amplitude

    x = cos(a)*rad *nVal;
    y = sin(a)*rad *nVal;

    //    x = map(a, 0,TWO_PI, 0,width);
    //    y = sin(a)*rad *nVal +height/2;

//    vertex(prevX, prevY);
    vertex(x, y);

    //    line(x,y,x,height);

//    prevX = x;
//    prevY = y;
    
    }
  endShape(CLOSE);

  t += tChange;
}

void mouseClicked() { 
  filled = !filled; // toggle fill by click
}

