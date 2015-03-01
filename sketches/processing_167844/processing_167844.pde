
float r;
float rad1=0;

void setup(){
  size(600,600,P3D);
}

void draw(){
  background(255);
  translate(width/2,height/2,0);
  rotateX(radians(mouseY));
  
  for(rad1=0;rad1<1000*PI;rad1+=1){
  float theta=radians(rad1);
  r=100*(sin(1.2*theta)*sin(1.2*theta)+cos(6*theta)*cos(6*theta)*cos(6*theta));
  float p=radians(r/3);
  float x=r*cos(theta);
  float y=r*sin(theta);
  float z=r*cos(p);
  stroke(r/2,r,255-r);
  line(0,0,0,x,y,z);
}
}
