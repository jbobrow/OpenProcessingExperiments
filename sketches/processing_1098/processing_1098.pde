
 	

//import processing.video.*;

//MovieMaker mm;  // Declare MovieMaker object



p p[];  
float globalZ=0;
 
void setup(){  
  
  size(800,600);
  background(255);
  smooth();
  
 //  mm = new MovieMaker(this, width, height, "perlin.mov",
 //                       25, MovieMaker.ANIMATION, MovieMaker.HIGH);

    
  frameRate(15);
 
  p=new p[2000];  
  for(int i=0; i<p.length; i++)    p[i]=new p(i/5000.0,  500,  500);  
 }  
 
 
 
void draw(){  
 
  stroke(2);
 
  stroke(random(200,255),random(200,255),random(100,255));  
  for(int i=0; i<p.length; i++) p[i].update();//render particles  
   
  globalZ+= map(mouseX, 0,width,0.001,0.03);  
  
 // mm.addFrame();  // Add window's pixels to movie
}  


 
void mouseDragged(){
  println("----------");
  int rnd = round(random(200));
  p[rnd].x=pmouseX;
  p[rnd].y=pmouseY;
 
}
 
 
 
 
class p {
  float id,x,y,xp,yp,s,d;  
 
  public p(float _id,float _x,float _y) {  
    id=_id; // prima valoare a "adincimi", Z pentru noise
    x=xp=_x;  
    y=yp=_y;  
    s=noise(20); //speed
  }  
 
 
  void update(){  
 
    id+=map(mouseX, 0,width,0.1,0.05);  
    d=noise(x/(float)mouseY,y/(float)mouseY,globalZ)*300;  // globalZ instead of id for continuity
   
    x+=cos(radians(d))*s*2;  
    y+=sin(radians(d))*s*3;  
 
    if(x<0) x=xp=width;//offscreen rewind  
    if(x>width)x=xp=0;  
    if(y<0) y=yp=height;  
    if(y>height)y=yp=0;  
 
    line(xp,yp,x,y);  
    xp=x;  
    yp=y;  
    globalZ=abs (pmouseX-mouseX);
  }  
}


