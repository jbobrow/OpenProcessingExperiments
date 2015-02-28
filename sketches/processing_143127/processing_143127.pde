


void setup() { 


  size(600, 600); 


  smooth(); 


  noStroke(); 


  colorMode(RGB, 120); 


  rectMode(CENTER); 


  n = (long)random(500); 


  frameRate(5); 


} 


  


  


float xn, yn, zn; 


float xstart; 


long n; 


float a = random(10,255); 


  


void draw() { 


  background(0); 


  noiseSeed(n); 


  xn=noise(n);  


  yn=noise(n);  


    


  xstart=xn; 


  for (int i = 0; i <= width/5; i++) { 


    yn+=.05; 

//stroke, changes color
    zn+=2/100; 


    xn = xstart; 


    for (int j = 0; j <= height/5; j++) { 


      xn+=.02; 

//gradient, size
      float rs = noise(xn, yn, zn)*18; 
//color

      fill(255/rs*1.5, a, a, a); 


      rect(mouseX/100*i*5, mouseY/100*j*5, rs, rs); 
      ellipse(mouseX/100*i*5, mouseY/100*j*5, rs, rs); 


    } 


  } 


} 



