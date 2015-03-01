
float radius = 200;
float curDeg = 0;

void setup()
{
  size(600,600);
  frameRate(50);
}

void draw()
{
   
  background(0);
  translate(width/4, height/4);
  stroke(255,206,30);
  strokeWeight(10);
  
  curDeg +=6;
  float rad = radians(curDeg);
  float x =radius * cos(rad);
  float y = radius * sin(rad);
  line(0,0,x,y);
  line(300,0,x+300,y);
  line(0,300,x,y+300);
  line(300,300,x+300,y+300);
  
  if(mousePressed)
  {
     
  background(255);
  translate(width/2, height/2);
  
  curDeg +=6;
  float rad1 = (radians(curDeg));
  float x1 =radius * cos(rad1)/2;
  float y1 = radius * sin(rad1)/2;
  line(0,0,x1,y1);
  line(-300,0,x1-300,y1);
  line(0,-300,x1,y1-300);
  line(-300,-300,x1-300,y1-300);
  }
}
