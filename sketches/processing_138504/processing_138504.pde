
//very inefficent code to draw 'sorry' 

float f= PI;

  float x=850;
  float y=100;
  float lRad=50;
  float sRad=20;
  float angle=0;

void setup(){
  background(100);
  size(950,220);
}

void draw(){
  stroke(255,255,0);
  strokeWeight(3);
  line(450,50,450,150);
  line(550,50,550,150); 
  line(750,50,750,150);
  
  // letters are combination of half circle
  
  makeSorry m1 = new makeSorry(100f,100f,50f,0,f);
  makeSorry m2 = new makeSorry(200f,100f,50f,f,f*2);
  makeSorry m3 = new makeSorry(350f,100f,50f,0,f*2);
  makeSorry m4 = new makeSorry(550f,150f,100,f,f*1.4);
  makeSorry m5 = new makeSorry(650f,150f,100,f,f*1.4);
  makeSorry m6 = new makeSorry(700f,50f,50,0,f);
  makeSorry m7 = new makeSorry(700f,150f,50,0,f);
  //makeStar s1 = new makeStar(850f,100f,50f,20f);
  m1.ff();
  m2.ff();
  m3.ff();
  m4.ff();
  m5.ff();
  m6.ff();
  m7.ff();
  
  //and star
    float r=radians(angle);
    float sx=x+cos(r*3)*sRad;
    float sy=y-sin(r*3)*sRad;
    float ssx = sx+cos(r*2)*lRad;
    float ssy= sy + sin(r*2)*lRad;
    
    point(ssx,ssy);
    angle+=1;
}

class makeSorry{
  
   float x;
   float y;
   float radious;
   float end;
   float cosX;
   float sinY;
   float theta;
   float a;
   makeSorry(float x_, float y_, float radious_, float theta_,float end_){
     
     x=x_;
     y=y_;
     radious=radious_;
     theta=theta_;
     a=0.05;
     //theta=theta_;
     end = end_;
   }
     
   void ff(){
     for(float i=theta; i< end; i+=a){
     theta += a;    
     cosX = radious*cos(theta);
     sinY = radious*sin(theta);
     point(x+cosX,y+sinY);}
     }


     
}

