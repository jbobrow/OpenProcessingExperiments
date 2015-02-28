
float a=PI;
float floor=385;
float inc =0;
int bar=1;
int spaceb=1;

void setup(){
  size(400,400);
}
void draw(){
  if(spaceb==0)bar=spaceb;
  float expmap=map((exp(norm(mouseY,0,height))),1,2.718,35,height);
  //^35=lower bounce speed bound
  inc = ((((expmap)/height)/3.3)*bar);
  a = (a-inc)%PI;
  float ball = (floor-(mouseY-15))*sin(a)+floor;
  if ((dist(mouseX,ball,mouseX,mouseY))<=10&&(mousePressed==true))bar=0;
  if (mousePressed==false)bar=1;
  background(200);
  ellipse(mouseX,ball,30,30);
  println("mouseY="+mouseY+" inc="+inc+" ball="+ball);
    }
  
void keyPressed(){if (key==' ') {spaceb=abs(spaceb-1);} } 

 



