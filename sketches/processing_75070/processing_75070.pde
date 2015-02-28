
float x = 0.0;
float y=50.0;
float angle=0.0;
float speed=0.5;

float b=100;
void setup()

{ 
  
  size(600,600);
background (10);
  smooth();
  noiseSeed(   int(random(10))   );
}

void draw()

{
  pushMatrix();
  translate(300,300);
  
  
  angle+=noise(0.3*0.09);
  x+=cos(angle)*noise(speed)*2;
  y+=sin(angle)*noise(speed)*0.5;
  translate(x,y);
  rotate(angle*0.01);
  
  noStroke();
  //fill(0,10);
 // rect(0,0,width,height);
  fill(random(100),random(100,190.5),random(100,255),80);
  x=x*.09; //0.02
  translate(10,10);
  rotate(x);
  rect(0,0,random(800),random(1));

  
  popMatrix();

}
