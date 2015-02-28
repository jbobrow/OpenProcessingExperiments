
float angle, lastAngle;
float r, d;

float currentTime;
float fullCircleTime;

color bgc;
color fillTimeLapsed;
color fillTimeFuture;
color strokeColor;
float strokeWidth;

float traceAlpha;

int cycleCount;
int cycleCounterGap;
int cycleCountDiameter;
int maxCounterAmount;
  

void setup() {
  size(600,600);
  
  angle = 0;
  lastAngle = 0;
  d = int(width*0.618);
  d = makeEvenRoundUp(d);
  r = d/2;
  
  fullCircleTime = 4000;
  
  bgc = color(255);
  fillTimeLapsed = color(153, 64, 188);
  fillTimeFuture = color(250, 238, 255);
  strokeColor = color(0);
  strokeWidth = 1;
  
  traceAlpha = 0;
  
  cycleCount = 0;
  cycleCounterGap = 40;
  cycleCountDiameter = 20;
  maxCounterAmount = (width / cycleCounterGap) - 1;
}


void draw() {
  background(bgc);

  pushMatrix();
  translate(width/2,height/2);
  rotate(-HALF_PI);
  
  noStroke();
  fill(fillTimeFuture);
  arc(0,0, d,d, -(TWO_PI-angle),0);
  fill(fillTimeLapsed);
  arc(0,0, d,d, 0,angle);
  
  drawTrace();
  
  rotate(angle);
  stroke(strokeColor);
  strokeWeight(strokeWidth);
  line( 0,0, r,0 );
  popMatrix();
  
  lastAngle = angle;
  
  currentTime = millis();
  angle = (currentTime/fullCircleTime) * TWO_PI;
  angle %= TWO_PI;
  
  drawCycleCount();
  
  if(lastAngle > angle){ 
    traceAlpha = 255;
    cycleCount++;
  }
}


void drawTrace() {
  float reduceAlphaAmount = 5;
  if( traceAlpha > reduceAlphaAmount){ 
    traceAlpha -= reduceAlphaAmount;
    
    fill( fillTimeLapsed, traceAlpha );
    ellipse(0,0,d,d);
    
    float pieAlphaDivider = 6;
    float pieAlpha = traceAlpha / pieAlphaDivider;
    fill( fillTimeLapsed, pieAlpha );
    float traceAngle = map(pieAlpha, 0,255/(pieAlphaDivider/2), 0,TWO_PI);
    arc(0,0, d,d, -traceAngle,0);
  }
}


void drawCycleCount() {
  if( cycleCount > maxCounterAmount ){
    cycleCount = 1;
  }
  
  for( int i = 0; i < cycleCount; i++ ){
    noStroke();
    fill(fillTimeLapsed);
    ellipse( (i+1)*cycleCounterGap-(cycleCountDiameter/2), height-(cycleCounterGap-(cycleCountDiameter/2)), cycleCountDiameter,cycleCountDiameter);
  }
}


int makeEvenRoundUp(float number) {
  if( number%2 != 0 ){ number+=1; }
  return int(number);
}


