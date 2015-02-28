
void setup(){
  size(500,500);
  background(255,255,255);
  colorMode(HSB);
  rectMode(CENTER);
  ellipseMode(CENTER);
  noFill();
}

void function( float a, float b ){
float x = random(25,50);
float y = random(25,75);
stroke(150,a,b);
strokeWeight(random(5));
rect(a,b,x,y);
ellipse(a,b,x,y);
}
void draw(){


for(int c=25; c<width; c=c+50){
for(int d=25; d<height; d=d+50){
    function(c,d);
    noLoop();
  }
}
}
  

