
float r =20;
float a =0;
void setup(){
  background(255);
  size(500,500);
}
void draw(){
  if (mousePressed==true){
    background(255);
    r=20;
    a=0;
  }
float x=r*cos(a);
float y=r*sin(a);
stroke(random(255),random(255),random(255),30);
line(random(width/2-30,width/2+30),random(height/2-30,height/2+30),width/2+x,height/2+y);
a+=0.1;
r+=0.3;

}


