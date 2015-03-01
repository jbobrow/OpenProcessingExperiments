
float i=-1000; 
color headCol= color(255, 255, 255);
color leg1Col= color(0, 255, 255);
color leg2Col= color(255, 0, 255);

void setup() {
  size(600, 600, P3D);
  frameRate(20);
  smooth();
}

void draw() {
  background(0);

  //head
  pushMatrix();
  translate(width/2, height/2+i, 0);
  noFill();
  strokeWeight(1);
  head();
  popMatrix();


  //leg 1
  pushMatrix();
  translate(width/3, height/2, 0);
  fill(leg1Col);
  stroke(leg1Col);
  strokeWeight(1);
  rotateY(radians(mouseX));

  if (mousePressed) {
    go = true;
    if (go) t += 0.01;
    if (t>1) {
      t=0; 
      go = false;
    }
    i =nLerp_hermite(i, 10, 500, 500, t);
    println("i : " + i);
    leg(i);
    leg(i);
  } else {
    i=0; 
    leg(i);
  }

  popMatrix();

  //leg2
  pushMatrix();
  translate(2*width/3, height/2, 0);
  fill(leg2Col);
  stroke(leg2Col);
  strokeWeight(1);
  rotateY(radians(mouseX));


  if (mousePressed) {
    i =nLerp_hermite(i, 10, 500, 500, t);
    println("i : " + i);
    leg(i);
    leg(i);
  } else {
    i=0; 
    leg(i);
  } 
  popMatrix();
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode==UP) {
      legpoint+=10;
      leg1Col=color(255, 255, 0);
      leg2Col=color(255, 94, 13);
    } else if (keyCode==DOWN) {
      legpoint-=10;
      leg1Col=color(0, 255, 255);
      leg2Col=color(255, 0, 255);
    }
  }
}

float delta=1;
float r1=200;
PVector [] brain = new PVector[64440];
int MAX_POINT = 64440;
int cnt =0;


void head() {
  cnt =0;
  for (float deg1 =0; deg1<360; deg1+=delta) {
    for (float deg2 =0; deg2<360; deg2+=delta) {
      float theta = radians(deg1);
      float vega = radians (deg2);

      float x = r1 * sin(theta) * cos(vega);
      float y = r1 * sin(theta) * sin(vega);
      float z = r1 * cos(theta);

      if (y<0) {

        brain[cnt++] = new PVector(x, y, z);
      }
    }
  }

  int maxLine = floor(random(100, 500));
  for (int i=0; i < maxLine; i++) {
    int prev = floor(random(0, MAX_POINT));
    int next = floor(random(0, MAX_POINT));

    stroke(headCol);
    if (keyPressed) 
      headCol=color(random(0, 255), random(0, 255), random(0, 255));

    line(brain[prev].x, brain[prev].y, brain[prev].z, brain[next].x, brain[next].y, brain[next].z);
  }
}

PVector cart = new PVector ();
float r = 60; 
float z=0;
float legpoint =10;
boolean go = false;

void cylinderical2cartesian(float radius, float deg, PVector cartesian) {
  float theta = radians(deg);
  cartesian.x = radius * cos(theta);
  cartesian.y = radius * sin(theta);
}


float t= 0; 

float nLerp_hermite(float s, float e, float s_s, float e_s, float t) {
// Non-linear Interpolation using hermite interpolation
// t : 0 - 1
// s : start value, e: end value, s_s: start_slope, e_s: end_slope 
println("t : " + t);
float t2 = t*t;
float t3 = t2*t;
return (2*t3-3*t2+1)*s + (-2*t3+3*t2)*e + (t3-2*t2+t)*s_s + (t3-t2)*e_s;
}

void leg (float i) {
  int count=1;
  for (z=i; z<i + 180; z += 15) { 
    if(count > 10){
      break;
    }
    //println(z);

    strokeWeight(3);
    beginShape(TRIANGLE_STRIP); 
    for (float deg=0; deg<360; deg+=legpoint) {
      cylinderical2cartesian(r, deg, cart);
      vertex(cart.x, z, cart.y);
      cylinderical2cartesian(r, deg+15, cart);
      vertex(cart.x, z, cart.y);
    }
    endShape(CLOSE);
    count++;
  }
  
}






