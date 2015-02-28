


int z,a,altb=0; // for the car fallowing paths which changes by mpuse click
float x,y,phi;
float[] punkte=new float[600];
PVector ort=new PVector(0,0,0);
PVector geschw=new PVector(0,0,0);
float segLength = 50;
float faktor=1;
float tempo=5;
int b=0;
int what=0;

PImage plane;  // for the spaceship image to fallow the mouse 
float t,r;
void setup()
{
    size (500,500,P2D);
  plane = loadImage ("plane.gif");

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
void draw()
{
background(322);
  stroke(255);
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
 
  for (int i = 0 ; i < width ; i = i+20) {
    if((i > width/2-60) && (i < width/2+40)) {
    stroke(0);    //Set color to black
  } else {
    stroke(255);  //Set color to white
  }// Set the beginning and end locations of horizontal ellipses
  for (int j = height/height + 25 ; j < height ; j = j+50) { //Set the beginning and end locations of vertical ellipses
     
    line(i, height/2, i+10, height/2);
    line(width/2,i,width/2,i+10);
     
    }
    }//set the road lines
  line(width/2-40,0,width/2-40,height/2-40);
    line(width/2+40,0,width/2+40,height/2-40);
      line(width/2-40,height,width/2-40,height/2+40);
      line(width/2+40,height,width/2+40,height/2+40);
      line(0,height/2-40,width/2-40,height/2-40);
      line(0,height/2+40,width/2-40,height/2+40);
      line(width,height/2-40,width/2+40,height/2-40);
      line(width,height/2+40,width/2+40,height/2+40);
      fill(30,90,30);
    
      rectMode(CORNER);

       
       
  rectMode(CENTER);



  fill(100);
  stroke(40);
noStroke();
  strokeWeight(1);
 
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
  // set the road tracks 
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
 
void mouseClicked(){  //with mouse click change by arrays 
  what=(what+1)%7;
  getarray();
}
void DisPlayScreen1()
{
  image (plane,r,t);  //make plane object fallow the mouse
  r=mouseX-25;
  t=mouseY-10;
}
 



