
void setup(){
  size(400, 400);
  background(255);
  noStroke();
  mousePressed();
}

void draw(){
}

void mousePressed(){
  background(255);
  int n = int(random(300)+100);
  for(int i=0; i<n; i++){
    fill( color( random(255), random(255), random(255), random(50) ) );
    rect( random(width+30)-30, 0, random(30), height );
  }
}


