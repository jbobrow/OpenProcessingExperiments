
void setup(){
  fill(255);
  size(400,400);
  background(30);
  noStroke();
  
}

void draw(){
  drawStars(300); //<-------Make more stars!
  drawPlanet(100, 100, 100, 100); // <---Why can't this pass 100?
  drawPlanet(300, 300, 300, 5);
}

void drawPlanet(int x, int y, int size, int num){
 float redval = 255/num;
 float jump = size/num;
  for(int i=0; i<num; i++){
    fill (i* redval, 0, 0);
    ellipse(x, y, size-i*jump, size-i*jump);
  }
}

void drawStars(int stars){
for(int j=1; j<stars+1; j++){
  noLoop();
  fill(255);
  ellipse (random(400), random(400), 1, 1);
  }   
}

