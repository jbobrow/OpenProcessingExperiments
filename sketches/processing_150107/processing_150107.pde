
//  http://www.gizma.com/easing/
//
// http://www.robertpenner.com/easing/
// https://github.com/jesusgollonet/processing-penner-easing/tree/master/src

float tt, bb, cc, dd;
float original, destination, factor;
float curX;
int spacer, sqSize, speed;
int waitTime;

void setup() {
  sqSize = 40;

  size(600, sqSize*13);

  speed = 40;
  sqSize = 40;

  waitTime=0;

  stroke(0);

  background(200);

  tt = 0;
  bb = 0;
  cc = 1;
  dd = 150;

  original = 100;
  destination = width-100;
}

void draw() {

  spacer = 20;

  background(200);
  ////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////
  factor =  noEasing(tt, bb, cc, dd);
  curX = original+(destination-original)*factor;

  drawRect(spacer);

  incSpacer();
  ////////////////////////////////////////////////////////
  factor =  easeInQuad(tt, bb, cc, dd);
  curX = original+(destination-original)*factor;

  drawRect(spacer);

  incSpacer();
  ////////////////////////////////////////////////////////
  factor =  easeOutQuad(tt, bb, cc, dd);
  curX = original+(destination-original)*factor;

  drawRect(spacer);

  incSpacer();
  ////////////////////////////////////////////////////////
  factor =  easeInOutQuad(tt, bb, cc, dd);
  curX = original+(destination-original)*factor;

  drawRect(spacer);

  incSpacer();
  ////////////////////////////////////////////////////////
  factor =  easeInSine(tt, bb, cc, dd);
  curX = original+(destination-original)*factor;

  drawRect(spacer);

  incSpacer();
  ////////////////////////////////////////////////////////
  factor =  easeOutSine(tt, bb, cc, dd);
  curX = original+(destination-original)*factor;

  drawRect(spacer);

  incSpacer();
  ////////////////////////////////////////////////////////
  factor =  easeInOutSine(tt, bb, cc, dd);
  curX = original+(destination-original)*factor;

  drawRect(spacer);

  incSpacer();

  ////////////////////////////////////////////////////////
  factor =  easeInBounce(tt, bb, cc, dd);
  curX = original+(destination-original)*factor;

  drawRect(spacer);

  incSpacer();
  ////////////////////////////////////////////////////////
  factor =  easeOutBounce(tt, bb, cc, dd);
  curX = original+(destination-original)*factor;

  drawRect(spacer);

  incSpacer();
  ////////////////////////////////////////////////////////
  factor =  easeInOutBounce(tt, bb, cc, dd);
  curX = original+(destination-original)*factor;

  drawRect(spacer);

  incSpacer();
  ////////////////////////////////////////////////////////
  factor =  easeInElastic(tt, bb, cc, dd);
  curX = original+(destination-original)*factor;

  drawRect(spacer);

  incSpacer();
  ////////////////////////////////////////////////////////
  factor =  easeOutElastic(tt, bb, cc, dd);
  curX = original+(destination-original)*factor;

  drawRect(spacer);

  incSpacer();
  ////////////////////////////////////////////////////////
  factor =  easeInOutElastic(tt, bb, cc, dd);
  curX = original+(destination-original)*factor;

  drawRect(spacer);

  incSpacer();
  ////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////

  pushStyle();
  stroke(0, 50);
  line(original, 0, original, height);
  line(destination, 0, destination, height);
  popStyle();

  tt++;

  if (tt>dd) {
    tt = dd;
    waitTime++;
  } 

  if (waitTime > 50) {
    setup();
  }

  //if (tt>dd) noLoop();
}


void incSpacer() {
  pushStyle();
  stroke(0, 50);
  line(0, spacer, width, spacer);
  popStyle();
  spacer += sqSize;
}

void drawRect(float y) {
  pushStyle();
  fill(255, 0, 0);
  rectMode(CENTER);
  pushMatrix();
  translate(curX, y);
  rotate(curX/(width/speed));
  rect(0, 0, curX/(width/speed), curX/(width/speed));
  popMatrix();
  popStyle();
}



