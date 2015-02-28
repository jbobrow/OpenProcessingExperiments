
float cenX;
float cenY;
float horX;
float horY;
float minX;
float minY;
float secX;
float secY;
float rad;
float bigRad;


void setup() {
  size(1000, 1000);
  strokeWeight(.5);
  stroke(255);
  float col=map(hour(),0,7,0,100);
  float col2=map(hour(),7,15,100,200);
  float col3=map(hour(),15,23,200,0);
  float ocol=map(hour(),0,7,0,30);
  float ocol2=map(hour(),7,15,30,110);
  float ocol3=map(hour(),15,23,110,0);
  if((hour()>=0) && (hour()<=7)){
  background(ocol,ocol,col);
  }else if((hour()>=7) && (hour()<=15)){
    background(ocol2,ocol2,col2);
  }else if((hour()>=15) && (hour()<=23)){
    background(ocol3,ocol3,col3);
  }
}

void draw() {
  
  //line(width/2, 0, width/2, height);
  //line(0, height/2, width, height/2);
  cenX=width/2;
  cenY=height/2;
  horX=cos(radians(hour()*30));
  horY=sin(radians(hour()*30));
  minX=cos(radians(minute()*6));
  minY=sin(radians(minute()*6));
  secX=cos(radians(second()*6));
  secY=sin(radians(second()*6));
  rad=100;
  bigRad=400;


  translate(cenY+bigRad*horY, cenX-bigRad*horX);
  rotate(radians(270));
  strokeWeight(1);
  noFill();
  //ellipse(0, 0, 200, 200);
  if (second()==0) {
    stroke(random(170, 255), random(170, 255), random(170, 255));
  }
  line(rad*minX, rad*minY, rad*secX, rad*secY);
}


