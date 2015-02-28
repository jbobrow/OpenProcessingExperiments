
int pointCounter;

float c1x, c1y;
float c2x, c2y;
float ox, oy;
float r1, radius2;
float  t = 0.5;
boolean joined;
float amount;
float inc;
float mod = 36.8;

void setup() {
  size(600, 600);
  background(0);
  c1x = width/2;
  ox = c1x;
  c1y = height/2;
  oy = c1y;
  c2x = random(200, width-200);
  c2y = random(200, height-200);
  r1 = 100;
  radius2 = 50;
  curveTightness(t);
  fill(100, 150, 255, 100);
}

void draw() {

  c2x = c1x;
  c2y = c1y-(frameCount%400);
  c2x = mouseX;
  c2y = mouseY;
  if (amount > 1.5) {
    amount = 1.5;
  }
  amount = 0;
  inc += (0.4*amount);
  amount *= 0.99;
  background(0);
  //rect(0,0,width,height);
  intersections();
  curveTightness(0.0);
}

void mouseMoved() {
  amount = amount + (dist(mouseX, mouseY, pmouseX, pmouseY) * 0.1 - amount) * 0.1;
}

void keyPressed() {
  if (key == 'x') { 
    mod += 0.05;
  }
  if (key == 'z') {
    mod -= 0.05;
  }
}

