
float phi=(sqrt(5)-1)/2;
float rot;
void setup(){
  size(399,399);
  translate(width/2,height/2);
  //noStroke();ç
  stroke(299);
  background(19);
}


float px,py,i=0,r=1,rgrowth=1.004,rotgrowth=0,p=20,rmax,addp=10,alpha;

void draw(){
 
  
  r=1;
  rot=1;
  p++;
  rmax = sqrt(p);
  translate(width/2,height/2);
  alpha = p%255;
  print(alpha);
  for(i=0;i<p;i++){
    
    pushMatrix();
      rot=phi*i *2.0*PI;
      r=sqrt(i)*(90/rmax)*1.9;
      px = cos(rot)*r;
      py = sin(rot)*r;
      fill(px+alpha,py+alpha,r+alpha);
      ellipse(px,py,1,1); 
      
      popMatrix();
  }
 
}
