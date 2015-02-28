
float[] arcStartPositions = new float[3];
float arcBoundSize, arcMaxBoundSize = 80;

void setup(){
  size(80,80);
  frameRate(30);
  rectMode(CENTER);
  smooth();
  for(int i=0;i<arcStartPositions.length;i++){
    arcStartPositions[i] = PI/8*i;
  }
}

void draw(){
  background(255);
  arcBoundSize = arcMaxBoundSize;
  for(float s:arcStartPositions){
    arcLength = random(PI,8*PI/6);
    color c = color(random(0,255),random(0,255),random(0,255));
    stroke(c);
    arc(arcMaxBoundSize/2,arcMaxBoundSize/2,arcBoundSize,arcBoundSize,s,s+arcLength);
    arcBoundSize-=10;
  }
  for(int i=0;i<arcStartPositions.length;i++){
    arcStartPositions[i]+=PI/8;
  }
}
