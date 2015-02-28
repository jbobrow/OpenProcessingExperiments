
void setup(){
  size (800,600);
  smooth();
}

void draw(){
  noStroke();
  background(0);
  for(int yPos = 0; yPos < 800; yPos += 50){
    for(int xPos = 0; xPos < 900; xPos += 50){
      stroke(random(0,255),random(0,255),random(0,255));
      fill(random(0,255),random(0,255),random(0,255));
      rect(xPos,yPos,50,50);
      fill(random(0,255),random(0,255),random(0,255));
      ellipse(xPos,yPos,50,50);
    }
    stroke(0);
    strokeWeight(5);
    strokeJoin(ROUND);
    
    //fill(255);
    //triangle(275,175,350,275
    
    fill(255);
    ellipse(800/2,600/2,350,260); //head
    
    fill(250,245,56);
    ellipse(800/2,350,35,25); //nose
    
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(305,320,25,32); //left eye
    
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(495,320,25,32); //right eye
  }
  delay(0);
}
