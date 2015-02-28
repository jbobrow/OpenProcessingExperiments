
float candyWidth;
float candyHeight;

float candyX;
float candyY;

void setup(){
  size(500,500);
  background(255);
  smooth();
  
  
  candyWidth = random(50,300);
  candyHeight = candyWidth * random(1,2);
  
  candyX = height/2;
  candyY = width/2;
}

void draw(){
  
  candyWidth = mouseX;
  candyHeight = mouseY;
  
  background(255);
  
  
  ellipse(candyWidth,candyHeight,100,100);
  line(candyX,candyY,250,450);
}



