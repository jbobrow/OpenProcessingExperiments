

float spacing;
float columns;
float rows;
PVector mousePos;

void setup() {
  size(700,700);
  spacing = 20;
  columns = int(width/spacing);
  rows = int(height/spacing);
}

void draw() {
  background(30);
  mousePos = new PVector(mouseX,mouseY);
  stroke(200);
  for(int i = 0; i < columns; i++){
    for(int j = 0; j < rows; j++){
      //point(i*spacing,j*spacing);
      Ticks(i*spacing, j*spacing);
      //rect(i*spacing,j*spacing,spacing,spacing);
    }
  }
}


void Ticks(float x, float y) {
  PVector pos = new PVector(x,y);
  point(pos.x,pos.y);
  //float mouseMag =
  stroke(random(100,255));
  //PVector lineDir = new PVector(mousePos.x-pos.x, mousePos.y-pos.y);
  PVector lineTarget = new PVector(mouseX, mouseY);
  lineTarget.sub(pos);
  lineTarget.mult(-1);
  
  pushMatrix();
  translate(pos.x,pos.y);
  lineTarget.normalize();
  lineTarget.mult(10);
  line(0,0, lineTarget.x,lineTarget.y);
  popMatrix();
}


