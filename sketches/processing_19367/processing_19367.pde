
boolean rot;
float n;

color black;
color white;

void quadrant(float x1, float y1,float x2,float y2) {
  line((x2+x1)/2,y1,(x2+x1)/2,y2);
  line(x1,(y1+y2)/2,x2,(y1+y2)/2);
}

void quadrant4(float x1,float y1, float x2, float y2) {
  quadrant(x1,y1,(x2+x1)/2,(y2+y1)/2);
  quadrant((x1+x2)/2,y1,x2,(y2+y1)/2);
  quadrant(x1,(y2+y1)/2,(x2+x1)/2,y2);
  quadrant((x1+x2)/2,(y1+y2)/2,x2,y2);
}

void quadrant16(float x1,float y1, float x2, float y2) {
  quadrant4(x1,y1,(x2+x1)/2,(y2+y1)/2);
  quadrant4((x1+x2)/2,y1,x2,(y2+y1)/2);
  quadrant4(x1,(y2+y1)/2,(x2+x1)/2,y2);
  quadrant4((x1+x2)/2,(y1+y2)/2,x2,y2);
}

void setup() {
size(192,157);
background(0);
stroke(255);
rot=false;
black=0;
white=255;
}

void draw() {
  if (mousePressed) smooth();
  else noSmooth();
  background(black);
  stroke(white);
  //if (rot) {
    translate(width/2, height/2);
  if (rot)  n+=.01;
    rotate(n);
    translate(-width/2,-height/2);
  //}
  strokeWeight(4);
  quadrant(0,0,width,height);
  
  strokeWeight(3);
  quadrant(width/2,0,width,height/2);
  quadrant(0,height/2,width/2,height);
  quadrant(width/2,height/2,width,height);
  
  strokeWeight(2);
  quadrant4(0,height/2,width/2,height);
  quadrant4(width/2,height/2,width,height);
  
  strokeWeight(1);
  quadrant16(width/2,height/2,width,height);
}

void keyPressed() {
  switch (key) {
    case 'i':
      black=white;
      if (black==255) white=0; else white=255;
    break;
    default: rot=true;  
  }
}

void keyReleased() {
  if (key!='i') {
    rot=false;
    n = n%TWO_PI;
    if (n<=PI/4) n=0;
    else if (n<=HALF_PI+PI/4) n=HALF_PI;
    else if (n<=PI+PI/4) n=PI;
    else if (n<=TWO_PI-PI/4) n=PI+HALF_PI;
  }
}



