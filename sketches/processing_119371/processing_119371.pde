
//Chun Yi Wu
//The image seems shoot the bullet on the wall 
//To performance lots of flower grow up on the plan


//--------------------------Go!----------------------------\\

//count of flower
int count = 5;   
// function clicked >> change color
color[] COLORS = { 
  #000000, #FA6060, #B9FA17, #11A1F7, #CCCC11, #E7E802, #C9A2E5
};
boolean dark = false;
color bg = #FFFFFF;
int selColor;
boolean dragged;
//  function  dragged >>  radius of flower 
float mouseXBegin, mouseYBegin;
float Fradius ;
float FradiusBegin;
//  
float FPosition;
float FPosBegin;


FLOWER[] flowers;

void setup() {
  size(500, 500);
  frameRate(10);
  flowers = new FLOWER[count];
  for (int i=0; i < count; i++) {
    flowers[i] = new FLOWER(i * TWO_PI / count);
  }
  selColor = 0;
  dragged = false;
  Fradius = 0.2; 
  FPosition = 0.4;
}

void draw() {
 //Mask of lighting
  noStroke();
  float transparency = map(mouseY, 0, height, 30, 5);
  fill(bg, transparency);
  rect(0, 0, width, height);
  for (int i=0; i < count; i++) {
    flowers[i].update();
    flowers[i].display();
  }
}

void mouseClicked() {
 // Clicking the left mouse button changes stroke color
 if (mouseButton == LEFT) {
 selColor ++;
 if (selColor == COLORS.length)
 selColor = 0;
 }
 // Clicking the right mouse button toggle light and dark modes
 if (mouseButton == RIGHT) {
 dark = !dark;
 bg = dark ? #000000 : #FFFFFF;
 COLORS[0] = dark? #FFFFFF : #000000;
 }
 }
 
 void mouseReleased() {
 dragged = false;
 }
 
void mouseDragged() {
  if (!dragged) {
    dragged = true;
    mouseXBegin = mouseX;
    mouseYBegin = mouseY;
    FradiusBegin = Fradius;
    FPosBegin = FPosition;
  }

  // Map mouse horizontal position relative to button pushing point
  // function of radius 
  float dx = mouseX - mouseXBegin;
  float rDiff = map(dx, -width, width, -0.3, 0.4);
  Fradius  = constrain(FradiusBegin+rDiff, -0.8, 1);

  // Map mouse vertical position relative to button pushing point
  float dy = mouseY - mouseYBegin;
  float posDiff = map(dy, -height, height, -0.3, 0.3);
  FPosition = constrain(FPosBegin+posDiff, -1, 1);
}




class FLOWER {

  float location;               
  float rotation; 
  float ccc;  
  float ddd;                 

  FLOWER(float location_) {

    location = location_;
    rotation = 0;
    ccc = random(0.015, 0.025);
    ddd = -random(0.05, 0.15);
  }

  void update() {
    rotation += ddd;
    location += ccc;
  }

  void display() {
    // transparency of flower
    float traMin = 90;
    float traMax = 200;
    // center point
    int centX = int(random(width)); 
    int centY = int(random(height)); 
    float a, b; 
    
    float radVariance, thisRadius, rad;
    //rotate reference point
    float Fradius2 = width * Fradius / 4;
    float distance = width * FPosition / 2;
    float x = width/2 + cos(location) * distance;
    float y = height/2 + sin(location) * distance;
    // rotate function
    pushMatrix();
    translate(x, y);
    rotate(rotation/10);
    //creat shape 
    beginShape();
    for (float ang=0; ang<=360; ang+=3) { 
      strokeWeight(0.5);
      float lineAlpha = map(mouseX, 0, width, traMin, traMax);
      stroke(COLORS[selColor], lineAlpha);
      //fill(COLORS[selColor],10);
      noFill(); 
      radVariance = random(distance/10);
     
      //////////////////////
      thisRadius = Fradius2+radVariance; 
      rad = radians(ang); 
      a = centX + (thisRadius * cos(rad)); 
      b = centY + (thisRadius * sin(rad)); 
      curveVertex(a, b);
    }
    endShape();
    popMatrix();
    
  }
}



