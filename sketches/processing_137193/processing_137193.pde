
float a,b,c,d;
float angle,radius;
int i;


//void setup(){
  size(640,640);
  background(255);
  angle=0;
  //radius=1.1;
//}

//void draw(){
  //angle=angle*1.1;

//fill(255);
//rect(320,320,640,640);
  for (i=0; i<200;i++){
    //fill(255,250);
   // angle+=25;
   angle+=15;
    //radius=pow(1.04,i);
    radius=pow(1.1,i);
    c=sin(radians(angle))*(radius)/10;
    d=cos(radians(angle))*(radius)/10;
    rectMode(CENTER);
    noStroke();
    fill(30,7,180,15);
    rect(320+c,320+d,17,17);
    fill(170,1,75,15);
    ellipseMode(CENTER);
    //stroke(1);
    ellipse(320+c,320+d,2.2*i,2.2*i);
    //line
  }
//}

