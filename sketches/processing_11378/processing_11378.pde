
float w;   //2D space width  
float h;   //2D space height  
float dx;  //increment x this amount per pixel  
float dy;  //increment y this amount per pixel  
int dt;    //increment time   

void setup(){  

size(400,400);  
frameRate(1000); 
colorMode(HSB);
loadPixels();    
 w = 200.0f;         //2D space width   
 h = 200.0f;         //2D space height  
 dx = w / width;   //increment x this amount per pixel  
 dy = h / height;  //increment y this amount per pixel 
 dt = 0;     
}      
  float x0, x1, x2, x3, x4, x5, x6, x7, x8 = 0;  
  float y0, y1, y2, y3, y4, y5, y6, y7, y8 = 0; 

   
void draw(){  
  x0 = -28*w/64 +mouseX/40;
  x1 = -29*w/64 +mouseX/80; 
  x2 = -30*w/64 +mouseX/160;           
  x3 = -31*w/64 +mouseX/320;
  x4 = -32*w/64;
  x5 = -33*w/64 -mouseX/320;
  x6 = -34*w/64 -mouseX/160;
  x7 = -35*w/64 -mouseX/80;
  x8 = -36*w/64 -mouseX/40;
for (int i = 0; i < width; i++) {  
  
  y0 = 0;
  y1 = 0;
  y2 = 0;
  y3 = 0;
  y4 = 0;
  y5 = 0;
  y6 = 0;
  y7 = 0;
  y8 = 0;
  
  for (int j = 0; j < height; j++) {  
    
    float r0 = sqrt((x0*x0) + (y0*y0)); 
    float r1 = sqrt((x1*x1) + (y1*y1));    
    float r2 = sqrt((x2*x2) + (y2*y2));      
    float r3 = sqrt((x3*x3) + (y3*y3));
    float r4 = sqrt((x4*x4) + (y4*y4));
    float r5 = sqrt((x5*x5) + (y5*y5)); 
    float r6 = sqrt((x6*x6) + (y6*y6));  
    float r7 = sqrt((x7*x7) + (y7*y7));
    float r8 = sqrt((x8*x8) + (y8*y8)); 
   
    float val0 = cos(r0*mouseY/300 - TWO_PI*dt/8);
    float val1 = cos(r1*mouseY/300 - TWO_PI*dt/8);               
    float val2 = cos(r2*mouseY/300 - TWO_PI*dt/8);  
    float val3 = cos(r3*mouseY/300 - TWO_PI*dt/8);
    float val4 = cos(r4*mouseY/300 - TWO_PI*dt/8);
    float val5 = cos(r5*mouseY/300 - TWO_PI*dt/8);
    float val6 = cos(r6*mouseY/300 - TWO_PI*dt/8);
    float val7 = cos(r7*mouseY/300 - TWO_PI*dt/8);
    float val8 = cos(r8*mouseY/300 - TWO_PI*dt/8);
    
    pixels[i+j*width] = color((val0 + val1 + val2 + val3 + val4 + val5 + val6 + val7 + val8 +  9.0f) * (255.0 / 18) *1.32 ,360, 180 , 140);   //scale that value to 0 and 255  
    
    y0 += dy;
    y1 += dy;    //increment y  
    y2 += dy;      
    y3 += dy;
    y4 += dy;
    y5 += dy;
    y6 += dy;
    y7 += dy;
    y8 += dy;
  }  

  x0 += dx;   //increment x
  x1 += dx; 
  x2 += dx;  
  x3 += dx;
  x4 += dx;
  x5 += dx;
  x6 += dx;
  x7 += dx;
  x8 += dx;
}   

  dt += 1; //increment time  
  updatePixels();  

}  

   




