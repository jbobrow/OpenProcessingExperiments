
boolean c = false;

p p[];  
float globalZ=0;

 
void setup(){  
  size(1280,720);  
  smooth();
  background(255);  
  frameRate(15);
 
  p=new p[2000];  
  for(int i=0; i<p.length; i++)    p[i]=new p(i/1000.0,  800,  800);  
}  
 
void draw(){  
  fill(250,1.99);  
  rect(0,0,width,height);//fade background  
 
  stroke(0);  
  for(int i=0; i<p.length; i++) p[i].update();//render particles  
   
  globalZ+= map(mouseX, 0,width,  0.001,0.03);  
  

}  
 
 
 void mousePressed(){
  println("----------");
  int rnd = round(random(200));
  p[rnd].x=mouseX;
  p[rnd].y=mouseY; 
} 
 
class p {
  float id,x,y,xp,yp,s,d;  
 
  public p(float _id,float _x,float _y) {  
    id=_id; // prima valoare a "adincimi", Z pentru noise
    x=xp=_x;  
    y=yp=_y;  
    s=random(-2,10); //speed
  }

 
 
  void update(){  
 
    id+=map(mouseX, 0,width,  0.001,0.05);  
    d=noise(x/(float)mouseY,y/(float)mouseY,globalZ)  *360;  // globalZ instead of id for continuity
   
    x+=cos(radians(d))*s;  
    y+=sin(radians(d))*s;  
 
    if(x<0) x=xp=width;//offscreen rewind  
    if(x>width)x=xp=0;  
    if(y<0) y=yp=height;  
    if(y>height)y=yp=0;  
 
    line(xp,yp,x,y);  
    xp=x;  
    yp=y;  
  }  
}  

