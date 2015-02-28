
float d=10;



void setup() {
  size(500,500);
}

void draw() {
  background(73,156,206);
  stroke(143,73,206);
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(width/2, height/2,d,d); 
  
 
}
void mousePressed() {
  d=d+10;
  //saveFrame("kreis.png");
  
}


void keyPressed(){

  d=10;
}
  

