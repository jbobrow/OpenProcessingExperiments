
int g = 50;

float positionX = 50;
float positionY = 50;


void setup() { 
  size(500,500);
  smooth();
}

void draw() {
  background(255,0,0);
  
  //zufallsposition:
  positionX = random(0,width);
  positionY = random(0,width);
  
  //wachsen:
  g = g + 1;
  ellipse(positionX, positionY, g, g);
  
}

void keyPressed(){
  saveFrame("rotweiss.png");
}

  


