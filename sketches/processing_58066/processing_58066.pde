
float a = 0.0;
float s = 0.0;


// define shape variable
PShape logo;
PFont font;
float angle;
float jitter;


// set up app borders
void setup() {
// set the size of app
size(250,250);

// find shape
logo = loadShape("logo.svg");
font = createFont("Arial",12);
smooth();
frameRate(20);

shapeMode(CENTER);
}

// draw shape
void draw() {
// set background
background(255,255,255);


a = a + 0.04;
  s = cos(a)*2;
  


// during even-numbered seconds (0, 2, 4, 6...)
if (second() % 2 == 0) {
jitter = random(-0.1, 0.1);
}

// start our animation loop
angle = angle + jitter;
float c = cos(angle);

// reposition object so it is in center of screen
translate(width/2, height/2);
scale(s); 
rotate(c);
shape(logo, -5, 0, 215, 215);
}




