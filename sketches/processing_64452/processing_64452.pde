
float x=0;
float y=0;

float destx=0;
float desty=0;

void setup() {

  size(500, 500);
  fill(255, 0, 0);
  noStroke();
  destx=random(width);
  desty=random(height);
}

void draw() {
  background(255);  



  ellipse(x, y, 20, 20);

  //What??
  x=lerp(x, destx, 0.05);
  y=lerp(y, desty, 0.05);

  float d =dist(x,y, destx, desty);
  if (d<1) {
destx=random(width);
  desty=random(height);
  
  }if(d<50){
    noFill();
    stroke(255, 0, 0);
    ellipse(x, y, 100-d, 100-d);
    fill(255, 0, 0);
    noStroke();
  }
}


