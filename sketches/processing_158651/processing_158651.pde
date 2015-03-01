
float x=1;
void setup(){
  size(500,500);
  colorMode(HSB);
  noStroke();
  frameRate(100);
}


void draw(){
  background(0);
  translate(width/2,height/2);
  rotate(PI);
  for (float t=1; t<width/2; t++){
    fill(t,240,240);
  rotate(137.5*PI/180);

  if(t-width/2+x > 0){
 
   Octagon(int(t-250+x),0,int(2*sqrt(abs(t-250+x))));

  }
  }
  x+=.1;
  
  
  if(mousePressed){
    x=mouseX;
  }
  if(x>height-100){
  noLoop();
  }
}


void Octagon(int posX, int posY, float radius)
{
 
  float x, y;
  
  
  beginShape();
  
  for (int i=0;i<8;i++)
  {
    x=cos(radians(45*i))*radius+posX;
    y=sin(radians(45*i))*radius+posY;
    vertex(x, y);
  }
  
  endShape(CLOSE);
   
}

