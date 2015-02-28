
float deg = 0;

void setup ( ){
 
size(250, 250);
  
}

void draw ( ){
  
  background(#ffffff);  
  
  translate(125, 125);
  rotate(radians(deg));
  
  smooth( );
  noStroke( );
  fill(#000000);
    ellipse(0, 15, 250, 250);
    
  fill(#ffffff);
    rectMode(CENTER);
  noStroke( );
  rect(0, 98.3, 250, 150);
  
  int x=42;
  for(int i=0;i<6;i=i+1)
  {
    ellipse(-104.3+(x*i), 27.5, 53.5, 53.3);
  }
  
  fill(#000000);
  rectMode(CENTER);
  rect(0, -10.5, 11.55, 229);
  
  ellipse(15.21, 104.02, 41.96, 41.96);
  
  fill(#ffffff);
  ellipse(15.56, 104.02, 19.57, 19.57);
  
  rectMode(CENTER);
  rect(21.42, 90.04, 31.28, 27.96);
  
  deg++;
  
}

