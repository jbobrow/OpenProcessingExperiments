
/**
based on code from:
Sumit Pandey
NID, Gandhinagar
http://www.openprocessing.org/visuals/?visualID=6902
*/
 
void setup(){
  size(400,400);
  smooth();
  background(#cccccc);
}
 
float count = 0;
float xNew,yNew;
float a = 13;
float b = 10;
float n = a/b;
 
void draw(){
 
    epicycloid(a,b,width/2,height/2,count,2,2,0.5,count);
    count = count + 0.6;
    if(count > 746){ 
     // save("Epicycliod_2_a="+str(a)+" b="+str(b)+".png");
     noLoop();
    }
}
 
void epicycloid(float a,float b,int translateX,int translateY, float h, float s, float br,float strokeWt, float count){
  float count2 = count;
  pushMatrix();
  translate(translateX,translateY);
  if(count2<=2001){
    
    xNew = (a+b)*cos(radians(count))+b*cos(((a+b)*count));
    yNew = (a+b)*sin(radians(count))-b*sin(((a+b)*count)); 
    
    xNew = xNew * 4;
    yNew = yNew * 4;
    
    stroke(0,0,0);
    strokeWeight(strokeWt);
    ellipse(xNew,yNew,10,10);

  }
  popMatrix();
}
