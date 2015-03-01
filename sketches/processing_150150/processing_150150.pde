

float m,s,p,a,b,h,g,xpos,ypos,oxpos,oypos,t,ot,d,od;
int centerX,centerY;

void setup() {
  size(700,700);
  smooth();
  colorMode(HSB,360);
 
  centerX = width/2;
  centerY = height/2;
  g=1;
  background(360);
  
}
void draw(){
  

}

void keyPressed() {
      if (keyCode == CONTROL){
     save("spiro_big_"+g+"_"+h+"_"+s+".png");
  }
 

   if (key == CODED) {
    if (keyCode == UP) {
  
g=g+1;
    } else if (keyCode == DOWN) {
      g=g-1;
      
  } else{
    g=1;
  }
    if (keyCode == SHIFT){
    background(360);
   
  }

}
}

  


void mousePressed() {
  
  s=second();
  
  a = g*5;
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
    stroke(s*4,s*3,300);
    line(centerX+oxpos, centerY+oypos, centerX+xpos, centerY+ypos);
    
  
      
  }
      
  }



 


