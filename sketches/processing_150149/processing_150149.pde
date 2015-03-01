

float m,s,p,a,b,h,xpos,ypos,oxpos,oypos,t,ot,d,od;
int centerX,centerY;

void setup() {
  size(700,700);
  smooth();
 
  centerX = width/2;
  centerY = height/2;
  
  background(255);
  
}
void draw(){
}

void mousePressed() {

  s=second();
  
  a = 17*5;
  b = 20;
  h = mouseY;
  
    
  for(int i=1; i<361; i+=1) {
    t = radians(i);
    ot = radians(i-1);
    d = a*t;
    od = a*ot;
  
    oxpos = (a-b)*cos(ot)+h*cos(od);
    oypos = (a-b)*sin(ot)+h*sin(od);    
    
    xpos = (a-b)*cos(t)+h*cos(d);
    ypos = (a-b)*sin(t)+h*sin(d);
    
    strokeWeight(1);
    stroke(100,204);
    line(centerX+oxpos, centerY+oypos, centerX+xpos, centerY+ypos);
    
  
      
  }
}

void keyPressed() {
  background(255);
}


