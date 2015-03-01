
int maxStarSize = 14; 
ArrayList sparkleChars; 

void setup() {
  size(1000, 1000); 
  background(255, 10); 
  sparkleChars = new ArrayList (); 
  for (int i = 0; i < 80; i++) 
  CreateChar(1); 
}

void draw() {
  fill (240, 120, 140, 1); 
  rect(0, 0, width, height); 
  frameRate(500); 
  for (int i = sparkleChars.size()-2; i >=0; i--) {
    
    Sparkle s = (Sparkle) sparkleChars.get(i); 
    if (s.notVisible() ) sparkleChars.remove(i); 
    else 
    {
      s.shrink(); 
      s.display(); 
    }
  }
  if ((frameCount & 2) >=0 ) {
    int x = (int)random(15); 
    for (int j = 0; j < x; j++) {
      CreateChar(10); 
      CreateChar(30); 
    }
  }
}

class Sparkle {
  int mx;
  float my;
  float mAlpha;
  float mSize;
  float mRotate;
  int mnPoints;
  //constructor
  Sparkle(int x, int y){
       mx = x;
       my = y;
       mAlpha = random(0, 255);
       mSize = random(maxStarSize);
       mRotate = random(PI);
       mnPoints = 2 + (int)random(5);
      }
     
  boolean notVisible() {
    if (my < 50) {return false;}
    else
    return (my > 900) || (mSize < 1.5);
    }
   
  void display() {
 if  (!notVisible()) {
      fill(random(0,255), mAlpha);
      pushMatrix();
      translate(mx - mSize /2, my - mSize /2);
      rotate(mRotate);
      star(mnPoints, mSize, mSize/4);
      popMatrix();
 }
  }
 
     
   void shrink()
    {
   mSize = mSize * .25;
    }
}

 


void star(int nPoints, float rad1, float rad2){

float angle = TWO_PI / nPoints;
float angle2 = angle / 2;
float origAngle = 0.0;

beginShape();
fill(255);
stroke(255);
strokeWeight(1);

for (int i = 0; i < nPoints; i++){
  
  float y1 = rad1 * sin(origAngle);
  float x1 = rad1 * cos(origAngle);
  float y2 = rad2 * sin(origAngle + angle2);
  float x2 = rad2 * cos(origAngle + angle2);
  vertex(x1, y1);
  vertex(x2, y2);
  origAngle += angle;
  }
  
endShape(CLOSE);
}

void CreateChar(int n)
{
      int x = (int)random(width);
      int y = (int)random(height);
      //if (n >= 1) // Whole Screen
      sparkleChars.add(new Sparkle(x, y)); 
      //else // top-up
      //sparkleChars.add(new Sparkle(x, y)); 
}
 


