
int i = 000;
  
void setup() {
    size(450, 450);
    background(255);
    smooth();
    //strokeWeight(15);
    frameRate(60);
}
void draw() {
    background(255);
    int lineCount = 36;
      stroke(44, 33, 99, 100);
      
    for (int i = 0; i < lineCount; i++) {
      int maxI = lineCount - 1;
      float tempIWidth = (float)i/maxI*width;
      float tempIHeight = (float)i/maxI*height;
      line(tempIWidth, 0, width, tempIHeight);
      line(width, tempIHeight, width - tempIWidth, height);
      line(width - tempIWidth, height, 0, height - tempIHeight);
      line(0, height - tempIHeight, tempIWidth, 0);
    }
    
    for (int i = 0; i < lineCount/2; i++) {
      int maxI = lineCount/2 - 1;
      float tempIWidth = (float)i/maxI*width/2;
      float tempIHeight = (float)i/maxI*height/2;
      line(tempIWidth + width/2, 0, width, tempIHeight);
      line(width, tempIHeight + height/2, width - tempIWidth, height);
      line(width/2 - tempIWidth, height, 0, height - tempIHeight);
      line(0, height/2 - tempIHeight, tempIWidth, 0);
    }
    
    for (int i = 0; i < lineCount/2; i++) {
      int maxI = lineCount/2 - 1;
      float tempIWidth = (float)i/maxI*width/2;
      float tempIHeight = (float)i/maxI*height/2;
      line(tempIWidth, tempIHeight, width/2, height/2 - tempIHeight);
      line(width/2, height/2 - tempIHeight, width - tempIWidth, tempIHeight);
      line(width - tempIWidth, tempIHeight, width/2 + tempIWidth, height/2);
      line(width/2 + tempIWidth, height/2, width - tempIWidth, height - tempIHeight);
      line(width - tempIWidth, height - tempIHeight, width/2, height/2 + tempIHeight);
      line(width/2, height/2 + tempIHeight, tempIWidth, height - tempIHeight);
      line(tempIWidth, height - tempIHeight, width/2 - tempIWidth, height/2);
      line(width/2 - tempIWidth, height/2, tempIWidth, tempIHeight);
    }
     
    //line(0, 0, width, height);
     
    noLoop();
}