//@t is the current time (or position) of the tween. This can be seconds or frames, steps, seconds, ms, whatever – as long as the unit is the same as is used for the total time [3].
//@b is the beginning value of the property.
//@c is the change between the beginning and destination value of the property.
//@d is the total time of the tween.
float noEasing (float t, float b, float c, float d) { 
  // simple linear tweening - no easing, no acceleration
  return c*t/d + b;
}

float easeInQuad (float t, float b, float c, float d) {
  // quadratic easing in - accelerating from zero velocity
  t /= d;
  return c*t*t + b;
}

float easeOutQuad (float t, float b, float c, float d) {
  // quadratic easing out - decelerating to zero velocity
  t /= d;
  return -c * t*(t-2) + b;
}

float easeInOutQuad (float t, float b, float c, float d) {
  // quadratic easing in/out - acceleration until halfway, then deceleration
  t /= d/2;
  if (t < 1) return c/2*t*t + b;
  t--;
  return -c/2 * (t*(t-2) - 1) + b;
}

float easeInSine (float t, float b, float c, float d) {
  // sinusoidal easing in - accelerating from zero velocity
  return -c * cos(t/d * (PI/2)) + c + b;
}

float easeOutSine (float t, float b, float c, float d) {
  // sinusoidal easing out - decelerating to zero velocity
  return c * sin(t/d * (PI/2)) + b;
}

float easeInOutSine (float t, float b, float c, float d) {
  // sinusoidal easing in/out - accelerating until halfway, then decelerating
  return -c/2 * (cos(PI*t/d) - 1) + b;
}

float easeOutBounce(float t, float b, float c, float d) {
  if ((t/=d)<(1/2.75)) {
    return c*(7.5625*t*t)+b;
  }
  else if (t<(2/2.75)) {
    return c*(7.5625*(t-=(1.5/2.75))*t+.75)+b;
  }
  else if (t<(2.5/2.75)) {
    return c*(7.5625*(t-=(2.25/2.75))*t+.9375)+b;
  }
  else {
    return c*(7.5625*(t-=(2.625/2.75))*t+.984375)+b;
  }
}

float easeInBounce(float t, float b, float c, float d) {
  return c-easeOutBounce(d-t, 0, c, d)+b;
}

float easeInOutBounce(float t, float b, float c, float d) {
  if (t<d/2)return easeInBounce(t*2, 0, c, d)*.5+b;
  return easeOutBounce(t*2-d, 0, c, d)*.5+c*.5+b;
}

float  easeInElastic(float t, float b, float c, float d) {
  if (t==0) return b;  
  if ((t/=d)==1) return b+c;  
  float p=d*.3f;
  float a=c; 
  float s=p/4;
  return -(a*(float)Math.pow(2, 10*(t-=1)) * (float)Math.sin( (t*d-s)*(2*(float)Math.PI)/p )) + b;
}


float  easeOutElastic(float t, float b, float c, float d) {
  if (t==0) return b;  
  if ((t/=d)==1) return b+c;  
  float p=d*.3f;
  float a=c; 
  float s=p/4;
  return (a*(float)Math.pow(2, -10*t) * (float)Math.sin( (t*d-s)*(2*(float)Math.PI)/p ) + c + b);
}

float  easeInOutElastic(float t, float b, float c, float d) {
  if (t==0) return b;  
  if ((t/=d/2)==2) return b+c; 
  float p=d*(.3f*1.5f);
  float a=c; 
  float s=p/4;
  if (t < 1) return -.5f*(a*(float)Math.pow(2, 10*(t-=1)) * (float)Math.sin( (t*d-s)*(2*(float)Math.PI)/p )) + b;
  return a*(float)Math.pow(2, -10*(t-=1)) * (float)Math.sin( (t*d-s)*(2*(float)Math.PI)/p )*.5f + c + b;
}

