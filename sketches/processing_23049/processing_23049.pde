
int x=0;
int speedx=1;
int y=0;
int speedy=3;
int r=1;
int trans=50;
int back = 0;
int ncircles = 3;
int nsquares = 7;
int bezcolorgrowth = 1;
int n = 7;

float[] rotations = new float[n];
Thing[] squares = new Thing[n];
color[] colors = new color[n];
Thing2[] circles = new Thing2[n];

void setup()

{
  rectMode(CENTER);
  size(800,600);
  smooth();
  
  
  for (int i = 0; i < n; i++) {

    colors[i] = color (0, 0, 0);
    
  }

  for (int i = 0; i < nsquares; i++) {

    rotations[i] = random(0, 2*PI);
    
  }

  for (int i = 0; i < nsquares; i++) {

    squares[i] = new Thing (random(0,width), random(0,height), random(50,150), random(-5,5), colors[i], rotations[i] );
  
  }

  for (int i = 0; i < ncircles; i++) {

    circles[i] = new Thing2 (random(0,width), random(0,height), random(50,150), random(-5,5), colors[i] );
  
  }
  
}

void draw()

{

  
  for (int i = 0; i < nsquares; i++) {

    squares[i].move();
    squares[i].coloring(r);
    
  }
  
  for (int i = 0; i < ncircles; i++) {
  
  circles[i].move();
  circles[i].coloring(r);
    
  }  
    
    
    
  back = 255-r;
  fill(back,trans);
  noStroke();
  rect(width/2,height/2,width,height);
  noFill();
  x=x+speedx;
  y=y+speedy;

  if((x>width) || (x<0))

  {

    speedx=speedx*-1;
  }

  if((y>height)|| (y<0)) {

    speedy=speedy*-1;
  }

  r+=bezcolorgrowth;
  if ( r >= 255 || r <= 0 ) {

    bezcolorgrowth = bezcolorgrowth*-1;
  }

  
  trans-=1;
  stroke(r);
  bezier(0,y,x,y,x,y,width,height-y);
  bezier(0,height-y,x,y,x,y,width,y);
  bezier(0,height-y,x,y,x,y,0,y);
  bezier(width,height-y,x,y,x,y,width,y);
  //trans=constrain(trans,10,50);
}



class Thing {
  //date (variables)
  float rotspeed = PI/36;
  float growth = 1;
  float xpos;
  float ypos;
  float radius;
  float speedx;
  float speedy;
  float rotation;
  color cor;
  //constructor
  Thing (float tempX, float tempY, float tempRadius, float tempSpeed, color tempColor, float tempRotation) {
    xpos = tempX;
    ypos = tempY;
    radius = tempRadius;
    speedy = tempSpeed;
    speedx = tempSpeed;
    cor = tempColor;
    rotation = tempRotation;
  }
  //methods and functions
  void move () {
    
    ypos +=speedy;
    xpos +=speedx;
    radius+=growth;
    if ((ypos > ((height-radius/2)+1)) || ((ypos<(0+radius/2)-1))) {
      speedy *= -1;
      rotspeed *= -1;
    }
    if (xpos > ((width-radius/2)+1) || (xpos<(0+radius/2)-1)) {
      speedx *= -1;
      rotspeed *= -1;
    }
    if (radius<=50 || radius>=150) {
      growth *=-1;
    }



    noStroke();
    fill (cor);
    pushMatrix();
    translate(xpos, ypos);
    rectMode(CENTER);
    rotate(rotation);
    translate(-xpos, -ypos);
    rect (xpos, ypos, radius, radius);
    popMatrix();
    rotation+=rotspeed;
  }

  void coloring(int greyscale) {

    cor = color(greyscale);
  }
}


class Thing2 {
  //date (variables)
  float growth = 1;
  float xpos;
  float ypos;
  float radius;
  float speedx;
  float speedy;
  color cor;
  //constructor
  Thing2 (float tempX, float tempY, float tempRadius, float tempSpeed, color tempColor) {
    xpos = tempX;
    ypos = tempY;
    radius = tempRadius;
    speedy = tempSpeed;
    speedx = tempSpeed;
    cor = tempColor;
  }
  //methods and functions
  void move () {
    
    ypos +=speedy;
    xpos +=speedx;
    radius+=growth;
    if ((ypos > ((height-radius/2)+1)) || ((ypos<(0+radius/2)-1))) {
      speedy *= -1;
    }
    if (xpos > ((width-radius/2)+1) || (xpos<(0+radius/2)-1)) {
      speedx *= -1;
    }
    if (radius<=50 || radius>=150) {
      growth *=-1;
    }



    noStroke();
    fill (cor);
    ellipse (xpos, ypos, radius, radius);
  }

  void coloring(int greyscale) {

    cor = color(greyscale);
  }
}
       
