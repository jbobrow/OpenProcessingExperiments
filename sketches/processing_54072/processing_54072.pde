
// This is expanded variable for wave on 'sunflower' one

float angle = 0.001;
float aVelocity = 0.005;
float aAcceleration = 0.001;

float startTheta = 0.002;
float thetaVel = 0.001;
float amplitude = 0.001;

void setup() {
  size(600,600);
  background(255);
  smooth();

}

void draw() {
  
  startTheta += 0.002;
  float theta = startTheta;
   
  rectMode(CORNER);
  noStroke();
  fill(255,20);
  rect(0,0,width,height);
  
  float amplitude = 0.001;
  float x = amplitude * cos(angle);
  float y = amplitude * sin(angle);
  
  angle += aVelocity;
  aVelocity += aAcceleration;
  
  for (int i = 0; i <= width; i +=1) {
  float a = map(sin(theta),-1,1,0,random(100)
  );
  fill(175);
  stroke(0);
  rectMode(CORNER);
  translate(mouseX,mouseY);
  rotate(angle);
  
  for (int j=0;j<4;j+=2){
  translate(width/2,height/2);
    rotate(PI/2*j);
  fill(random(250),random(50),random(50));
  noStroke();
  rect(x-10,y+140,20,20);
  rect(x-30,y+160,60,20);
  rect(x-50,y+180,100,20);
  rect(x-30,y+200,60,20);
  rect(x-10,y+220,20,20);
  rect(x-30,y+300,20,20);
  rect(x-50,y,0,20);
  rect(x-70,y+340,20,20);
  rect(x-90,y+360,20,40);
  
  theta += thetaVel;
 
   if(!mousePressed){
  } 
  
  }}}  