// compute and draw intersections
void intersections() { 
  float d = dist(c1x, c1y, c2x, c2y); // distance between centers
  float base, h;
  float px, py, q1x, q1y, q2x, q2y; 


  //if ellipses are separate
  if (d >= r1+radius2) {

    if (joined == true) {
      joined = false;
      amount+=1.0;
    }
    

    stroke(100,150,255, 25);
    for (int i = 2; i < 30; i+=5) {
      strokeWeight(i);
      ellipse(c1x, c1y, r1*2 + (sin(inc)*amount*5), r1*2 + (sin(inc+PI)*amount*5)); 
      ellipse(c2x, c2y, radius2*2 + (sin(inc)*amount*5), radius2*2 + (sin(inc+PI)*amount*5));
    }

    stroke(0);
    strokeWeight(2);
    fill(100,150,255,200);
    ellipse(c1x, c1y, r1*2 + (sin(inc)*amount*5), r1*2 + (sin(inc+PI)*amount*5)); 
    ellipse(c2x, c2y, radius2*2 + (sin(inc)*amount*5), radius2*2 + (sin(inc+PI)*amount*5));
  } 
  else if (d < abs(r1-radius2)) {

    if (joined == false) {
      joined = true;
      amount+=2.0;  
      ox = c1x;
      oy = c1y;
    }

    stroke(100,150,255,25);
    for (int i = 2; i < 30; i+=5) {
      strokeWeight(i);
      ellipse(c1x, c1y, r1*2 + (sin(inc)*amount*5), r1*2 + (sin(inc+PI)*amount*5));
    }

    stroke(0);
    strokeWeight(2);
    ellipse(c1x, c1y, r1*2 + (sin(inc)*amount*5), r1*2 + (sin(inc+PI)*amount*5)); 
  } 
  else {

    joined = false;

    // r1 = 100 + (50+radius2 - d/2);
    // c1x = ox + (c2x-ox) * 0.1;
    // c1y = oy + (c2y-ox) * 0.1;


    inc += (0.4*amount);

    //   if(joined == true){
    amount *= 0.99;
    if (amount > 0) { 
      t = sin(inc)*amount;
    } 
    else {
      t = 0.5;
    }
    //  }

    base = (r1 * r1 - radius2*radius2 + d * d) / (2*d);
    h = sqrt(r1*r1-base*base);

    px=c1x+base*(c2x-c1x)/d;
    py=c1y+base*(c2y-c1y)/d;

    q1x=px+h*(c2y-c1y)/d;
    q1y=py-h*(c2x-c1x)/d;
    q2x=px-h*(c2y-c1y)/d;
    q2y=py+h*(c2x-c1x)/d;


    //MIDDLE POINTS EXTERNALLY
    float mtx = (q1x + q2x) / 2;
    float mty = (q1y + q2y) / 2;

    float nm = atan2(mty-c2y, mtx-c2x);

    float nm2 = atan2(c1y-mty, c1x-mtx);

    float[] m = new float[2];
    float[] m2 = new float[2];

    println(mod);
    if (d-mod <= abs(r1-radius2)) {
      m[0] = c2x + cos(nm) * radius2;
      m[1] = c2y + sin(nm) * radius2;
      m2[0] = c1x - cos(nm) * r1;
      m2[1] = c1y - sin(nm) * r1;
    } 
    else {
      m[0] = c2x - cos(nm) * radius2;
      m[1] = c2y -  sin(nm) * radius2;
      m2[0] = c1x + cos(nm) * r1;
      m2[1] = c1y + sin(nm) * r1;
    }


    float[] l = getAverageAngle(m[0], m[1], q1x, q1y, c2x, c2y, radius2);
    float[] lm = getAverageAngle(m[0], m[1], l[0], l[1], c2x, c2y, radius2);


    float[] lf = getAverageAngle(l[0], l[1], q1x, q1y, c2x, c2y, radius2);


    float[] r = getAverageAngle(m[0], m[1], q2x, q2y, c2x, c2y, radius2);
    float[] rm = getAverageAngle(m[0], m[1], r[0], r[1], c2x, c2y, radius2);
    float[] rf = getAverageAngle(r[0], r[1], q2x, q2y, c2x, c2y, radius2);   

    float[] l2 = getAverageAngle(m2[0], m2[1], q1x, q1y, c1x, c1y, r1);
    float[] lm2 = getAverageAngle(m2[0], m2[1], l2[0], l2[1], c1x, c1y, r1);
    float[] lf2 = getAverageAngle(l2[0], l2[1], q1x, q1y, c1x, c1y, r1);
    float[] r2 = getAverageAngle(m2[0], m2[1], q2x, q2y, c1x, c1y, r1);
    float[] rm2 = getAverageAngle(m2[0], m2[1], r2[0], r2[1], c1x, c1y, r1);
    float[] rf2 = getAverageAngle(r2[0], r2[1], q2x, q2y, c1x, c1y, r1);  


    stroke(100, 150, 255, 25);
    for (int i = 2; i < 30; i+=5) {
      strokeWeight(i);
      beginShape();
      curveVertex(lf2[0], lf2[1]);
      curveVertex(q1x, q1y);
      curveVertex(lf[0], lf[1]);
      curveVertex(l[0], l[1]);
      curveVertex(lm[0], lm[1]);
      curveVertex(m[0], m[1]);
      curveVertex(rm[0], rm[1]);
      curveVertex(r[0], r[1]);
      curveVertex(rf[0], rf[1]);
      curveVertex(q2x, q2y);
      curveVertex(rf2[0], rf2[1]);
      curveVertex(r2[0], r2[1]);
      curveVertex(rm2[0], rm2[1]);
      curveVertex(m2[0], m2[1]);
      curveVertex(lm2[0], lm2[1]);
      curveVertex(l2[0], l2[1]);
      curveVertex(lf2[0], lf2[1]);
      curveVertex(q1x, q1y);
      curveVertex(lf[0], lf[1]);
      endShape();
    }
    stroke(0);
    strokeWeight(2);
    beginShape();
    curveVertex(lf2[0], lf2[1]);
    curveVertex(q1x, q1y);
    curveVertex(lf[0], lf[1]);
    curveVertex(l[0], l[1]);
    curveVertex(lm[0], lm[1]);
    curveVertex(m[0], m[1]);
    curveVertex(rm[0], rm[1]);
    curveVertex(r[0], r[1]);
    curveVertex(rf[0], rf[1]);
    curveVertex(q2x, q2y);
    curveVertex(rf2[0], rf2[1]);
    curveVertex(r2[0], r2[1]);
    curveVertex(rm2[0], rm2[1]);
    curveVertex(m2[0], m2[1]);
    curveVertex(lm2[0], lm2[1]);
    curveVertex(l2[0], l2[1]);
    curveVertex(lf2[0], lf2[1]);
    curveVertex(q1x, q1y);
    curveVertex(lf[0], lf[1]);
    endShape();
  }
}


float[] getAverageAngle(float x1, float y1, float x2, float y2, float cx, float cy, float radius) {
  float tempX = (x1 + x2) / 2;
  float tempY = (y1 + y2) / 2;
  float nearPoint = atan2(cy-tempY, cx-tempX);
  float edgeX = cx - cos(nearPoint) * radius;
  float edgeY = cy - sin(nearPoint) * radius;

  float[] p = new float[2];
  p[0] = edgeX;
  p[1] = edgeY;
  return p;
}



