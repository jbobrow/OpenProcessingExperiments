
PImage r,r2;

int m1 =0;
int m2 =0;
int d1 =0;
int d2 =0;
int s1 =0;
int s2 =0;

int a=255;
int inc=5;

float ang=0;
float inc1=0.05;

float x1=200;
float y1=75;
float x2=200;
float y2=75;

float inc2=0.5;

float x3=200;
float y3=150;
float x4=200;
float y4=150;

int a2=0;
int inc3= 5;

float x5=133.5;


void setup(){
  
  size(400,300, P3D);
  
  r= loadImage("rw.png");
   r2= loadImage("rw2.png");
 }

void draw(){
  
  background(0);
  
 noStroke();
  fill(255);
  imageMode(CORNER);
   image(r,x1,y1);
    
 if (s2==10) {
 s2=0;
 s1++;
 }
 if (s1==6) {
   s1=0;
   s2=0;
 d2++;
 }
 if (d2==10) {
 d2=0;
 d1++;
 }
 
 if(d2<6){
 s2++;
 }
 
 if(d2==0){
   
    a=255;
 inc=5;

 ang=0;
 inc1=0.05;

 x1=200;
 y1=75;
 x2=200;
 y2=75;

 inc2=0.5;

 x3=200;
 y3=150;
x4=200;
y4=150;

 a2=0;
 inc3= 5;
 }
 
  if(d2>0){

    a=a-inc;
    if(a==0){
    inc=0;
    
   
    pushMatrix();
   translate(x2,y2);
   rotateY(ang);
   
      fill(255);
   image(r,0,0);
   
   popMatrix();
    }
      }
       if(d2>1){ 
         
         ang=ang-inc1;
         
         if(ang<-PI){
    inc1=0;
    
    
   image(r2,x5,75);
   
    }
       }
       
       if(d2>2){ 
         
         x1=x1+inc2;
         x5=x5-inc2;
         x2=x2-inc2;
         
          stroke(255, a2);
          line(x3-3, y3, x4-3, y4);
       line(x3-2, y3, x4-2, y4);
       line(x3-1, y3, x4-1, y4);
     line(x3, y3, x4, y4);
     line(x3+1, y3, x4+1, y4);
     line(x3+2, y3, x4+2, y4);
     line(x3+3, y3, x4+3, y4);
         
         if(x1==215){
           
           inc2=0;
           
                      
           if(y3>105 && y4<200){
             
             y3--;
             y4++;
           }
           
           a2=a2+inc3;
    if(a2==255){
    inc3=0;
    }
           
         }
         
         if(d2>4){
           inc=5;
           a=a+inc;
           
           if(a==255){
    inc=0;
    }
         }
         
         
       }
       
      
    
     noStroke();
   
   fill(0,a);
   rect(0,0,400,300); 
      

}

void mousePressed(){
  
  s2=0;
  s1=0;
  d1=0;
  d2=0;
  x5=133.5;
  a2=0;
  a=255;
}




