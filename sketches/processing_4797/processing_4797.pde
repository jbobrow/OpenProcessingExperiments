
int num=9;

float[] a= new float[num];
float[] b= new float[num];
float[] c= new float[num];
float[] angle = new float[num];
float[] BoWa = new float[num];
int[]co =new int[num];

float d0=10;
float d1=sqrt(sq(d0)+sq(3.3));
float d2=sqrt(sq(2*d0)+sq(3.3));
float d3=sqrt(sq(3*d0)+sq(2));
float an1=atan2(3.3,d1);
float an2=atan2(3.3,d2);
float an3=atan2(2,d3);

PVector[] loc =new PVector[num];
int g,i;


void setup() {
  size(400,400);
  smooth();
  noStroke();
  
  for (i=0; i<num; i++) {
    loc[i] = new PVector(random(width),random(height));
    co[i] = int(random(20,70));
    if (i!=0) {
    a[i] = a[i-1]+random(2,5);
    b[i] = b[i-1]+random(10,20);
    } else {
    a[i] = random(0,1);
    b[i] = random(1,10);
    }
  }
}

void draw() {
  background(255);
  for (i=0; i<num; i++) {
    move();

    //draw fish
    pushMatrix();
    translate(loc[i].x,loc[i].y);
    rotate(PI+angle[i]);
    drawFishbody();
    popMatrix();
  }
}

void move() {
  // movement
  a[i]+= .005;
  b[i]+= .005;
  angle[i] += (noise(a[i])-0.5)/15;
  loc[i].x += 3*cos(angle[i])* noise(b[i]);
  loc[i].y += 3*sin(angle[i])* noise(b[i]);


  //boundary
  if (loc[i].x>width+50) loc[i].x=-50;
  if (loc[i].x<-50) loc[i].x= width+50;
  if (loc[i].y>height+50) loc[i].y =-50;
  if (loc[i].y<-50) loc[i].y =height+50;


  //Fish wave the body according to its speed
  c[i] += 0.3*noise(b[i]);
  BoWa[i]=sin(c[i])*PI/15;
}

void drawFishbody() {
  fill(255,0,0,co[i]);
  beginShape();
  curveVertex(-d0,-d0);
  curveVertex(0,0);
  curveVertex(d1*cos(an1+BoWa[i]),d1*sin(an1+BoWa[i]));
  curveVertex(d2*cos(an2+BoWa[i]*1.2),d2*sin(an2+BoWa[i]*1.2));
  curveVertex(d3*cos(an3+BoWa[i]*1.4),d3*sin(an3+BoWa[i]*1.4));
  curveVertex(4*d0*cos(BoWa[i]*1.7),4*d0*sin(BoWa[i]*1.7));
  curveVertex(d3*cos(-an3+BoWa[i]*1.4),d3*sin(-an3+BoWa[i]*1.4));
  curveVertex(d2*cos(-an2+BoWa[i]*1.2),d2*sin(-an2+BoWa[i]*1.2));
  curveVertex(d1*cos(-an1+BoWa[i]),d1*sin(-an1+BoWa[i]));
  curveVertex(0,0);
  curveVertex(-d0,d0);
  endShape();
  pushMatrix();
  translate(4*d0*cos(BoWa[i]*1.7),4*d0*sin(BoWa[i]*1.7));
  rotate(BoWa[i]*1.35);
  beginShape();
  vertex(0,0);
  vertex(d0*0.5,-d0*0.2);
  vertex(d0,-d0*0.5);
  vertex(d0*0.95,0);
  vertex(d0,d0*0.5);
  vertex(d0*0.5,d0*0.2);
  vertex(0,0);
  endShape();
  popMatrix();
}






