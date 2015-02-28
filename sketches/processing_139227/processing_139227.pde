
void setup(){
  size(displayWidth,displayHeight);
  background(0);
  ellipseMode(CENTER);
}
 
void draw(){
  for(int i=0; i<displayHeight; i+=50){
    for(int j=0; j<displayWidth; j+=50){
      myLine();
      myEllipse();
      translate(50,0);
    }
    translate(-displayWidth-10,50);
  }
}

void myLine(){
  stroke(0);
  float ax = random(-10,60);
  float ay = random(-10,60);
  float bx=25;
  if(ax<25) bx+=(25-ax); else if(ax>25) bx-=(ax-25);
  float by=25;
  if(ay<25) by+=(25-ay); else if(ay>25) by-=(ay-25);
  line(ax,ay,bx,by);
}

void myEllipse(){
  noStroke();
  fill(random(0,50), 50, random(200,255), 5);
  ellipse(25, 25, random(0,75), random(0,75));
}
 
