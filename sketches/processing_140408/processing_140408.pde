
int lines = 1;
int maxLines = 500;
int[] oldX = new int[maxLines];
int[] oldY = new int[maxLines];

float[] reds = new float[maxLines];
float[] greens = new float[maxLines];
float[] blues = new float[maxLines];
int alphaBg = 1;

void setup() {
 size(400, 400); 
 background(255);
 
  for (int i = 0; i < maxLines; i++) {
    oldX[i] = (int) random(0, width);
    oldY[i] = (int) random(0, height);
  }
}

void draw() {
  //fill(0,0,0,alphaBg);
  //rect(0,0,width,height);
  for (int i = 0; i < lines; i++) {
    if (oldX[i] == 0) {
      oldX[i] = (int) random(0, width);
    }
    if (oldY[i] == 0) {
      oldX[i] = (int) random(0, height);
    }
    
    int dX = (int) (random(-15, 15)) + (mouseX-pmouseX)/10;
    int dY = (int) (random(-15, 15)) + (mouseY-pmouseY)/10;
    
    if (dX + oldX[i] > width || dX + oldX[i] < 0) {
      dX *= -1;
    }
   
   
    if (dY + oldY[i] > width || dY + oldY[i] < 0) {
      dY *= -1;
    } 
    
    reds[i] = reds[i] >= 250 ? 247 : reds[i] <= 10 ? 12 : reds[i] + random(-10, 10);
    greens[i] = greens[i] >= 250 ? 247 : greens[i] <= 10 ? 12 : greens[i] + random(-10, 10);
    blues[i] = blues[i] >= 250 ? 247 : blues[i] <= 10 ? 12 : blues[i] + random(-10, 10);
    
    stroke(reds[i],greens[i],blues[i]);
    line(oldX[i], oldY[i], dX+oldX[i], dY+oldY[i]);
    
    oldX[i] = dX+oldX[i];
    oldY[i] = dY+oldY[i];
  }
  
  if (mousePressed && lines < maxLines) {
    lines++;
  }
  
  if (keyPressed && lines > 0) {
    lines--;
  }
}
