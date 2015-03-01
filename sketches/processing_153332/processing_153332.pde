
/**
 * Rainbow Tops
 *
 * By Juan Sebastian Robles Jimenez
 *
 * I don't know what I did here...
 * 's' Saves the actual frame.
 * 
*/


int nTops = 20;

float posX[];
float posY[];
float dx[];
float dy[];
int topGap = 10;
int nFrames = 0;

void setup()
{
  size(800, 600);
  background(0);
  frameRate(60);
  
  posX = new float[nTops];
  posY = new float[nTops];
  dx = new float[nTops];
  dy = new float[nTops];
  
  for (int i = 0; i < nTops; ++i) {
    posX[i] = random(0, width);
    posY[i] = random(0, height);
  }
  
}

void draw()
{
 //blendMode(BLEND); NOT ALLOWED IN PROCESSINGJS
  
  // For the lights effects
  //if (nFrames % 5 == 0) {
    fill(0, 9);
    rect(0, 0, width, height);
 // }
  
 
  for (int i = 0; i < nTops; ++i) {
    
    drawSpinner(posX[i], posY[i], (nFrames % 60) + 1, topGap);
    
    dx[i] = 20 * cos(random(-TWO_PI, TWO_PI));
    dy[i] = 20 * sin(random(-TWO_PI, TWO_PI));
    
    dx[i] *= ((posX[i] > width - 80 || posX[i] < 80) && dx[i] < 0 ? -1 : 1);
    dy[i] *= ((posY[i] > height - 80 || posY[i] < 80) && dy[i] < 0 ? -1 : 1);
    
    posX[i] += dx[i];
    posY[i] += dy[i];
    
    posX[i] = posX[i] > width - 80 ? width - 80 : posX[i];
    posY[i] = posY[i] > height - 80 ? height - 80 : posY[i];
    posX[i] = posX[i] < 80 ? 80 : posX[i];
    posY[i] = posY[i] < 80 ? 80 : posY[i];
  }
  
    // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("rainbow_tops_" + nFrames + ".jpg");
  }
  
  ++nFrames;
}

void drawSpinner(float x, float y, int radius, int nGap) 
{
  
  stroke(255);
  strokeWeight(5);
  point(x, y);
  noFill();
  strokeWeight(1);
  ellipse(x, y, radius * 2, radius * 2);
  stroke(0);
  
  fill(random(0, 255), random(0, 255), random(0, 255));
  
  // Drawing the lights
  for (int i = 0; i < nGap; ++i) {
    float px = x + radius * cos(i * (TWO_PI / nGap));
    float py = y + radius * sin(i * (TWO_PI / nGap));
    ellipse(px, py, 10, 10);    
  }
  
}
