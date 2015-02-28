
//steering along a curve:
//the curve is described with a paramter,
//that means: y=f(parameter), x=g(parameter)
//this way loops are possible.
//on setup,the the parameter is divided in 200
//steps and the according points are calculated and stored in an array,
//together with the distances between a point and the next point,
//because this might be used for some kind of steering.
//the vehicles looks for the nearest point and then is going to the next point on the curve
//following the numbering in the array. So there is a clear direction of the movement.
//we can keep the velocity at a constant level or adapt it
//at the distance of the points.
//this works very well in general, but there is a problem,
//when the curve is intersecting itself - which way to go for
// the vehicle?
//It would be easy to solve that problem, when the points on the
//curve where in a strictly rising order - but often it´s not like that,
//for example with some of the curves in polar coordinates (the angel as
// the parameter, going around from 0 to 4PI in two turns.




int z,a,altb=0;
float x,y,phi;
float[] punkte=new float[600];
PVector ort=new PVector(0,0,0);
PVector geschw=new PVector(0,0,0);

float faktor=1;
float tempo=5;//ab ca. 10 überspringen von punkten
int b=0;
int what=0;

void setup() {
  size(600,600,P2D);
  // frameRate(30);
  smooth();
  rectMode(CENTER);
  getarray();
  //starting point and speed for the vehicle
  ort.x=punkte[0]+random(-300,300)-100;
  ort.y=punkte[1]+random(-300,300)-100;
  geschw.x=random(-13,13);
  geschw.y=random(-13,13);
}

void draw() {
  background(0);
  stroke(0);
  //drawing the stored points of the line if you want that
  for(int i=0;i<198;i++){
    stroke(0,30);
    line(punkte[3*i%600],punkte[(3*i+1)%600],punkte[3*(i+1)%600],punkte[(3*(i+1)+1)%600]);
    stroke(255,0,255);
    point(punkte[3*i],punkte[3*i+1]);
  }
  stroke(255,0,0);
  altb=b;
  b=findnearest(ort.x,ort.y);
  
  //the vehicle at ort.x/ort.y looks for the nearest point
  //with index b on the curve. from there, steering() will send it
  // to the next point with index b+1
  steering(b%198);
  display();
}
void display(){
  translate(ort.x,ort.y);
  rotate(atan2(geschw.y,geschw.x));
  fill(255,255,0);
  rect(0,0,30,15);
}

int findnearest(float ax, float by){
  float b;
  float c;
  int zaehler=0;
  b=dist(punkte[0],punkte[1],ort.x,ort.y);
  for(int i=1;i<199;i=i+1){
    c=dist(punkte[3*i],punkte[3*i+1],ort.x,ort.y);
    if(b>c){
      b=c;
      zaehler=i;
    }
  }
  if(abs(altb-zaehler)<5||abs(abs(altb-zaehler)-100)<5){
  return zaehler;}else{
     println(altb+"x"+zaehler);
    return (altb+2)%200;
   
}
}

void steering(int i){
  println(i);
  PVector kraft=new PVector(0,0,0);
  
  // kraft.set((2*punkte[3*(i+1)]+punkte[3*(i+2)])/3-ort.x,(2*punkte[3*(i+1)+1]+punkte[3*(i+2)+1])/3-ort.y,0);
  // kraft.set(punkte[3*(i+1)]-ort.x,punkte[3*(i+1)+1]-ort.y,0);
  kraft.set(punkte[3*(i+1)]-(ort.x+geschw.x),punkte[3*(i+1)+1]-(ort.y+geschw.y),0);
  kraft.mult(faktor);
  geschw.add(kraft);
  geschw.normalize();
  geschw.mult(tempo);
  ort.add(geschw);
}

void getarray(){
  float incr=2*TWO_PI/200;
  for(int i=0;i<200;i=i+1){
    switch (what){
    case 0:
      phi=(float) i*incr+0.13;
      punkte[3*i]=150*cos(phi)+100*cos(2*phi)+300;
      punkte[3*i+1]=150*sin(phi)-100*sin(3*phi)+300;
      break;
    case 1:
      phi=(float) i*incr;
      punkte[3*i]=150*cos(phi)+100*cos(3*phi)+300;
      punkte[3*i+1]=150*sin(phi)-100*sin(3*phi)+300;
      break;
    case 2:

      phi=(float) i*incr+0.02;
      punkte[3*i]=150*cos(phi)+100*cos(3*phi/2-1)+300;
      punkte[3*i+1]=150*sin(phi)-100*sin(phi/2+1)+300;
      break;
    case 3:

      phi=(float) i*incr+0.02;
      punkte[3*i]=150*cos(phi/2)+100*cos(3*phi/2+1.1)+300;
      punkte[3*i+1]=150*sin(phi+0.4)-100*sin(phi/2+2)+300;
      break;

    case 4:

      phi=(float) i*incr+0.02;
      punkte[3*i]=220*cos(phi/2+0.15)+300;
      punkte[3*i+1]=150*sin(phi+0.4)-100*sin(phi/2+2)+300;
      break;
    case 5:
      phi=(float) i*incr+0.13;
      punkte[3*i]=200*cos(phi)+300;
      punkte[3*i+1]=200*sin(phi+1)+300;
      break;
    case 6:
      phi=(float) i*incr/2;
      punkte[3*i]=50+50*(phi-PI)*(phi-7*PI/6);
      punkte[3*i+1]=300+100*sin(phi);
      ;
      break;
    }
  }
  for(int i=0;i<199;i=i+1){
    punkte[3*i+2]=dist(punkte[3*i],punkte[3*i+1],punkte[3*(i+1)],punkte[3*(i+1)+1]);
  }
}

void mouseClicked(){
  what=(what+1)%7;
  getarray();
}








