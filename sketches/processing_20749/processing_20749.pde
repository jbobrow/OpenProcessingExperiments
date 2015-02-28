
void setup(){
  size(1024, 680);
  background(#000000);
  strokeWeight(2);
  smooth();
}

int startX;
int startY;
int magnitude = 0;
int numSaves = 0;

void draw(){
  int[] colorVals = new int[3];
  colorVals[0] = 0;
  colorVals[1] = 0;
  colorVals[2] = 0;

  if (mousePressed){
    noStroke();
    fill(0,0,0,4);
    rect(0,0,1028,680);
    strokeWeight(2);
    for (int k=0; k<3; k++)
    {
      colorVals[k] = int(random(0,255));
    }
    stroke(colorVals[0], colorVals[1], colorVals[2]);
    int deltaStartX = int(random(0-magnitude, magnitude));
    int deltaStartY = int(random(0-magnitude, magnitude));
    int deltaMouseX = int(random(0-magnitude, magnitude));
    int deltaMouseY = int(random(0-magnitude, magnitude));
    bezier(startX, startY, startX-deltaStartX, startY-deltaStartY,
        mouseX-deltaMouseX, mouseY-deltaMouseY, mouseX, mouseY);
    magnitude+=3;
  }
}

void mousePressed(){
  startX = mouseX;
  startY = mouseY;
}

void mouseReleased(){
  magnitude = 0;
}

void keyPressed(){
  if (int(key) == 32){
    stroke(0,0,0);
    fill(0,0,0);
    rect(0,0,1080, 680);
  }
  else if(int(key) == 115){
    saveFile();
  }
}

void saveFile(){
  String savePath = selectOutput();
  if (savePath == null) {
    println("no output assigned");
  } else {
    save(savePath);
  }
}

