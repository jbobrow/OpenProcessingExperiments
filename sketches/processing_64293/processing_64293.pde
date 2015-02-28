
float x=0;
float y=50;
float z=0;

void setup(){
  size(500,500);
  background(0);
  colorMode(HSB);
  strokeWeight(10);
}



void draw() {
  //change 2nd parameter to 100 for a more accurate picture
  float rofl=map(x,0,505,0,255);
stroke(rofl,255,255);
  point(x, y);

 


  if (y>=450) {

    y=40;
    
  }

    x=x+1.5;
    y=y+10;
  
}


