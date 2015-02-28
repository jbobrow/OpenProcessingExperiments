
PImage win;
PImage lose;
PImage intro;

int page = 1; 

float angleb = 0.0;
float speedb = 0.1;

int radius = 40;  //ball at top moving
float x = 110;
float speed = 3.0;
int rect1direction = 1;

//top rectangle moving
float halfrw = 25;
float rect1x = 50;
float rect1y = -5;
float rect1width = 50;
float rect1height = 200;

//bottom rectangle
float rect2y = 259;
float rect2x = 367;
float rect2height = 320;
float rect2width = 49;
float rect2CenterX;
float rect2rightx = rect2x + rect2width;

//circle
float angle3 = 0.0; 
float speed3 = 0.1;
float circlex;
float circley = rect2y - 20;
float circleradius = 20;

//easing
float easing = 0.1;

//falling
boolean b = false;


void setup () {
  rect2x = random (20,300);
  circlex = rect2x+22;
  size (480, 320);
  frameRate(35);
  smooth ();
  ellipseMode(RADIUS);
  //  rectMode(CENTER);
  win = loadImage ("win.png");
  lose = loadImage("lose.png");
  intro = loadImage("intro.png");
}

void draw () {
  
   if (page == 1) { 
    pageOne(); 
  }  
  else if (page == 2) { 
    pageTwo(); 
  }  
} 
 
void pageOne() { 
  background(255); 
  image(intro, 0,0); 
  angleb = angleb + speedb;
  ellipse(408 + (sin(angleb + PI) * 5), 255, 20, 20);
  if (mousePressed == true) { 
    page = 2; 
  } 
} 
 
void pageTwo() { 

  rect2CenterX = rect2x + rect2width/2;

  background (255);


  rect (rect1x, rect1y, rect1width, rect1height);
  rect1x += speed * rect1direction;
  if ((rect1x > width-halfrw) || (rect1x < halfrw)){
    rect1direction = -rect1direction;
  }




  if (key == CODED){
    if (keyCode == UP){
      if (keyPressed == true){
        rect2y--; //add 1 to x
      }
    }
  }

  if (key == CODED){
    if (keyCode == DOWN){
      if (keyPressed == true){
        rect2y++; //add 1 to x
      }
    }
  }

  if (key == CODED){
    if (keyCode == LEFT){
      if (keyPressed == true){
        rect2x-=4; //add 1 to x
        // circlex--;
      }
    }
  }

  if (key == CODED){
    if (keyCode == RIGHT){
      if (keyPressed == true){
        rect2x+=4; //subtract 1 to x
        //   circlex++;
      }
    }
  }

  //easing;
  float dx = rect2CenterX - circlex;
  circlex += dx * easing;

  rect (rect2x, rect2y, rect2width, rect2height);
  angle3 = angle3 + speed3;




  

  //ball falling off
  if (rect2x - circlex > 9) {
    b = true;
  } 

  if (b) {
    //println("add");
    circley += 3;
  } else {
    
    circley = rect2y-20;
    
  }
  
  if (rect2rightx - circlex < 9) {
    b = true;
  } 

  if (b) {
    println("add");
    circley += 3;
  } 
  else {
    
    circley = rect2y-20;
    
  }

//win
if (rect1height < 10) {
  image (win, 0,0);
}

//lose
if (circley > 300) {
  image (lose, 0,0);
}


  // draw ball!
  ellipse(circlex + (sin(angle3 + PI) * 5), circley, circleradius, circleradius);

  //println("ballY = " + (rect2y-20) + "rect1height =" + rect1height);
  //casey's code
  if (rectCircleIntersect(rect1x, rect1y, rect1width, rect1height, circlex + (sin(angle3 + PI) * 5), circley, circleradius) == true) { 
    if ((abs(circlex - (rect1x + (rect1width/2))) < 20) &&
      (abs(circley - (rect1height)) < 10))
    {

      fill(118, 205, 208); 
      rect1height--;
    } 
    else 
    {
      fill(255);
    }
  }  
  else { 
    fill(255);  
  } 

}

boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) { 

  float circleDistanceX = abs(cx - rx - rw/2); 
  float circleDistanceY = abs(cy - ry - rh/2); 

  if (circleDistanceX > (rw/2 + cr)) { 
    return false; 
  } 
  if (circleDistanceY > (rh/2 + cr)) { 
    return false; 
  } 
  if (circleDistanceX <= rw/2) { 
    return true; 
  }  
  if (circleDistanceY <= rh/2) { 
    return true; 
  } 

  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2); 
  return cornerDistance <= pow(cr, 2); 
}



