
//Drawing curves and art

int numPoints = 18;

PVector[] points = new PVector[numPoints];

boolean clicked = false;

float radius = 180;

void setup(){
  
  size(650,500);
  background(0);
  
  float angle = TWO_PI / numPoints;
  
  for(int i = 0;i < numPoints; i++){
    float x = cos(angle * i) * radius;
    float y = sin(angle * i) * radius;
    points[i] = new PVector(x, y);
  }
  //noLoop();
  smooth();
  
}//end of setup

void draw(){
  background(0);
  stroke(map(mouseX, 0, 200, 0, 200), map(mouseY, 0, 200, 0, 200), 125);
  
  translate(width/2, height/2);
  
  for(int i = 0; i < numPoints; i++){
    for(int j = 0; j < numPoints; j++){
      if(j != i)
        line(points[i].x, points[i].y, points[j].x, points[j].y);
    }
  }
  
}//end of draw

void mousePressed(){
  clicked = !clicked;
  if(clicked)
    noLoop();
  else
    loop();
  
}
