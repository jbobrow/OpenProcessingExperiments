
/*Work based upon Matt Pearson examples code at http://zenbullets.com/book.php 'wave_clock'
 and 'Valentine' by Matt Pearson  examples code at http://www.abandonedart.org */

//================================= global vars

int _num = 10;    
float _angnoise, _radiusnoise;
float _xnoise, _ynoise;
float _angle = -PI/2;
float _radius = 100;
float _strokeCol = 254;
int _strokeChange = -1;
float centreX = 0;

//================================= init

void setup() {
  size(1000, 300);
  smooth(); 
  frameRate(30);
   deplacCentrX();
  clearBackground();
  
  _angnoise = random(10);
  _radiusnoise = random(10);
  _xnoise = random(10);
  _ynoise = random(10);
}

void clearBackground() {
  background(255);
  }
  
void deplacCentrX() { centreX = 0;
 //for (centreX =+ (noise(_xnoise) * 100) - 50; centreX <950; centreX +=100){
     //}
   }

//================================= frame loop

void draw() {
  
  _radiusnoise += 0.005;
  _radius = (noise(_radiusnoise) * 300) +1;
  
  _angnoise += 0.005;
  _angle += (noise(_angnoise) * 6) - 3;
  if (_angle > 360) { _angle -= 360; }
  if (_angle < 0) { _angle += 360; }
  
  // wobble centre
  _xnoise += 0.01;
  _ynoise += 0.01;
  // deplacCentrX();
  //float centreX = 150 + (noise(_xnoise) * 100) - 50; centreX <950; centreX +=150){
 // float centreX = 150 + (noise(_xnoise) * 100) - 50;
   centreX += 50;
  float centreY = height/2 + (noise(_ynoise) * 100) - 50;
  
  float rad = radians(_angle);
  float x1 = centreX + (_radius * cos(rad));
  float y1 = centreY + (_radius * sin(rad));
  
  // opposite
  float opprad = rad + PI;
  float x2 = centreX + (_radius * cos(opprad));
  float y2 = centreY + (_radius * sin(opprad)); 
  
  noFill();
  _strokeCol += _strokeChange;
  if (_strokeCol > 254) { _strokeChange *= -1; }
  if (_strokeCol < 0) { _strokeChange *= -1; }
  stroke((_strokeCol/2)+125, 0, 0, 100);
  strokeWeight(1);
  line(x1, y1, x2, y2);
  //centreX += 50;
  if (centreX >= 950) { deplacCentrX();}
  }

//}
//================================= 

void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("waveclock-####.tif");
  }
}

void mousePressed() {
  clearBackground();
}



