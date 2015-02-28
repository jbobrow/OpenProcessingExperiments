
/**************************
 * Spirograph:
 *
 *   This was orginally written with layers, but couldn't be uploaded
 *     using libraries   
 *
 *   Controls:
 *      r: restart
 *      c: clear canvas
 * Author: Seth Heidkamp
 * 
 **************************/

float r1, r2;
float a1, a2;
float x, y;
int t;

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white
  setNew();
  smooth();
}

void draw() {  //draw function loops 
    t++;
    translate(width/2,height/2);
    ellipse(width/2, height/2, 15 , 10);
    float nx = r1*cos(radians(a1*t)) + r2*cos(radians(a2*t));
    float ny = r1*sin(radians(a1*t)) + r2*sin(radians(a2*t));
    
    strokeWeight(3);
    setColor();
    line(x,y,nx,ny);
    x = nx; y = ny;
}

void setColor() {
          stroke( int(abs(sin(radians(t/2)))*255),
                int(abs(cos(radians(t/3)))*255),
                int(abs(sin(radians(t/7)))*255));
}


void setNew() {
  //fade(10); // Fade doesn't work for some reason
  r1 = random(0.4*width/2, 0.6*width/2);
  r2 = random(0.2*r1,0.85*r1);
  a1 = random(2,20);
  a2 = random(2,20);
  x = r1*cos(radians(a1*t)) + r2*cos(radians(a2*t));
  y = r1*sin(radians(a1*t)) + r2*sin(radians(a2*t)); 

 }

void keyPressed() {
  if (key == 'r') { 
    setNew();
  }
  if (key == 'c') {
    background(255); 
  }
}


void fade(int amount) {
    noStroke();
    fill(255,amount);
    rect(0,0,width,height);
}

// default fade.
void fade() {
   fade(128); 
}
