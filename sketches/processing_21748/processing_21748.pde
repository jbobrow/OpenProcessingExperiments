
int x=0;
float a;
float b;
float c;

float u;
void setup()
 
  {
  size(600,600);
 smooth();
  stroke(255);
   background(0); 
  }
   
 
 
void draw()

 {


   float a= random (255);
  float b= random (600);
  float c= random (500);
  
  x=x+1;
  
  
  stroke (120);
  fill(190,150,0);
  ellipse(500,100,100,100);
  line (0,500,600,500);
  line (250,500,200,600);
  line (350,500,400,600);
  line (300,500, 300, 520); 
  line (300,530, 300,540);
  line (300,550, 300, 570);
  line (300,580, 300, 590);
     stroke (a);
     point(b,c);
     
     }
  

