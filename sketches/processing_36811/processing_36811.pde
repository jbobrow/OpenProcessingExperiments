

void setup(){
  background(0);
  size(300,300);
  stroke(76,245,250,50);
  strokeWeight(5);
  line(0,25,300,25);
  line(25,0,25,300);
  strokeWeight(1);
  line(0,30,300,30);
  line(30,0,30,300);
  noStroke();
  fill(255,30);
}

int numOfTries = 25; 
float rectSize;

void draw(){ 
  rectSize = random(width);
  
  if(numOfTries > 0){
      rect(rectSize,random(height),rectSize/3,rectSize/3);
  }
  
  rectSize = random(height);
  
  if(numOfTries > 0){
      rect(rectSize,random(width),rectSize/2,rectSize/2);
  }
  
    numOfTries--;
}


