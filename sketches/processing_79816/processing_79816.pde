
void setup () {
  size(500,500);
  noStroke();
  smooth();
}

void draw(){
  float x = mouseX;
  float y = mouseY;
  float x1= random(500);
  float y1=random(500);
  float xi = x1-x;
  float yi = y1 - y;
  fill (random (255) , random (255 ) , random(255));
  ellipse(250 , 250 , x , y );
}


