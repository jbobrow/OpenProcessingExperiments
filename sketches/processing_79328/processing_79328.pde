
int n = 200;
float x; 
float y = 2;
float noiseY; 
float t = 0.;

float theta = 0.0;
int c = 0;
int d = 0;
int diam = 10;
float centX, centY;



void setup() {
  
  size(800,800);
  background(0);
  
  frameRate(10);

  

  

  
}



void draw() {

  smooth();
  stroke(0,0,255);
  
    
  
 
   if (noiseY >= 500) {
   noiseY = noiseY-1; 
  }
   for (int i = 0; i < n; i++) {
     y+= .01;
     x = i * (width/n) ;
     noiseY = noise (y) * height;  
     line (x,height,x ,noiseY);
    
     
   }
   
  
   
   fill(0);
   noStroke();
  
 float ypos = map(noise(t), 0., 1., 0, height);
  ellipse((frameCount*3 % width),  ypos-60, 10, 10); 
  ellipse((frameCount*2 % width),  ypos, 10, 10);
  ellipse((frameCount*4 % width),  ypos, 10, 10);
  ellipse((frameCount*5 % width),  ypos, 10, 10);
  ellipse((frameCount*6 % width),  ypos, 10, 10);
  t = t + 0.01;
  
  
  

  
  for (int diam = 0; diam<width ; diam+=10);
  {
     
    fill(0,random(150));
    noStroke();
    ellipse(400,noiseY/10 ,diam%1500,diam%1500);
     ellipse(400,noiseY/10 ,diam%500,diam%500);
    ellipse(400,noiseY/5 ,diam%2000,diam%2000);
    ellipse(400,noiseY/8 ,diam%1500,diam%1500);
    ellipse(400,noiseY/3 ,diam%2000,diam%2000);
    
   
     
    

    
    diam+=15;
  }
  
  
}


