
int modulo = 10;

float largeRadius, smallRadius;
float largeCenterX, largeCenterY;

boolean curved=false;
boolean countCircles=false;
boolean showTitle=false;

void setup() {
  size(700, 700);
  background(0);

  largeRadius = width/3;
  largeCenterX = width/2;
  largeCenterY = height/2;

  textAlign(CENTER, CENTER);
  strokeWeight(2);
  smooth();
  noLoop();
}

void draw() {
  colorMode(HSB, modulo);
  background(0);

  //Draw big circle in white (no fill)
  noFill();  
  stroke(modulo);
  ellipse(largeCenterX, largeCenterY, 2*largeRadius, 2*largeRadius);

  smallRadius = PI*largeRadius /(modulo+4); //+4 for good spacing
  float largeThetaStep = 2*PI/(modulo);
  for (int i=0; i<modulo; i++) {
    float smallCenterX = largeCenterX
      + largeRadius*cos(i*largeThetaStep-PI/2);//rotate so 0 is top
    float smallCenterY = largeCenterY
      + largeRadius*sin(i*largeThetaStep-PI/2);

    //Draw smaller circles
    noFill();    
    stroke(modulo);
    ellipse(smallCenterX, smallCenterY, 2*smallRadius, 2*smallRadius);

    float smallThetaStep = 2*PI/modulo; 
    int lastNum = i; //start of power-line
    for (int n=0; n<modulo; n++) {
      float x0 = smallCenterX 
        + smallRadius*cos(n*smallThetaStep-PI/2);
      float y0 = smallCenterY 
        + smallRadius*sin(n*smallThetaStep-PI/2);

      //Draw tiny marks
      fill(0); 
      stroke(modulo);
      ellipse(x0, y0, 5, 5);

      //Compute ending position for power-line
      int nextNum = computeNextNum(i, lastNum);
      float x1 = smallCenterX
        + smallRadius*cos(lastNum*smallThetaStep-PI/2);
      float x2 = smallCenterX
        + smallRadius*cos(nextNum*smallThetaStep-PI/2);
      float y1 = smallCenterY
        + smallRadius*sin(lastNum*smallThetaStep-PI/2);
      float y2 = smallCenterY 
        + smallRadius*sin(nextNum*smallThetaStep-PI/2);

      //Draw power-line
      stroke(n, 100, 100);  
      noFill();
      if (curved)
	    bezier(x1,y1, 0.5*(x2+x1),y1, x2,y2, x2,y2);

      else
        line(x1, y1, x2, y2);

      //Highlight marks landed on
      noFill();  
      stroke(lastNum, 100, 100);
      ellipse(x1, y1, 10, 10);

      lastNum = nextNum;
    }

    //Label the smaller circles
    if (countCircles) {
      fill(modulo);
      noStroke();
      rect(smallCenterX-10, smallCenterY-8, 20, 20, 7, 7);
      textSize(18); 
      stroke(i, 100, 100); 
      fill(0);
      text(i, smallCenterX, smallCenterY);
    }
  }
  //Label the visual
  if (showTitle) {
    textSize(25);
    fill(modulo);
    text("Successive Powers\nMod " + modulo, largeCenterX, largeCenterY);
  }
}

int computeNextNum(int keyNum, int lastNum) {
  return (lastNum*keyNum) % modulo;
}

void keyPressed() {
  if (key == CODED)
  {
    if (keyCode == UP)
      modulo++;
    else if (keyCode == DOWN)
      modulo--;
 }
  redraw();
}
int getModulo(){
	return modulo;
}
void setModulo(int m){
	modulo = m;
}
void update(){
	redraw();
}
void straightToggle(){
	curved = !curved;
}


