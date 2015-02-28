
PShape ID;
PShape logo;
float angle;
float jitter;

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



// during even-numbered seconds (0, 2, 4, 6...)
if (second() % 7 == 0) {
  jitter=2.5;
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




