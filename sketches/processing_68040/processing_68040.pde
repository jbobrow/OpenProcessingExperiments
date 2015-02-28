
float a=0.0;
float b=0.0;
float c=0.0;

void setup()
   {
    size(500,700);
    background(#FFFFFF);
     smooth();
    }

void draw()
      {
        fill(255,0,0);
        arc (270,190,190,150,0+a,PI/4+a);
         a+=0.03;
        
        fill(0,0,255); 
        arc (180,480,90,90,0+c,PI/4+c);
         c+=0.03;  
         
        fill(0,255,0); 
        arc (160,360,50,50,0+b,PI/4+b);
         b+=0.03;
        }

