
int SEGNUM=8;
int segmentSize;
ArrayList<PVector> orbz;
int COLOR = 0;

void setup() {
  size(600, 400);
  segmentSize = height/SEGNUM;
  background(240);
  mouseX = width/2;
  mouseY = height/2;
  orbz = new ArrayList<PVector>();
  //hint(ENABLE_STROKE_PURE);
  smooth();
  noFill();
}

void draw() {
  
}
void mousePressed() {
  orbz.add(new PVector(mouseX, mouseY));
  
  //main lines
  strokeWeight(1);
  
  stroke(COLOR, noise(mouseX, mouseY)*100);
  //stroke(0,100);
  
  for (int i = 1; i < orbz.size(); i++) {
    line(orbz.get(i-1).x, orbz.get(i-1).y, 
    orbz.get(i).x, orbz.get(i).y); 
  }
  
  // border lines
  
  for (int j = 0; j <= SEGNUM; j++) {
      
      stroke(COLOR, noise(mouseX, j*segmentSize)*100);
      
      line(0, j*segmentSize, mouseX, mouseY);
      
      stroke(COLOR, noise(mouseX, j*segmentSize)*100);
      line(width, j*segmentSize, mouseX, mouseY);
    }


    for (int j = 0; j < width/segmentSize; j++) {
      stroke(COLOR, noise(j*segmentSize, mouseY)*100);
      line(j*segmentSize, 0, mouseX, mouseY);
      
      stroke(COLOR, noise(j*segmentSize, mouseY)*100);
      line(j*segmentSize, height,mouseX, mouseY);
    } 
}

void keyPressed() {
  if (key == 's') {
    save("diagonal.tif");
  } 
  
  if (key == 'c') {
   background(240);
    orbz.clear(); 
  }
}


