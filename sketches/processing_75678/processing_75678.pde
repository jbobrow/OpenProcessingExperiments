
float a;                          
float offset = PI/24.0;             
int num = 12;                     
color[] colors = new color[num];  
color safecolor;

boolean pink = true;

void setup() 
{ 
  size(640, 360, P3D);
  stroke(0);
  strokeWeight(2);
  //noStroke();  
  //for(int i=0; i<num; i++) {
 // }
 //lights();
 
} 
 

void draw() 
{     
  background(0, 0, 26,100);
  translate(width/2, height/2);
  a += 0.01;   
  
  for(int i = 0; i < num; i++) {
    pushMatrix();
    fill(random(10),random(55),random(25),250);
    rotateY(a * offset*i);
    rotateX(a/2 * offset*i);
    box(300);
    popMatrix();
  }
} 



