
float a =0.0;
float b =0.0;
float c =0.0;

void setup()
{
  size(500,500);
  
  noStroke();
  rectMode(CENTER);
  frameRate(20);
  smooth();
}

void draw()
{

  
  a = a + 0.04;
  b = cos(a)*4.5;
  c = sin(a)*7;
  
  
   background(0);  
  translate(width/2,height/2);
  scale(b);
  fill(255);
  ellipse(0,0,50,50);
  
  translate(-100,-100);
  fill(250);
  scale(b);
  ellipse(0,0,-50,-50);
  
  translate(-100,-100);
  fill(250);
  scale(b);
  ellipse(0,0,-50,-50);
  
  translate(-200,-200);
  fill(250);
  scale(b);
  arc(100,100,100,100,100,100);
  
 
  
   
  
  
  

}
 
 void mousePressed(){
 background(random(999));

 }

  
  
  
  

