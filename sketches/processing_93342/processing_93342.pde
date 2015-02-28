
float y;

void setup () {
  size(700,220);
  background (255);
  smooth();
 
}

void draw () {
  fill(255,7);
  noStroke();
  rect(0,0,700,220);
  stroke(0);
 
  float x = 3;
  float sz = map(sin(y*1.7),-1,1,10,200);
  
  //line(20,sz,30,sz);

  
  while(x<width) {

    fill(0);
    line(x+15,sz,x+30,sz);
    
  x = x+50;
  y=y+0.002;
  }
  
  
}
  


