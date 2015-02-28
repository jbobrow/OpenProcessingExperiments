
float a = 0;
float b = 0;
void setup()
{
 size(300,300); 
 background(255,255,255);
 smooth();
 noFill();
}

void draw()
{
  if ( a != 50 && b != 60){
    a =random(0,300);
    b =random(0,300);
  }
  else {
    a = 50;
    b = 60;
  
  }
  
  background(255);
  stroke(#3891F6);
  strokeWeight(4);
  ellipse(30,30,50,50);
  
  stroke(#FDFD0A);
  strokeWeight(4);
  ellipse(60,60,50,50);
  
  
  stroke(0,0,0);
  strokeWeight(4);
  ellipse(95,30,50,50);
  
  stroke(#2CD232);
  strokeWeight(4);
  ellipse(125,60,50,50);
  
  stroke(#FF0404);
  strokeWeight(4);
  ellipse(a,b,50,50);
}
  

