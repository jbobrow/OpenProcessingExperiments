
//Jenny McCarthy HW: animation using transformations 2/22/14

void setup(){
  size(500,500);
  background(60,179,113); //medium sea green
  noStroke();
  smooth();
  frameRate(20);
}

float r=0;

void swirl(String c, float x,float y){  //function that spins text
  color from = color(0,255,255); //aqua
  color to = color(25,25,112); //midnight blue
  fill(lerpColor(from,to,random(0.0,1.0)),random(100,250)); //picks random colors between aqua and midnight blue
  rotate(r);
  textSize(24);
  text(c,x,y);
}

void swirl2(String c2, float x2,float y2){ //function that spins text
  color from = color(148,0,211); //dark violet
  color to = color(255,20,147); //deep pink
  fill(lerpColor(from,to,random(0.0,1.0)),random(50,150)); //picks random colors between dark violet and deep pink
  rotate(r);
  textSize(18);
  text(c2,x2,y2);
}

void draw(){
  fill(46,139,87,25);
  rect(0,0,width,height); //Fade effect
  
  translate (250,250);
  swirl("How goes it?",20+r*0.5,10.0);

  resetMatrix();
  translate (320,95);
  swirl2("Goodbye.",10+r,10.0);
  
  resetMatrix();
  translate (450,300);
  swirl("What's up?",15+r,10.0);
  
  resetMatrix();
  translate (100,400);
  swirl2("Buzz off!",15+r*0.75,10.0);
  
  resetMatrix();
  translate (60,175);
  swirl("Hello.",10+r*2,random(5,10));
  
  resetMatrix();
  translate (435,435);
  swirl2("Sayonara!",20+r*2,10.0);
  
 if (r<100){
   r=r+0.5;
  } else {
    r=0;
  }
}


