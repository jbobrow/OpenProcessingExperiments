
PShape ID;
PShape logo;
float angle;
float jitter;
float timer;
 
void setup() {
size(610,200);
ID = loadShape("ID.svg");
logo = loadShape("logo.svg");
 
smooth();
frameRate(50);
shapeMode(CENTER);
}
 
void draw() {
background(255,255,255);
 
timer++;
 
// during even-numbered seconds (0, 2, 4, 6...)
//if (second() % 7 == 0) {
//  jitter=2.5;
//}

if ((timer > 349) && (timer < 830)) { // IF TIMER IS BETWEEN 7 AND 17 SECONDS
    jitter = 2.5; // SET ROTATE
  } else { // IF NOT
    jitter = 0; // ROTATE IS 0
}

angle = angle+jitter;

pushMatrix();
float c = cos(angle);
 
translate(width/7, height/2);
rotate(angle*TWO_PI/300);
shape(logo, 0, 0, 100, 100);
popMatrix();
 
translate(width/1.7, height/2);
shape(ID, 0, 0, 450, 125);
 
}


