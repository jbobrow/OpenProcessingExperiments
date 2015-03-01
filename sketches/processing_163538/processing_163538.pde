
float radius = 300;
float curDeg = 0;
float curDeg2 =0;
void setup()
{
  size(800,500, P3D);
  frameRate(20);
}

void draw(){
  translate(width/2, height/2,-250);
  background(25,200,300);
  curDeg+=1;
// rotateX(radians(curDeg));
 rotateY(radians(curDeg));
// rotateZ(radians(curDeg));
 noFill();
 stroke(255);
 sphere(100);
 
 noFill();
 stroke(200,200,0);
 sphere(200);
 

 
stroke(100,50,0);
  for(float a=0; a<360; a+=3){
  for(float Deg=0; Deg<360; Deg+=3)
  {
    float theta=radians(Deg);
    float pi=radians(a);
    float x= radius *sin(pi)*cos(theta);
    float y= radius *sin(pi)*sin(theta);
    float z= radius *cos(pi);
    point(x,y,z);
  }
  }curDeg2+=4;
  rotateY(radians(curDeg2));
  
  stroke(255);
  ellipse(450,0,30,30);
}
