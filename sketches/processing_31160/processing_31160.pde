
import ddf.minim.*;
Minim minim;


PFont f;
int counter;
int numObj=0;
int maxObj=12;

boolean overLap;

float x,y,r,_x,_y,_r;
int s,_s;
ArrayList i;
//obj[] i = new obj[numObj];
AudioSample[] theKick = new AudioSample[12];


void setup() {
  size(450,450); 
  smooth();
  x=200;
  y=200;
  s=2;
  r=30;
  _s=2;
  _r=20;
  mouseX=150;
  mouseY=100;
  numObj=0;

  f=loadFont("Comfortaa-48.vlw");
  textFont(f);

  minim = new Minim(this);
  i = new ArrayList();
  for(int lop=0; lop< theKick.length; lop++) {
    theKick[lop]= minim.loadSample(lop+".aif", 2048);
  }


  for(int lop=0; lop< numObj; lop++) {
    //  i[lop]= new obj(mouseX,mouseY, random(5,20),1, theKick[lop]);
    i.add( new obj(random(20,width-20),random(20,height-20), random(5,20),1, theKick[numObj]));
  }
}

void draw() {

  background(255);
  fill(0);
  text((maxObj-1)-numObj, 10,height-20);

  for(int lop=0; lop< numObj; lop++) {
    // i[lop].update();
    obj circ = (obj) i.get(lop);
    circ.update();
  }



  for(int lop=0;lop<i.size();lop++) {
    for(int j=lop+1;j<i.size();j++) {
      obj one = (obj) i.get(lop);
      obj two = (obj) i.get(j);
     // if(one.x+one.r > two.x-two.r && one.x-one.r < two.x+two.r)overLap=true;
     float d=dist(one.x, one.y, two.x, two.y); 
      if(d < one.r+two.r && d > (one.r+two.r)-5 ) {
        one.collision();
        two.collision();
      }
    }
  }
  
  ////calculating note

  
  
}//draw  

void mousePressed() {

  numObj+=1;

  if(numObj<maxObj) {
    i.add(new obj(mouseX,mouseY,5,1,theKick[numObj]));
    //obj j = new obj(mouseX, mouseY, 5, 1, theKick[numObj]);
    //i = (obj[]) append (i,j);
    println("click");
  }
  else {
    setup();
  }
}



void stop() {
  minim.stop();
  super.stop();
  //for(int lop=0; lop<theKick.length; lop++) theKick[lop].close();
}


