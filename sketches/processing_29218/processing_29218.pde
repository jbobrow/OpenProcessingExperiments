
// original source, pakt 27 from RedFriks cinder experiments
// http://www.fredrikolofsson.com/f0blog/

// adapted by stephen monslow, day 4 creative pact

float index;
float w,h;
int n;
float ra,r,g,b;

void setup() {
  size(640,480);
  smooth();
  n=30;
  w=width*0.5;
  h=height*0.5;
  
}





void draw() {

  
  if(random(1)>0.9) ra = random(11);
  background(0);
  
  if(random(1)>0.9) r = random(255);
    if(random(1)>0.9) g = random(255);
      if(random(1)>0.9) b = random(255);
  
  
  
for(int i= 0; i<n; i++) {
                float t= float(i)/n*PI*0.5;

float c= (sin(index*0.0036f+t)+cos(index*0.022f-t))*0.01f;
                float d= (cos(index*0.0033f+t)+sin(index*0.020f-t))*0.01f;
                float r= sin(t)*33.0f+30.0f;
                
                fill(r,g,b);
                ellipse(w+(sin((index*(d*0.95f))+c+t)*(w*0.8f)*ra), h+(cos((index*(c*0.95f)*ra)+d+t)*(h*0.7f)), r,r);
                
 
 index+=0.011;               
}
}

