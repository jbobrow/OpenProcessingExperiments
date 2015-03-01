
/*
 * colorBlindness
 * created by @nomadiccreature (/twitter)
 * randomness with shapes and color 
 * Exploring processing #Sketch2
 * 
 */

void setup(){
  size (600,600);
}

void draw() {
  randomShape();
  randomEllipse();
}

//Draws the random shape with maximum of 2000 vertex
void randomShape(){
  beginShape();
    for(int i=0;i<2000;i++)
    {
    float x=random(0,600);
    float y=random(0,600);
    float r=random(0,255);
    float g=random(0,255);
    float b=random(0,255);
    noStroke();
    fill(int(r),int(g),int(b));
    vertex(x,y);
    }
  endShape(CLOSE);
}


//Draws the random Ellipse with maximum size 100
void randomEllipse(){
  float x=random(0,600);
  float y=random(0,600);
  float s=random(0,100);
  float r=random(0,255);
  float g=random(0,255);
  float b=random(0,255);
  fill(int(r),int(g),int(b));
  for(int i=0;i<500;i++)
  ellipse(x,y,s,s);
}
