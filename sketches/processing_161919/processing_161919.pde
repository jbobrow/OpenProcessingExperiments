
// inspired by kandinsky's theory, try to make a big circle in center a quiet 
// place for the eye and outside of the circle a dangerous place for the eye
// I play with correspondances between shapes and colors
// playing on the contrast between triangle and circle and between yellow and blue
// tell me if inside the big circle you fell restness

int nMaxCircle=70; // number max of circles
int nMaxTriangle=70; // number max of triangle


int bigCircleX;
int bigCircleY;
int bigCircleRadius;
int bigCircleFat;
int nTriangle=0; // number of triangles
int nextNdxTriangle = 0; // index of the next tirangle to add
float[][] trianglesX; // list of triangles x triangleX[i][n] is x of the ith point of the nth triangle
float[][] trianglesY; // list of triangles y triangleY[i][n] is y of the ith point of the nth triangle
float[] trianglesC; // list of triangles color
int sizeOfTriangle;
int nCircle=0; // number of circles
int nextNdxCircle = 0; // index of the next circle to add
float[] circlesX; // list of circles x 
float[] circlesY; // list of circles y
float[] circlesR; // list of radius
float[] circlesC; // list of colors
int sizeOfCircle;

float sizeOfTheText = 0;
boolean mouseWasPressed = false;

void setup(){
  size(800,600);
  colorMode(HSB,100);
  smooth();
  // compute size of the big circle
  bigCircleX = width/2;
  bigCircleY = height/2;
  bigCircleRadius = min(width, height)*2/3;
  bigCircleFat = max(2, min(width, height)/20);
  // set size of triangles and circles
  sizeOfTriangle = int(50.0 / 800.0 * width);
  sizeOfCircle = int(70.0 / 800.0 * width);
  
  // init the list of triangles and circles
  trianglesX = new float[3][nMaxTriangle];
  trianglesY = new float[3][nMaxTriangle];
  trianglesC = new float[nMaxTriangle];
  circlesX = new float[nMaxCircle];
  circlesY = new float[nMaxCircle];
  circlesR = new float[nMaxCircle];
  circlesC = new float[nMaxCircle];
}

void draw(){
  // clear image
  background(100, 0, 100); // white
    
  if( nTriangle > 0 || nCircle > 0){
    // draw triangles added when mouse is moving
    for(int n=0; n < nTriangle; n++){
      stroke(0);
      strokeWeight(1);
      fill(trianglesC[n], 100, 100);
      triangle(trianglesX[0][n], trianglesY[0][n], 
               trianglesX[1][n], trianglesY[1][n], 
               trianglesX[2][n], trianglesY[2][n]); 
    }
  
    //draw big circle
    stroke(0);
    fill(100, 0, 100); // white
    strokeWeight(bigCircleFat);
    ellipse(bigCircleX, bigCircleY, 
            bigCircleRadius, bigCircleRadius);
  
    //draw circles when mouse is moving
    for(int n=0; n < nCircle; n++){
      stroke(0);
      strokeWeight(1);
      fill(circlesC[n], 100, 100);
      ellipse(circlesX[n], circlesY[n], 
              circlesR[n], circlesR[n]); 
    }
  
  }
  if(sizeOfTheText > .1){
    pushMatrix();
    translate(width/2, height/2); // center the text in the middle of the canva
    scale(sizeOfTheText*2);  // size it    
    sizeOfTheText = sizeOfTheText*.995; // size is getting more little
    textAlign(CENTER, CENTER); // center the text
    textSize(height/9/*32*/); // font size one 9th of the canva
    noStroke();
    fill(42,20,100,sizeOfTheText*255); // color and alpha to make it vanish
    // print the text
    text("Move mouse Please", 0, -1*height/9);
    text("And feel what you feel", 0, 0*height/9);
    text("press S key to save", 0, 2*height/9);
    popMatrix();
  }  
}

void keyReleased()
{
  if(key == 's' || key <= 'S') {
    saveFrame("screenshoot.png");    
  }
}

void mousePressed(){
  mouseWasPressed = true;
  // populate with triangles and circles
  for(int i=0; i<nMaxTriangle+nMaxCircle; i++) {
    addItem(int(random(width)), int(random(height)));
  }
  sizeOfTheText = 1;
}

void mouseMoved(){
  // add  a triangle and/or circle
  if(mouseWasPressed) addItem(mouseX, mouseY);
}

// function to add a circle or a triangle
// if the point (x,y) is out the big circle then add a yellow triangle
// othewise add a bleu circle (not very often)
// sometimes a triangle is added whereas it is inside the circle
void addItem(int x, int y){  //coordonate of the mouse cursor from center of bigCircle
  int mX = x-bigCircleX;
  int mY = y-bigCircleY;
  //if the point (x,y) outside the BigCircle then add triangles else (inside) add circles
  // (Pythagore theorem ;-) )
  if(mX*mX + mY*mY > bigCircleRadius*bigCircleRadius/4){
    // sometimes add triangle near the point (x, y)
    if(random(10)>7) {addTriangle(x + random(width/30), y + random(height/30));}
    // sometimes add circle anywhere
    else             {addTriangle(random(width), random(height));}
  } else { // the point (x, y) is inside the big circle
    // 20% chance to add circle, then not many circles
    if(random(10)>8) addCircle(x + random(-10,10), y + random(-10,10));
    // very seldom add a triangle outside
    if(random(100)>98) addTriangle(random(width), random(height));
  }
}

void addTriangle(float x, float y){
  for(int i =0; i < 3; i++){
    trianglesX[i][nextNdxTriangle] = x + random(-1 * sizeOfTriangle,sizeOfTriangle);
    trianglesY[i][nextNdxTriangle] = y + random(-1 * sizeOfTriangle,sizeOfTriangle);
  }
  trianglesC[nextNdxTriangle] = random(15, 17);
  nextNdxTriangle++; // prepare the index of the next triangle to add
  // if more than max triangle, next one is the first so older triangle will go away
  if(nextNdxTriangle >= nMaxTriangle) nextNdxTriangle=0; 
  nTriangle=max(nTriangle,nextNdxTriangle); // update number triangles to draw
}

void addCircle(float x, float y){
  circlesX[nextNdxCircle] = x;
  circlesY[nextNdxCircle] = y; 
  circlesR[nextNdxCircle] = random(sizeOfCircle);
  circlesC[nextNdxCircle] = random(60,85);
  nextNdxCircle++; // prepare the index of the next circle to add
  // if more than max triangle, next one is the first so older circle will go away
  if(nextNdxCircle >= nMaxCircle) nextNdxCircle=0; 
  nCircle=max(nCircle,nextNdxCircle); // update number circles to draw
}


