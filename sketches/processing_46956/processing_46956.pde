
int abstand = 20;
void setup(){
  smooth();
  background(0);
  noStroke();
  size(600,400);
  noFill();
  frameRate(500);
  ellipseMode(CENTER);
  }

void draw(){
   
  abstand = mouseX+10;
  for(int j = 0; j<=height/abstand; j++){
    for(int i = 0; i<=width/abstand; i++){
  ellipse(abstand*i,abstand*j,50,50);
  }}
  
  randomSeed(mouseX);
  
  fill(255,5);
   if (frameRate%10==0) 
    ellipse(0,0,height,width);

  for(int i=0;i<10;i++){
    for(int j=0;j<10;j++){
   
  stroke(0,100);
  float r = random(2,100);
  ellipse(i*100+50 ,j*100+50,r,r);
      stroke(random(200,200),0,0, 100);
      r = random(2,100);
      ellipse(i*100+50 ,j*100+50 ,r,r);
    }
  }
}

