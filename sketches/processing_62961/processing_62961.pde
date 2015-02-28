
float w=500,m=150,i,j,x,y,r,t;


void setup(){
  size(500,500);
  
 
}

void draw(){
  smooth();
  background(0);
 

  for(i=m;i<w-m;i+=6)
  for(j=m;j<w-m;j+=6){
    r=2E3/(dist(x=mouseX,y=mouseY,i,j)+1E2);
    rect(i+r*cos(t=atan2(j-y,i-x)),j+r*sin(t),7,7);
  
  }
}

