
float radius = 100;
float spacing = 10;

int pointTotal = 134;
void setup(){
  size(800,600);
  stroke(2,2,200);
  smooth();
  strokeWeight(5);
  pg = createGraphics(width, height);
}
void draw(){

  background(0);
  int pointSum = 0;
  float pointCount = PI*3/2*radius/spacing;
  for(int i=0;i<pointCount;i++){
    float angle = -PI*3/4+i*PI*3/2/pointCount;
    float x = width/2+radius*sqrt(2)+radius*cos(angle);
    float y = height/2+radius*sin(angle);
    waggle(x,y,float(pointSum)/pointTotal);
    pointSum++;
  }
  pointCount = 2*radius/spacing;
  for(int i=1;i<pointCount;i++){
    float x = width/2+radius/2*sqrt(2)-i*spacing/sqrt(2);
    float y = height/2+radius/2*sqrt(2)-i*spacing/sqrt(2);
    waggle(x,y,float(pointSum)/pointTotal);
    pointSum++;
  }
  pointCount = PI*3/2*radius/spacing;
  for(int i=0;i<pointCount;i++){
    float angle = -PI/4-i*PI*3/2/pointCount;
    float x = width/2-radius*sqrt(2)+radius*cos(angle);
    float y = height/2+radius*sin(angle);
    waggle(x,y,float(pointSum)/pointTotal);
    pointSum++;
  }
  pointCount = 2*radius/spacing;
  for(int i=1;i<pointCount;i++){
    float x = width/2-radius/2*sqrt(2)+i*spacing/sqrt(2);
    float y = height/2+radius/2*sqrt(2)-i*spacing/sqrt(2);
    waggle(x,y,float(pointSum)/pointTotal);
    pointSum++;
  }

//  println(pointSum);
//  exit();
}
void waggle(float x, float y, float parameter){
  float len = 25+5*cos(12*TWO_PI*parameter+TWO_PI*frameCount/60)
  +5*cos(9*TWO_PI*parameter-TWO_PI*frameCount/120);
  float angle = PI/2+PI/16*cos(7*TWO_PI*parameter+TWO_PI*frameCount/140)
  +PI/16*cos(13*TWO_PI*parameter-TWO_PI*frameCount/280);
  float x1 = x+len/2*cos(angle);
  float y1 = y+len/2*sin(angle);
  float x2 = x-len/2*cos(angle);
  float y2 = y-len/2*sin(angle);
  stroke(128+127*cos(9*TWO_PI*parameter+TWO_PI*frameCount/200),
  128+127*cos(12*TWO_PI*parameter-TWO_PI*frameCount/100),
  128+127*cos(18*TWO_PI*parameter+TWO_PI*frameCount/300));
  line(x1,y1,x2,y2);
  
}
void draw() {

 
 ellipse(mouseX,mouseY,10,10);
 if(mousePressed) {
    stroke(22,25,56);
    arc(mouseX, mouseY, random, random, 0, HALF_PI);
noFill();
arc(50, 55, 60, 60, HALF_PI, PI);
arc(50, 55, 70, 70, PI, PI+QUARTER_PI);
arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI);
  
  }else{ 
  fill(100,200,0);
   arc(mouseX, mouseY, 50, 50, 0, HALF_PI);
noFill();
arc(50, 55, 60, 60, HALF_PI, PI);
arc(50, 55, 70, 70, PI, PI+QUARTER_PI);
arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI);

 background(204);
  pg.beginDraw();
  pg.stroke(0, 102, 153);
  pg.line(0, 0, mouseX, mouseY);
  pg.endDraw();
  image(pg, 100, 100);
 
  
 
}}
