
float deltaX, deltaY, deltaTime, lineNum;
float prevMouseX, prevMouseY;
  
void setup() {
  size(1000, 600);
  deltaX = width/10;
  lineNum = 25;
  deltaY = height/lineNum;
  deltaTime = 0;
  noFill();
}
void draw() {
  background(0);
  strokeWeight(5);
  if (deltaTime>=deltaX) deltaTime=0;
  else deltaTime++;
  for (float j=0-deltaY; j<=height+deltaY; j+=deltaY) {
    beginShape();
    vertex(-deltaX, height-j -(deltaY/2));
    for (float i=-deltaX; i<=width+deltaX; i+=deltaX) {
      float colorFill = map(j, 0, width, 100, 255);
      float distance = sqrt((mouseX - prevMouseX)*(mouseX - prevMouseX)+(mouseY - prevMouseY)*(mouseY - prevMouseY));
      float frequency = map(distance, 0, 500 , 10,100);
      stroke(0, colorFill, colorFill);
      curveVertex(i+deltaTime+random(0, 5), height -  j + 1 - random(0, frequency)+-(deltaY/2));
      curveVertex(i+deltaTime+random(0, 5), height - (30 + j)+ 1 - random(0, frequency)+-(deltaY/2));
    }
    endShape();
  }
   
  prevMouseX = mouseX;
  prevMouseY = mouseY;
}
 
void mousePressed(){
  if(mouseButton == LEFT)
   lineNum+=10;
  else if(mouseButton == RIGHT){
     if(lineNum>0)
        lineNum-=10;
  }
   deltaY = height/lineNum;
}

