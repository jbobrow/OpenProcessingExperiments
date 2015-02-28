
PVector b=new PVector(0,0,1);
//direction of the magnetic field
Particle partic,partic1,partic2;
PVector v1;
PVector ort1;
PVector nulli=new PVector(0,0,0);
int zeit=0;
boolean splitted=false;
color bg=color(50, 100, 150);

void setup() {

  size(800,600);
  frameRate(60);
  smooth();
  rectMode(CENTER);
  v1=new PVector(12,0,0);
  background(bg);
  ort1=new PVector(0,300,0);
  partic=new Particle(0,50,v1, ort1);
  partic1=new Particle(0,0,nulli,ort1);
  partic2=new Particle(0,0,nulli,ort1);

}

void draw() {

  partic.update();
  partic.display();
  partic1.update();
  partic1.display();
  partic2.update();
  partic2.display();
  if(int(random(0,200))%101==0&&splitted==false){
    //0.5 percent chance per frame to splitt  up
    splitt();
    zeit=0;
    splitted=true;
  }
  zeit=zeit+1;
  if(zeit%10==0){
    fill(red(bg),green(bg),blue(bg),1);
    rect(width/2,height/2,width,height);

  }
  if(splitted&&zeit>300){
    //a new particle 300 frames after splitting up
    NEU();
    splitted=false;
  }
}
void mousePressed(){
  // saveFrame("bubble_chamber##.tif");
  background(bg);
  NEU();
}
void NEU() {
  filter(BLUR,1);
  partic.ort.x=00;
  partic.ort.y=random(100,500);
  partic.ort.z=0;
  partic.v.x=random(6,9);
  partic.v.y=random(-3,3);
  partic.v.z=0;
  partic.masse=50;
  partic.ladung=int(random(-2,2.8));

  partic1.ort.x=0;
  partic1.ort.y=200;
  partic1.ort.z=0;
  partic1.v.x=0;
  partic1.v.y=0;
  partic1.v.z=0;
  partic1.masse=50;
  partic1.ladung=0;

  partic2.ort.x=0;
  partic2.ort.y=200;
  partic2.ort.z=0;
  partic2.v.x=0;
  partic2.v.y=0;
  partic2.v.z=0;
  partic2.masse=50;
  partic2.ladung=0;
}


void splitt(){
  float v1x=random(-12,12)+partic.v.x;
  float v1y=random(-12,12)+partic.v.y;
  PVector v1=new PVector(v1x,v1y,0);
  PVector ort1=new PVector(partic.ort.x,partic.ort.y,partic.ort.z);

  partic1.ladung=int(random(0.2,4.4));
  partic1.masse=random(0.3,0.6)*partic.masse;
  partic1.v.set(v1);
  partic1.ort.set(ort1);


  float m2=partic.masse-partic1.masse;
  float v2x=-partic1.v.x*partic1.masse/m2;
  float v2y=-partic1.v.y*partic1.masse/m2;
  float q2=partic.ladung-partic1.ladung;
  PVector v2=new PVector(v2x,v2y,0);

  partic2.ladung=q2;
  partic2.masse=m2;
  partic2.v.set(v2);
  partic2.ort.set(ort1);
  //total momentum, mass and charge preserved

  //now taking partic out of the game for restart
  partic.v.x=0;
  partic.v.y=0;
  partic.ort.x=0;
  partic.ort.y=0;
  partic.ladung=0;
  partic.masse=1;


}


PVector bb2(float x, float y){
  PVector bb2=new PVector(0,0,1);
  //magnetic field in z-direction
  return bb2;
}









