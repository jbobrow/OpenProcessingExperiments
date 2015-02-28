
/**
Sumit Pandey
NID, Gandhinagar
*/

void setup(){
  size(640,480);
  smooth();
  frameRate(60);
  colorMode(HSB,360,100,100);  
  background(133,0,99);
}

int count = 0;
float xOld,yOld,xNew,yNew;
int a = int(random(80,200));
int b = int(random(15,60));
float n = a/b;
boolean toggle = false;
boolean lines = false;

void draw(){
if(count%360==0){
   a = int(random(80,200));
   b = int(random(15,60));
   n = a/b;
   count = 0; 
   if(toggle){
      background(133,0,99);     
   }  
 }

    epicycloid(a,b,width/2,height/2,count,random(0,100),random(0,100),random(0.5,2),count); 
    hypocycloid(a,b,n,width/2,height/2,count,random(0,100),random(0,100),random(0.5,4),count);
    count++;
 
}  

void keyPressed(){
  background(133,0,99);
  if(toggle==false){
    toggle = true;
  }else{
    toggle = false;  
  }  
}  

void mousePressed(){
  if(lines==true){
    background(133,0,99); 
    lines = false;    
  }else{
    background(133,0,99);     
    lines = true;
  } 
}  

void hypocycloid(int a,int b,float n,float translateX,float translateY, int h, float s, float br,float strokeWt, int count){
  int count2 = count;
  pushMatrix();
  translate(translateX,translateY);
  if(count2<=360){
    xNew = (a/n)*((n-1)*cos(radians(count))-cos((n-1)*count));
    yNew = (a/n)*((n-1)*sin(radians(count))+sin((n-1)*count));   
    stroke(h,s,br);
    strokeWeight(strokeWt);
    //ellipse(xNew,yNew,xOld,yOld);
    if(lines){
      line(xNew,yNew,xOld,yOld);
    }else{    
      ellipse(xNew,yNew,6,6);
    }  
    xOld = xNew;
    yOld = yNew; 
  }
  popMatrix();    
}  

void epicycloid(int a,int b,float translateX,float translateY, int h, float s, float br,float strokeWt, int count){
  int count2 = count;
  pushMatrix();
  translate(translateX,translateY);
  //noStroke();
  if(count2<=360){
    xNew = (a+b)*cos(radians(count))-b*cos(((a+b)/b)*count);
    yNew = (a+b)*sin(radians(count))-b*sin(((a+b)/b)*count);   
    stroke(360-h,100-s,100-br);
    strokeWeight(strokeWt);
    if(lines){
      line(xNew,yNew,xOld,yOld);
    }else{
      ellipse(xNew,yNew,random(1,6),random(1,6));    
    }  
    xOld = xNew;
    yOld = yNew; 
  }
  popMatrix();    
}  

