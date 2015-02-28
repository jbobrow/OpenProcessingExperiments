
void setup()
{
  background(0,0,0);
  size(600, 600);
  rectMode(CORNERS);
  stroke(255);
  fill(0,0,0);
  ellipse(300,300,500,500);
  frameRate(1);
  line(300, 30, 300, 70);
}
float x=0;
float y=0;
float z=0;
void draw()
{
  strokeWeight(1);
  stroke(255);
  fill(0,0,0);
  ellipse(300,300,500,500);
  
  x = x+1 ; 
  
  line(300,300,300+200*cos(map(x,0,59,0,2*PI)-PI/2),
  300+200*sin(map(x,0,59,0,2*PI)-PI/2));
  
  strokeWeight(3);
  
  line(300,300,300+200*cos(map(y,0,59,0,2*PI)-PI/2),
  300+200*sin(map(y,0,59,0,2*PI)-PI/2));
  
  stroke(100,0,0);
  
 line(300,300,300+100*cos(map(z,0,59,0,2*PI)-PI/2),
  300+100*sin(map(z,0,59,0,2*PI)-PI/2));
  
  stroke(255);
  strokeWeight(4);
  line(300, 30, 300, 70);
  line(30, 300, 70, 300);
  line(570, 300, 530, 300);
  line(300, 570, 300, 530);
  
 if (x==59){
  x = 0;
  y = y+1;
 
 }
  if (y==59) {
   y = 0;  
   z = z+5;
 }   
  }
  

  




