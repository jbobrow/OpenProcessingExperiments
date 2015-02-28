
int stars=1000;

float[] xCoord = new float[stars];
float[] yCoord = new float[stars];

float[] xMove = new float[stars];
float[] yMove = new float[stars];

void setup(){
  background(0);
  size(500, 500);
  noStroke();
  
  for(int i=0; i<stars; i++){
    xCoord[i]=width/2;
    yCoord[i]=height/2;
    
    xMove[i]=random(-5,5);
    yMove[i]=random(-5,5);
  }
}
void draw(){
  background(0);
  strokeWeight(2);
  for(int i=0; i<stars; i++){
    stroke(random(255), random(255), random(255));
    point(xCoord[i], yCoord[i]);
    //fill(random(255), random(255), random(255));
    //ellipse(xCoord[i], yCoord[i], 5, 5);
    xCoord[i]+=xMove[i];
    yCoord[i]+=yMove[i];
    
    if(xCoord[i]>width||xCoord[i]<0||yCoord[i]>height||yCoord[i]<0)
    {
      xCoord[i]=width/2;
      yCoord[i]=height/2;
      xMove[i]=random(-5,5);
      yMove[i]=random(-5,5);
    }
  }
}


