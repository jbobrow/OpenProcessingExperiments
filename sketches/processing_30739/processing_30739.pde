

// animated cross using perlin noise
//

float x,y;

void setup(){
  size(400,400,P2D);
  smooth();
}


void draw(){
  
 fill(0,1); 
  rect(0,0,width,height);
  y= noise(x/50)*width;
  stroke(255);

  line(x,y,0,y);
 
  line(y,x,y,0);
  x++;
  if(x==width || x==0) x*=-1+x;
}
                
                
