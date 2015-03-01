
//FEAR

float counter=0;
int a= 100;

void setup()
{
  size(600,400);

  colorMode(HSB, 360,100,100);
  smooth();
  background (0,13,82, 120); 
  
}

void draw()

{  
  noStroke();
  fill(0,13,82, 120);
  rect(0, 0, width, 400);
 
  float m = map(sin(counter),-1,1,0,300);
  float counter_Mouse= map(mouseX,0,width,0.01,0.05);
  float amplitude = map(sin(counter),-1,1,0,66);
  
  ellipseMode(CENTER);
  translate(0,200);

  fill(0);
  ellipse(m,0,a,a);
  
  translate(width,00);
  noStroke();
  fill(354,98, amplitude);
  ellipse(0,0,250,250);
  
  counter+= counter_Mouse;
  
  if (a<width/2){
        a+= random(-10,10); 
          
      }
      
      if (a>200){
      a-= 50;
      }
           
      if (a<0){
      a=+50; 
      }
}
