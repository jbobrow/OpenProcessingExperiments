
int xIntensity, yIntensity;
int xStep, yStep;

void setup(){
  size(600,600);
}

void draw(){
  background(255);
  
  xIntensity = 10;
  yIntensity = 10;
  
  xStep = int( width / xIntensity );
  yStep = int( height / yIntensity );
  
  pushMatrix();
  translate(width/2,height/2);
  scale(0.5);
    for( int i = 0; i < 4; i++ ){
      rotate(i*PI/2);
      linegular();
    }
  popMatrix();  
  
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
}

void linegular(){
  for( int j = yStep, i = width; i > 0; i -= xStep ){    
    line(0,j,i,0);
    j+=yStep;  
    if(j>height) break;
  }
}


