
float x=0;
float y=200;
float largh = 20;
float alt = 20;
float r =0;


void setup() {
  size(400,400);
  smooth();
  background(255);
}

void draw() {

  //background(255);
  noFill();
  stroke(r,0,0);
  ellipse(100,100, largh, alt);


  if (mousePressed) {
    noFill();
    stroke(0);
    smooth();

    smooth();
    // ellipse(100,100, largh, alt);
    alt=alt+10;
    largh=largh+10;
    r=r+10;
  
  }
  else {
alt -= 10;
largh -= 10;

if(largh <= 20 || alt <= 20 ){
  alt = 20;
  largh = 20;
  r=0;
  
}
    
  }
}



