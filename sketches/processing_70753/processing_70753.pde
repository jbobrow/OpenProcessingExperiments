
float angle;
float rad;

float[] xPos= new float[12];
float[] yPos= new float[12];

void setup() {
  size(800, 800 );
angle= 0;
rad=200;

for (int i=0;i<12;i++) {
    xPos[i] = cos (radians(30*i)) * rad; //each loop will increase the angle by 10
    yPos[i] = sin (radians(30*i)) * rad;
}
}
void draw() {


background(100);
angle+=0.1;

stroke(0);
strokeWeight(10);
line(width/2+20, height/2-20, width/2-20, height/2+20);
line(width/2-20, height/2-20, width/2+20, height/2+20);

translate (width/2, height/2);
for (int i=0; i<12; i++) {
  noStroke();
  smooth();
 fill((map(mouseX, 0, 800, 0, 255)), 0, 255, random(0, 255));
  ellipse( xPos[i], yPos[i], 50, 50);

//donen sey
  pushMatrix();
  rotate(angle);
  noStroke();
  smooth();
  fill(100);
  ellipse(150, 150, 60, 60);


  popMatrix();
}
}

