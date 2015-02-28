
void setup(){
  size(600,800);
  smooth();
}

void draw(){
  background(117,50,200);
  translate(width/15,height/6);
  for(int i = 0; i< 360; i++){
    rotate(radians(2));
    line(60,25,0,5000);
  }
  for(int i=0; i<width; i++){
    float colorValue = map(i,110,width,0,275);
    noFill();
    stroke(255,167,75,colorValue);
    ellipse(0,0,i*75,i*75);

  }
}

