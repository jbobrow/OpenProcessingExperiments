
float m,s,p,a,b,h,xpos,ypos,oxpos,oypos,t,ot,d,od;
int centerX,centerY;

void setup() {
  size(800,700);
  smooth();
 
  centerX = width/2;
  centerY = height/2;
  
  background(255);
  
}

void draw() {
  
  background(255);

  s=second();
   b = 20;

    
  for(int i=1; i<361; i+=1) {
    t = radians(i);
    ot = radians(i-1);
    d = s*5*t;
    od = s*5*ot;
  
    oxpos = (s*5-b)*cos(ot)+47*cos(od);
    oypos = (s*5-b)*sin(ot)+47*sin(od);    
    
    xpos = (s*5-b)*cos(t)+47*cos(d);
    ypos = (s*5-b)*sin(t)+47*sin(d);
    
    strokeWeight(1);
    stroke(80,204);
    line(centerX+oxpos, centerY+oypos, centerX+xpos, centerY+ypos);
    
  
      
  }
}


void mousePressed()
{
  save("spiro_big_"+b+"_"+m+"_"+s+".png");
  
}

