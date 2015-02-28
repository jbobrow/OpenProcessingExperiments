
//import processing.opengl.*;

// copy source code and run with OPENGL ...P2D is too slow
// original source: http://www.fredrikolofsson.com/f0blog/?q=node/519
//creative pact day 2 by stephen monslow 2011

  float w,h,r,g,b;
  float n;
   int index = 0;


void setup(){
  
  
  size(640,480);
  smooth();
  

  w = width*0.5;
  h = height*0.5;
  
}



void draw(){


  background(0);
  
  

  
  
  n = sin(index*0.0015f)*5.0f+35.0f;
 
 for(int i = 0; i < n; i++) {
   float t= float(i)/n*PI*3.1;
   
  r = sin(t)*(sin(index*0.01f)*0.2f)+0.5f;
  b= sin(index*0.004f)*0.3f+0.7f;
   
   
   
   
 float a1= (sin(index*(sin(index*0.0025f+t)*0.01f+0.01f))*0.5f+0.5f)*PI*2;
                float a2= (sin(a1*index*0.0005f+t)*1.3f+0.9f)*PI;
                float r= h*1.75f*(1.0f-float(i)/n);
              strokeWeight(sin(index*0.0125f+t)*5.0f+5.5f);
              fill(r,g,g*random(1));
//               stroke(random(255),random(255),random(255));
                arc(w,h,r,r,a1,a2);
 
 }
 index++;
 


 
 
 
  
}
                
                
