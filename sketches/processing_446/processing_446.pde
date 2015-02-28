
//globals
float x1;
  float y1;
  float x3;
  float y3;


  float randomRangex = 100;
  float randomRangey = 100;
  
  int RedRange = 255;
  int GreenRange = 0;
  int BlueRange = 0;

void setup(){
  
x1 = -50;
y1 = random(450);
x3 = -50;
y3 = random(450);

size(800,450);
background(255);
strokeWeight(.5);
frameRate(50);

}

void draw(){
    
    float xSpacing1 = random(-7,8);
    float xSpacing2 = random(-7,8);

    float yModifier1 = random(-5,5);
    float yModifier2 = random(-5,5);
    
 y1 = y1 +yModifier1;
 y3 = y3 +yModifier2;
 
 x1 = x1 + xSpacing1;
 x3 = x3 + xSpacing2;

  float b1 = random(-randomRangey,randomRangey);
  float m1 = random(-randomRangex,randomRangex);
  float b2 = random(-randomRangey,randomRangey);
  float m2 = random(-randomRangex,randomRangex);

  float x2 = x1 + m1;
  float y2 = y1 + b1;

  float x4 = x3 + m2;
  float y4 = y3 + b2;
  

  line(x1,y1,x2,y2);
  line(x3,y3,x4,y4);

  
  float r = random(RedRange);
  float g = random(GreenRange);
  float b = random(BlueRange);
  
  stroke(r,g,b);
  
if(mousePressed) {
  setup();

}
}


