

int maxStarSize = 14;
ArrayList sparkleChars;
PImage img; 
PImage sledge; 
PImage brush; 

void setup() {
  size(1100, 600, P3D);
  img = loadImage ("mouth.png"); 
  sledge = loadImage ("Sledgehammer.png"); 
  sledge.resize(100, 50); 
  brush = loadImage ("brush.png"); 
  brush.resize(100, 50); 
  noStroke(); 
  fill(204); 
  sphereDetail(60); 
  sparkleChars = new ArrayList();  // Create an empty ArrayList
  for( int i = 0; i< 80; i++)      // now add some elements for initial seeding 
    CreateChar(1); 
}

void draw(){
  background(255, 120, 140, 3);
  tint(255, 150); 
  image(img, 0, 0); 
if (!mousePressed) {
  image(sledge, mouseX-sledge.width/2, mouseY-sledge.height/2); }
  else { image(brush, mouseX-brush.width/2, mouseY-brush.height/2); }

  frameRate(500);  
  for (int i = sparkleChars.size()-2; i >= 0; i--){
    
      Sparkle s = (Sparkle) sparkleChars.get(i);
      if (s.notVisible() ) sparkleChars.remove(i);
      else
      {
        s.shrink();
        s.display();
      }
  }
  if ((frameCount & 2) >= 0 )
  {
    int x = (int)random(8);
    for (int j = 0; j < x; j++)
      {
          CreateChar(1);  
          CreateChar(4);  // top 1/4th
      }
  }
}

void mouseDragged() {
  
  image(brush, mouseX-brush.width/2, mouseY-brush.height/2); 
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
       mnPoints = 5 + (int)random(5);
      }
     
  boolean notVisible() {
    if (my < 50) {return false;}
    else
    return (my > height) || (mSize < 1.5);
    }
   
  void display()
    {
      if (!notVisible()) {
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
    
    void star(int nPoints, float rad1, float rad2){

float angle = TWO_PI / nPoints;
float angle2 = angle / 2;
float origAngle = 0.0;

beginShape();
fill(255,255,255);
stroke(255,255,255);
strokeWeight(2);

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

}
 
void CreateChar(int n)
{
      int x = (int)random(width);
      int y = (int)random(height/ n);
      if (n >= 1) // Whole Screen
      sparkleChars.add(new Sparkle(x, y)); 
      else // top-up
      sparkleChars.add(new Sparkle(x, y)); 
}
 
void star(int nPoints, float rad1, float rad2){

float angle = TWO_PI / nPoints;
float angle2 = angle / 2;
float origAngle = 0.0;

beginShape();
fill(255,255,255);
stroke(255,255,255);
strokeWeight(2);

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


