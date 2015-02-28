
float x,y,angle;

void setup(){
 size(800,800);
  x = 0;
  y = 0;
  angle = 0;
  smooth(); 
}

void draw(){
  //x = cos(radians(angle)) * 200 + width/2;
  y = sin(radians(angle));
  y = map(y,-1,1,0,255);
  fill(y);
  rect(0,0,width,height);
  //ellipse(x,y+angle,100,100);
  //ellipse(x+angle,y,100,100);
  angle++; 
  
}

