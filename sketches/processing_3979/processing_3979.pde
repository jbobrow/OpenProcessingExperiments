


float sep, nn, n, m, s;  
  
void setup(){  
 sep = 7;  
  nn = 20;  
  n=0; 
  m=millis(); 
  s=5; 
  size(500, 500);  
   
}  
  
void draw(){  
 noiseSeed(150);  
  n+=0.06; 
  s+=0.04; 
  
  background(177, 152, 255, 10);  
  for(float y =sep; y <= width-3*sep; y += nn/4){  
    for(float x = sep+20; x <= height-sep/2; x += 2.0*nn){  
 float N = noise(n); 
 float R = m%100; 
 float S= noise(s); 
    float f;  
      f = dist(mouseX, mouseY, x, y);  
      float diam;  
      diam = map(f, f, width, height, 7);   
      if(mousePressed==false){  
noStroke();  
  
        translate(mouseX*2,mouseY*2);  
        rotate(3);    
        fill(0);  
        triangle(width/3,height/3, 15*S,10,25,16);  
        fill(165, 0, 146);  
        triangle(width/2,height/2,6*(6*N),5,10,7);  
 fill(57, 0, 50);  
 triangle(width/4,height/4,20,3,7,5);  
     fill(255);  
       
    fill(9, 11, 88);  
    rect(mouseX,width/2,(15*N),7);  
    fill(7, 138, 242);  
    rect(mouseY,height/2,4*(f*N),6);  
    
      }  
    }  
  }  
}  
  
  


