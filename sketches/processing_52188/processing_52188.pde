
void setup ( ){
  
  size(250, 250);
  background(#ffffff);
  smooth( );
  noStroke( );
  fill(#000000);
    ellipse(125, 135, 250, 250);
    
  fill(#ffffff);
    rectMode(CENTER);
  noStroke( );
  rect(125, 198.3, 250, 125);
  
  int x=42;
  for(int i=0;i<6;i=i+1)
  {
    ellipse(20.7+(x*i), 152.5, 53.5, 53.3);
  }
  
  fill(#000000);
  rectMode(CENTER);
  rect(125, 114.5, 11.55, 229);
  
  ellipse(140.21, 229.02, 41.96, 41.96);
  
  fill(#ffffff);
  ellipse(140.56, 229.02, 19.57, 19.57);
  
  rectMode(CENTER);
  rect(146.42, 215.04, 31.28, 27.96);
  
}

