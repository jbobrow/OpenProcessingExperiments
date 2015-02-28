
int patternSeperationX = 100;
int patternSeperationY = 100;
 
void setup(){
 
  size(600,700);
    background(5);

  noFill();
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
    
  for(int i = 1; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
}}
  
  
void yourFunction(){
 smooth();
  translate(random(1,30),random(1,90));
 

strokeWeight(random(0.2,1.5));
int x;
float a = 0;
float b = 0;
float c = 255;
float w = random(5,9);
 for( x=0; x<100; x=x+9)
{
 
color from= color(255,0,209);
color to = color(255,2470);
 ellipse(10,10,50,x);
}
  
{

int y;
for( y=0; y<100; y=y+9)
{
 
  color from= color(90,0,75);
color to = color(255,0,209);
color fade = lerpColor(from,to,b);
  b=b+0.09;
    stroke(fade);
ellipse(10,10,y,50);
}}}

   
