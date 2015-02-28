
color[] dessert = {#9F9694, #791F33, #BA3D49, #F1E6D4, #E2E1DC};
color[] palette = dessert;

float x, y;
float radiusCircle = 100;

void setup(){
size(400, 400);
smooth();
background(palette[0]);
frameRate(5);
}

void draw(){
  pushMatrix();
  translate(width/2, height/2);
//circle using points
stroke(palette[4]);
strokeWeight(5);
for(float angle = 0; angle < 2*PI; angle += .1){
  x = cos(angle) * radiusCircle + mouseX;
  y = sin(angle) * radiusCircle;
  point(x, y);
}
stroke(palette[1]);
strokeWeight(5);
for(float angle = 0; angle < 2*PI; angle += .1){
  x = cos(angle) * radiusCircle - pmouseX;
  y = sin(angle) * radiusCircle;
  point(x, y);
}
popMatrix();
stroke(palette[4]);
fill(palette[0]);
ellipse(0, height/2, 50, 10+mouseY);

stroke(palette[4]);
fill(palette[0]);
ellipse(60, height/2, 50, 10+pmouseY);
}
