
int xIntensity, yIntensity;
int xStep, yStep;

void setup(){
  size(600,600);
}

void draw(){
  background(255);
  
  xIntensity = 5;
  yIntensity = 5;
  
  xStep = int( width / xIntensity );
  yStep = int( height / yIntensity );
  
  pushMatrix();
  translate(width/2,height/2);
  scale(0.5);
    for( int i = 0; i < 64; i++ ){
      rotate(i*PI/32);
      linegular();
    }
  popMatrix();  
}

void linegular(){
  for( int j = yStep, i = width; i > 0; i -= xStep ){    
    line(0,j,i,0);
    j+=yStep;  
    if(j>height) break;
  }
}


