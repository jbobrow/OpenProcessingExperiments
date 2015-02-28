
int xOne, yOne;
int xTwo, yTwo;
int xThree, yThree;
int xFour, yFour;
float deg;


void setup(){
  
  size (600,600);
  
    xOne = -10;
  yOne = -10;
  
  xTwo = -10;
  yTwo = 10;
  
  xThree = 10;
  yThree = -10;
  
  xFour = 10;
  yFour= 10; 

}

void draw(){
  //background(255);
  translate(width/2, height/2);
  
    deg+=2;
  float rad = radians(deg);
  rotate(rad);

  
  for (int i=0; i<500; i++){
    fill(random(255),random(255),random(255));
   
    ellipse(xOne*i,yOne*i,10*i,10*i);
    ellipse(xTwo*i,yTwo*i,10*i,10*i);
    ellipse(xThree*i,yThree*i,10*i,10*i);
    ellipse(xFour*i,yFour*i,10*i,10*i);
  
  }
  
}



