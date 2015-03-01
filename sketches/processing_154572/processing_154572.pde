
 
int dim = 720; 
int numHairs = 100;  
float diameter = dim/10;
Hair[] hairs = new Hair[numHairs];
Mousecircle mouse;
 
void setup() {
  size(dim,dim);
  background(0); 
  stroke(255);   
  for (int i=0; i<numHairs; i++){hairs[i] = new Hair(hairs, diameter);}  
  mouse = new Mousecircle(diameter, hairs, numHairs);
}
 
  void draw(){     
    background(0); 
    for(int i=0; i<numHairs;i++){hairs[i].display(diameter);} 
    mouse.display(diameter, hairs, numHairs);  
  }
 
class Mousecircle{
  float diameter;
  Hair[] others;
  float charge;  
  int numHairs;
  int i;
   
  Mousecircle(float diameter, Hair[] oin, int numHairs){
  }
 
  void display(float diameter, Hair[] oin, int numHairs){
 
    fill(0,0,0,100); noStroke();
    ellipse(mouseX,mouseY,diameter,diameter);
  }
 
}
 
class Hair{
   
  float x1, y1; 
  float x2, y2; 
  float xm, ym; 
  float x2d, y2d; 
  float xmd, ymd; 
  float l,l1,l2; 
  float g;       
  float damp;   
  float spring; 
  float attract; 
  int id;
  float diameter; 
  float mousedist, mouseforcex, mouseforcey; 
  Hair[] others;
   
  Hair(Hair[] oin, float diameter){
    x1 = dim/2;    y1 = dim/2;  
    l = dim/2*0.45; 
    g=-0.03;  
    damp=0.01; 
    spring=1.5; 
    attract=600;
    x2=random((dim-2*l)/2,dim-(dim-2*l)/2); 
    y2=random((dim-2*l)/2,dim-(dim-2*l)/2); 
    xm=x1+(x2-x1)/2+0.1*abs(x1-x2)*(random(100)-50)/100; 
    ym=y1+(y2-y1)/2+0.1*abs(y1-y2)*(random(100)-50)/100; 
    xmd=0; ymd=0; x2d=0; y2d=0; 
    others = oin;
  }
   
  void display(float diameter){
   
    if(xmd>0){xmd-=abs(xmd)*damp;}else if(xmd<0){xmd+=abs(xmd)*damp;}
    if(ymd>0){ymd-=abs(ymd)*damp;}else if(ymd<0){ymd+=abs(ymd)*damp;}
    if(x2d>0){x2d-=abs(x2d)*damp;}else if(x2d<0){xmd+=abs(x2d)*damp;}
    if(y2d>0){y2d-=abs(y2d)*damp;}else if(y2d<0){ymd+=abs(y2d)*damp;}
     
    l1=sqrt((xm-x1)*(xm-x1)+(ym-y1)*(ym-y1)); 
    l2=sqrt((xm-x2)*(xm-x2)+(ym-y2)*(ym-y2)); 
 
    xmd=xmd+spring*(l1-l/2)/l/2*cos(atan2(y1-ym,x1-xm))+spring*(l2-l/2)/l/2*cos(atan2(y2-ym,x2-xm));  
    ymd=ymd+spring*(l1-l/2)/l/2*sin(atan2(y1-ym,x1-xm))+spring*(l2-l/2)/l/2*sin(atan2(y2-ym,x2-xm))-g;  
 
    if(xmd<0.02){xmd+=random(-0.05,0.05);} if(ymd<0.02){ymd+=random(-0.05,0.05);}
 
    mousedist=sqrt((mouseX-x2)*(mouseX-x2)+(mouseY-y2)*(mouseY-y2));
    if(mousedist>diameter/2){
    mouseforcex=attract/mousedist/mousedist*cos(atan2(mouseY-y2,mouseX-x2));
    mouseforcey=attract/mousedist/mousedist*sin(atan2(mouseY-y2,mouseX-x2));
    } else if((mousedist<diameter/2)&&(mousedist>diameter*45/100)){
    mouseforcex=0; mouseforcey=0; x2d=0; y2d=0; xmd+=random(-0.03,0.03); ymd+=random(-0.03,0.03);
    } else if(mousedist<diameter*45/100){
    x2d=x2d*9/10; y2d=y2d*9/10;
    mouseforcex=-attract/(diameter*45/100)/(diameter*45/100)*cos(atan2(mouseY-y2,mouseX-x2));
    mouseforcey=-attract/(diameter*45/100)/(diameter*45/100)*sin(atan2(mouseY-y2,mouseX-x2));
    }
 
    x2d=x2d+spring*(l2-l/2)/l/2*cos(atan2(ym-y2,xm-x2))+mouseforcex;   
    y2d=y2d+spring*(l2-l/2)/l/2*sin(atan2(ym-y2,xm-x2))-g+mouseforcey;  
    xm += xmd; ym += ymd; 
    x2 += x2d; y2 += y2d;  
 
    noFill(); stroke(255);
     beginShape();
        curveVertex(x1, y1);
        curveVertex(x1, y1); 
        curveVertex(xm, ym);
        curveVertex(x2, y2); 
        curveVertex(x2, y2);
      endShape();
  }
 
}
