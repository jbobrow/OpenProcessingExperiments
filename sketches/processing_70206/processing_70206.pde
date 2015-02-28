
float rad =200;
float x1;
float y1;
float x2;
float y2;


void setup() {

  size(600, 600);
  background(0);
}


void draw() {
  translate(height/2, width/2);
  smooth();

  float angle1;
  float angle2;
  float inc1;
  float inc2;
  
  angle1 = random(360);
  angle2 = random(360);
  
  
  for (inc1=0; inc1<360; inc1=inc1+1){
    for (inc2=0; inc2<360; inc2=inc2+1){
      x1 = cos (radians (angle1+inc1))*rad;
      y1 = sin (radians (angle1+inc1))*rad;
      x2 = cos (radians (angle2+inc2))*rad;
      y2 = sin (radians (angle2+inc2))*rad;
      
    }
    }
//
//  inc1 = random(360);
//  inc2 = random(360);
//
//  angle1 = random(inc1);
//  angle2 = random(inc2);
//
//
//  x1= cos (radians (angle1)) * rad;
//  y1= sin (radians (angle1)) * rad;
//  x2= cos (radians (angle2) )* rad;
//  y2= sin (radians (angle2) )* rad;

  stroke(random(255), random(255), random(255));

  line(x1, y1, x2, y2);
}


