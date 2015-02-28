
float sunX; // midpoint of sketch- used to set "hub"
float sunY;  // y "hub"
// path of sun- calculated by sine,cosine and distance from hub
float pathX;  
float pathY;
//
int sunRad; // distance- path of sun
float sunAng;
// diameter of sun
int sunDiamX;
int sunDiamY;
//
float distanceX; //mouse X position - x hub
float distanceY; // mouse Y position - y hub
float rSun; // not sure what to do with this
int sunStrokeColor; // stroke color for sun
int sunFillColor; // fill color for sun
// variables for sunflowers

float flowerScale;  // sets height of flowers
float flowerAngInc;  // sets angle increment for flowers
float flowerX;
float rFlowerX;
int flowerRectX;  // x size for retangle that makes stem
int flowerRectY;  // y size for retangle that makes stem
float fAng;
int flowerOffset;
float petalAng;
float rAng;  // for the petals
float petalMove;
int petalX;
int petalY;
int jMult; // j multiplier
int stemColor;
int petalColor;
int bgColor;




void setup() {
  size(700,500);
  smooth();
  bgColor=color(77,168,221);
  sunRad =425;
  sunX= width/2;
  sunY = height;
  sunDiamX=97;
  sunDiamY =95;
  sunStrokeColor=color(243,204,47);
  sunFillColor = color(215,0,20,10);

  flowerScale = 35;
  flowerOffset=50;
  flowerAngInc = PI/75;
  flowerRectX = 4;
  flowerRectY = 8;
  stemColor= color(7,111,7);
  petalColor = color(237, 28, 36);
  petalX=0;
  petalY = 0;
  jMult = 80;
 
  frameRate(30);
}
void draw() {
  background(bgColor);
  distanceX = mouseX - sunX;
  distanceY = mouseY - sunY;
  sunAng= atan2(distanceY,distanceX);
  pathX = sunX + sunRad*cos(sunAng);
  pathY = sunY + sunRad*sin(sunAng);
  strokeWeight(.35);//add random here

  //construction of sun
  stroke(sunStrokeColor);
  fill(sunFillColor);
  for(int i=0; i<95; i++) {
    ellipse(pathX,pathY,sunDiamX-+i,sunDiamY-i);
  }
  //construction of flower
  
  noStroke();
  fAng = atan2(distanceY-250,distanceX-250); //subtracting 250 helps to limit range of motion
  // i is less than the height of the canvas- 375 is the top if the stem
  for(float i = 370; i<=500; i +=2) {
    for(float j = flowerOffset ; j < width; j+= jMult) { // this produces more than 1 stem
      flowerX = j + (cos(fAng)*flowerScale);
      fill(stemColor);
      noStroke();
      rect(flowerX,i,flowerRectX,flowerRectY);
      //construct sun rays
      fill(sunFillColor);
      stroke(sunStrokeColor);
      pushMatrix();
      translate(pathX,pathY);
      rotate(flowerX);
      triangle(30,70,5,25,35,70);
      rotate(sunAng+1);
      popMatrix();
       }
    fAng += flowerAngInc; // adds to fAng
  }
 
  //construct the petals

  petalAng =atan2(distanceY-350,distanceX-350);
  rAng = PI/90;
  petalMove=flowerOffset +(cos(petalAng)*35);
  for (float r = 0; r < (2 *PI); r +=(2*PI)/25) {
    for(float j = 0 ; j < width; j+= jMult) { // this creates multiple flowers

      pushMatrix();
      translate(petalMove+j,365);
      strokeWeight(5);
      point(petalX,petalY);
      strokeWeight(1);
      fill(petalColor);
      stroke(sunStrokeColor);
      rotate(r);
      ellipseMode(CORNER);
      ellipse(petalX,petalY,50,6);

      petalAng+=.05;
      popMatrix();
    }
    ellipseMode(CENTER);
  }
}






