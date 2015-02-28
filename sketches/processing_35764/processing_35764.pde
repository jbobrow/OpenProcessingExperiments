
int sizes = 60;
float ypos = 200;
float xpos = 350;

float x_current = 350;
float y_current = 200;

float dsitXfinal = 0;
float distYfinal = 0;

float ease; //force

float bouncetime = 0;
float bouncetotal = 100;
float bx =350;
float by =200;

float distX = 0;
float distY = 0;

void setup() {
  size(700,400);
  background(0);
}

void draw() {
  smooth();
  background(0);
  stroke(200,50);
  fill(200,50);
  ellipse(xpos,ypos,sizes,sizes);
  strokeWeight(2);
  //line(350,200,xpos,ypos);
  line(0,0,xpos,ypos);
  line(0,400,xpos,ypos);
  line(700,0,xpos,ypos);
  line(700,400,xpos,ypos);
  line(350,0,xpos,ypos);
  line(350,400,xpos,ypos);
  line(0,200,xpos,ypos);
  line(750,200,xpos,ypos);
  line(0,100,xpos,ypos);
  line(0,300,xpos,ypos);
  line(750,100,xpos,ypos);
  line(750,300,xpos,ypos);
  line(187.5,0,xpos,ypos);
  line(537.5,0,xpos,ypos);
  line(187.5,400,xpos,ypos);
  line(537.5,400,xpos,ypos);
  line(268.75,0,xpos,ypos);
  line(431.25,0,xpos,ypos);
  line(268.75,400,xpos,ypos);
  line(431.25,400,xpos,ypos);
  if (mousePressed == true) {
    xpos = mouseX;
    ypos = mouseY;
    bouncetime = 0;
    distX = 350 - xpos;
    distY = 200 - ypos;
    bx = xpos;
    by = ypos;
  } else {

   if(bouncetime < bouncetotal) {
    
    xpos = easeOutBounce(bouncetime, bx, distX, bouncetotal);
    ypos = easeOutBounce(bouncetime, by, distY, bouncetotal);
     
     bouncetime = bouncetime + 1;
   }else {
      distX = 350 - xpos;
      distY = 200 - ypos;
      xpos = xpos + (distX/25);
      ypos = ypos + (distY/25);
    }
  }
}

/**
 * Easing equation function from Tweener
 * http://code.google.com/p/tweener/source/browse/trunk/as3/caurina/transitions/Equations.as
 */
float easeOutBounce(float t, float b, float c, float d) {
  if ((t/=d) < (1/2.75)) {                                  
    return c*(7.5625*t*t) + b;
  } 
  else if (t < (2/2.75)) {                                  
    return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
  } 
  else if (t < (2.5/2.75)) {                                  
    return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
  } 
  else {                                  
    return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
  } 
}


