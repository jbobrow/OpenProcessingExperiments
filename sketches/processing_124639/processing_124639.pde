
void setup(){
  size(600,600);
}

void draw(){
  background(255);
  
  int xIntensity = 10;
  int yIntensity = 10;
  
  int xStep = int( width / xIntensity ); 
  int yStep = int( height / yIntensity ); 
  
  for( int j = yStep, i = width; i > 0; i -= xStep ){    
      line(0,j,i,0);
      j+=yStep;  
      if(j>height) break;
  }  
}


