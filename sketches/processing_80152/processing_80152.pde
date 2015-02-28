
int circleSize=200;
int direccion=0;

void setup(){
  size(800,800);
}

void draw(){
  background(50);

  int s= second();
  int m= minute();
  int h= hour();
  noStroke();
    fill(5*s,0,0,30);
ellipse(200,200, s*12, s*12);
  ellipse(600,200, s*12, s*12);
     ellipse(200,600, s*12, s*12);
       ellipse(600,600, s*12, s*12);
         ellipse(200,400, s*12, s*12); 
             ellipse(600,400, s*12, s*12);
                 ellipse(400,200, s*12, s*12);
                      ellipse(400,600, s*12, s*12);
                          ellipse(400,400, s*12, s*12);  
  s = s + direccion;
 if (s>=width || s<-1  )
 direccion = direccion *-1;
    
    }




