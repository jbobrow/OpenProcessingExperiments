
/*@pjs preload="microgame-bg.png, kelpsea.png, fish.png, bluefish.png"; */
 
class fish
{
  float x = 200;
  float y = 250;
  float speed = 2;
  PImage img;
   
  fish()
  {
    this.img = requestImage("fish.png");
  }
   
  void draw()
  {
    this.x += this.speed;
 
    if (this.x > width - (this.img.width / 2) || this.x < (this.img.width / 2))
    {
      this.speed = -this.speed;
    }
    if (this.img.width > 0)
    { 
      pushMatrix();
      translate(this.x, this.y);
      if (this.speed > 0)
      {
        scale(.2, .2);
      }
      image(this.img, 0, 0);
      imageMode(CORNER);
      popMatrix();
    }
  }
}
  
  
  class fish2
{
  float x = 500;
  float y = 100;
  float speed = 2;
  PImage img2;
   
  fish2()
  {
    this.img2 = requestImage("bluefish.png");
  }
   
  void draw()
  {
    this.x -= this.speed;
 
    if (this.x > width - (this.img2.width / 2) || this.x < (this.img2.width / 2))
    {
      this.speed = this.speed;
    }
    if (this.img2.width > 0)
    { 
      pushMatrix();
      translate(this.x, this.y);
      if (this.speed > 0)
      {
        scale(-.2, .2);
      }
      image(this.img2, 0, 0);
      imageMode(CORNER);
      popMatrix();
    }
  }
}


float time = 0;

int numSegments = 10;
float[] x = new float[numSegments];
float[] y = new float[numSegments];

float[] x2 = new float[numSegments];
float[] y2 = new float[numSegments];

float[] angle = new float[numSegments];
float segLength = 26;
float targetX, targetY;

fish myfish = new fish(); 
fish2 myfish2= new fish2();
PImage water; 
PImage kelpsea;


boolean leftTentacle = false;  
boolean rightTentacle = false;
boolean playState = false; 




void setup() {
  size(800, 600);
  strokeWeight(80.0);
  frameRate(25); 
  x[x.length-1] = 310.00;     // Set base x-coordinate
  y[x.length-1] = 200.00;  // Set base y-coordinate
  x2[x.length-1] = 490.00;     // Set base x-coordinate
  y2[x.length-1] = 200.00;  // Set base y-coordinate

  water = requestImage("microgame-bg.jpg"); 
  kelpsea=requestImage("kelpsea.png"); 
}



void draw() {
  background(0);
  image(water,0,0,width,height); 
  
  if (playState == false)
  {text("Kelpsea Web Toy", 500, 285);
  text("Use X and Z to control her tentacles!", 500,300);
  text("Press SPACE to start", 500, 400);
  
  if (keyPressed) {
    if (key == ' ')
  {playState = true;}}
  
  
  } 
 
  
  
  if (playState == true)
  {
  
  
  myfish2.draw(); 
   image(kelpsea,290,160); 
   myfish.draw(); 
pushMatrix();
  stroke(107,155,84);

  if (leftTentacle == true)
  {
  
  reachSegment(0, mouseX, mouseY);
  for(int i=1; i<numSegments; i++) {
    reachSegment(i, targetX, targetY);
  }
  for(int i=x.length-1; i>=1; i--) {
    positionSegment(i, i-1);  
  } 
  for(int i=0; i<x.length; i++) {
    segment(x[i], y[i], angle[i], (i+1)*2); 
  }
 
 }

else
{
reachSegment(0, 300, 600);
  for(int i=1; i<numSegments; i++) {
    reachSegment(i, targetX, targetY);
  }
  for(int i=x.length-1; i>=1; i--) {
    positionSegment(i, i-1);  
  } 
  for(int i=0; i<x.length; i++) {
    segment(x[i], y[i], angle[i], (i+1)*2); 
  }
}


 if (rightTentacle == true)
  {
  
  reachSegment2(0, mouseX, mouseY);
  for(int i=1; i<numSegments; i++) {
    reachSegment2(i, targetX, targetY);
  }
  for(int i=x.length-1; i>=1; i--) {
    positionSegment2(i, i-1);  
  } 
  for(int i=0; i<x.length; i++) {
    segment(x2[i], y2[i], angle[i], (i+1)*2); 
  }
 
 }

else
{
reachSegment2(0,500, 600);
  for(int i=1; i<numSegments; i++) {
    reachSegment2(i, targetX, targetY);
  }
  for(int i=x.length-1; i>=1; i--) {
    positionSegment2(i, i-1);  
  } 
  for(int i=0; i<x.length; i++) {
    segment(x2[i], y2[i], angle[i], (i+1)*2); 
  }
}
popMatrix();
pushMatrix(); 
   stroke(130,255,211,4);

   float wave = 0;

  while (wave < width) {
    line(wave, 40 + 50 * noise(wave / 900, time), wave, height);
    wave = wave + 1;
  }
  
  time = time + 0.09;
popMatrix();
}
}




void positionSegment(int a, int b) {
  x[b] = x[a] + cos(angle[a]) * segLength;
  y[b] = y[a] + sin(angle[a]) * segLength; 
}

void positionSegment2(int a, int b) {
  x2[b] = x2[a] + cos(angle[a]) * segLength;
  y2[b] = y2[a] + sin(angle[a]) * segLength; 
}

void reachSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  angle[i] = atan2(dy, dx);  
  targetX = xin - cos(angle[i]) * segLength;
  targetY = yin - sin(angle[i]) * segLength;
}

void reachSegment2(int i, float xin, float yin) {
  float dx = xin - x2[i];
  float dy = yin - y2[i];
  angle[i] = atan2(dy, dx);  
  targetX = xin - cos(angle[i]) * segLength;
  targetY = yin - sin(angle[i]) * segLength;
}

void segment(float x, float y, float a, float sw) {
  strokeWeight(sw);
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();



}





void keyReleased()
 { if (key == 'z' || key == 'Z') 
  {
leftTentacle= true;
rightTentacle = false;
  } else {
  leftTentacle= false;
  }

  if (key == 'x' || key == 'X') 
  {
leftTentacle= false;
rightTentacle = true;
  } else {
  rightTentacle= false;
  }
}




