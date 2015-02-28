
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
int a = int(random(1,100));
int b = int(random(15,70));
boolean toggle = false;

void draw(){
if(count%360==0){
   a = int(random(1,100));
   b = int(random(15,70));
   count = 0; 
   if(toggle){
      background(133,0,99);     
   }  
 }
    epicycloid(a,b,width/2,height/2,count,random(0,100),random(0,100),random(0.5,4),count);
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

void epicycloid(int a,int b,float translateX,float translateY, int h, float s, float br,float strokeWt, int count){
  int count2 = count;
  pushMatrix();
  translate(translateX,translateY);
  if(count2<=360){
    xNew = (a+b)*cos(radians(count))-b*cos(((a+b)/b)*count);
    yNew = (a+b)*sin(radians(count))-b*sin(((a+b)/b)*count);   
    stroke(h,s,br);
    strokeWeight(strokeWt);
    line(xNew,yNew,xOld,yOld);
    xOld = xNew;
    yOld = yNew; 
  }
  popMatrix();    
}  



