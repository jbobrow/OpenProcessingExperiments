
form k, l;

form[] rects = new form[6];

    
void setup() {
      size(1000, 800);
      smooth();
      colorMode(HSB);
     
      background(60+x*0.6, 100+y*1.2, 255);

      rectMode(CENTER);
      
      for (int i=0;i<rects.length;i++) {
          rects[i]=new form(); //filling arrays from 1-10
     }
}

    
    
void draw() {

    fill(60+x*0.6, 100+y*1.2, 255,4);
    rect(0,0,width,height);

      
    for (int i=0;i<rects.length;i++) {

    rects[i].drawRect();
  }
}
    
    
float x =random(-20,30);
float y =random(-20,30);  
     


class form{
  

  float a=random(10,400);
  float b =random(20,300);
  
  float c = noise(a);
  float d = noise(b);
  
  float f = noise(x);
  float g = noise(y);
  
  float j=random(0.005,0.01);
  float h =random(0.0005,0.01);
  
  float k=random(0.005,0.01);
  float l =random(0.0005,0.01);
  
 void drawRect(){ 
 
      pushMatrix();
           
      translate(noise(frameCount*j-20)*width, noise(frameCount*h-20)*height);

      rotate(0.9);
      
      rotate(radians(a*1.4)+sin(c-d/10)+sin(d-c/2));
      
      
     stroke(50-y*2.3,20+c*0.1,120-x);
      fill(50*c-y, 160-y*2.3, 250+x*1.8, d*350+x);

      rect(c*(width)/6.2*sin(h), d*height/5.2*cos(j), c*54+c*0.1, d*70+d*0.8);
     
      fill(60*f+y, 20+x*1.2, 260-y, g*260+y*3.1);

      rect(f*(width)/6.2*cos(k), g*height/4.2*sin(l), f*44+f*3.4, g*60+g*0.8);
   
      
      b+=0.5;
      a+=2.56;

      popMatrix();
    }
    
}
    


