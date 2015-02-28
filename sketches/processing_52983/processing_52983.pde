
int t=0;
 
float r1=random(0,1.57);
float r2=random(0,1.57);
 
float s1=random(0.05,0.07);
float s2=random(0.05, 0.07);
 
float t1=random(0.0009,0.0011);
float t2=random(0.0009,0.0011);
 
void setup(){
  size(700,700);
  background(250,250,250);
smooth();
}
   
void draw(){
  ++t;
    fill(0,5);
    noStroke();
if((t % 50)==0) {
  rect(0,0,width,height);}
     
    float red=100+70*sin(t*0.012+r1);
    float green=100+60*sin(t*0.013+r2);
    float blue=100+60*sin(t*0.014);
    stroke(red,green,blue,90);
    noFill();
    float rad1 = width/2*sin(t*t1);
    float x1=width/2+rad1*cos(t*s1);
    float y1=height/2+rad1*sin(t*s1);
    float rad2 = width/2*sin(t*t2);
    float x2=width/2+rad2*cos(t*s2);
    float y2=width/2+rad2*sin(t*s2);
    float litrad=10+220*sin(t*0.002);
    //ellipse(x,y,litrad,litrad);
    line(x1,y1,x2,y2);
    line(width-x1,y1,width-x2,y2);
    line(x1,height-y1,x2,height-y2);
    line(width-x1,height-y1,width-x2,height-y2);
   
}          
