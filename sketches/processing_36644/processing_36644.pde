
void setup() {
  size(400,400);
  background(255);
}

int numOfTries = 4;
float rndRadius;

void draw(){
  rndRadius = random(width);
  
  if(numOfTries > 0){
    strokeWeight(4);
    line(200,0,200,400);
    fill(0);
    ellipse(200-25,random(height),50,50);
    ellipse(200+25,random(height),50,50);
    line(100,0,100,400);
    ellipse(100-25,random(height),50,50);
    ellipse(100+25,random(height),50,50);
    line(0,0,0,400);
    ellipse(0-25,random(height),50,50);
    ellipse(0+25,random(height),50,50);
    line(300,0,300,400);
    ellipse(300-25,random(height),50,50);
    ellipse(300+25,random(height),50,50);
    line(400,0,400,400);
    ellipse(400-25,random(height),50,50);
    ellipse(400+25,random(height),50,50);
  }
  numOfTries--;
  
}

