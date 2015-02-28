
float s =5 ;
float s2 =12;
float s3 = 12;
float s4 = 12;
float trans = 255;
float fps = 500;
float x = 80;
float x2 = 120;
float x3 = 170;


void setup() {
  size(250,250);
  smooth();
  background(0);
  frameRate(fps);
}

void draw() {
  noFill();
  background(0);
  stroke(50,250,50);
  strokeWeight(1);
  line(0,125,250,125);
  line(125,250,125,0);
  ellipse(width/2,height/2,70,70);
  ellipse(width/2,height/2,130,130);
  ellipse(width/2,height/2,190,190);
  ellipse(width/2,height/2,250,250);
  if(s>x){
    fill(250,0,0,trans-50);
    noStroke();
    ellipse(x,height/2,s2,s2);
     s2-=0.05;
  }
  if(s>x2){
    ellipse(x2,60,s3,s3);
    s3-=0.05;
  }
  if(s>x3){
    ellipse(x3,190,s4,s4);
    s4-=0.05; 
  }
  noFill();
  strokeWeight(3);
  stroke(50,250,50,trans);
  ellipse(width/2,height/2,s,s);
  stroke(50,250,50,trans-50);
  ellipse(width/2,height/2,s-6,s-6);
  stroke(50,250,50,trans-75);
  ellipse(width/2,height/2,s-12,s-12);
  stroke(50,250,50,trans-100);
  ellipse(width/2,height/2,s-18,s-18);
  stroke(50,250,50,trans-125);
  ellipse(width/2,height/2,s-24,s-24);
  stroke(50,250,50,trans-150);
  ellipse(width/2,height/2,s-30,s-30);
  stroke(50,250,50,trans-175);
  ellipse(width/2,height/2,s-36,s-36);
  s+=1.5;
  trans-=1;

  if (s>250) {
    s = 5;
    s2 =12;
    s3 =12;
    s4 =12;
    trans = 255;
  }
}


