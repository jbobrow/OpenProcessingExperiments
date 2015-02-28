





p p[];  
float globalZ=0;
 
void setup(){  
  
  size(1280,720, P2D);
  background(0);
  smooth();
  frameRate(20);

 
  p=new p[2000];  
  for(int i=0; i<p.length; i++)    p[i]=new p(i/5000.0,  500,  500);  
 }  
 
 
 
void draw(){  

  stroke(random(200,255),random(150));
  tint(#ffff00, 35);
  

  // alter code 

  for(int i=0; i<p.length; i++) p[i].update();//render particles  
  globalZ+= map(mouseX, 0,width,0.001,0.0003);
   
  
  //for(int i = 0; i < player.left.size()-1; i++)
  
  
  // perform a forward FFT on the samples in jingle's mix buffer
  // note that if jingle were a MONO file, this would be the same as using jingle.left or jingle.right
  
 // int w = int(fft.specSize()/128);
 //   for(int i = 0; i < fft.avgSize(); i++)


}
 
void mouseDragged(){
  println("----------");
  int rnd = round(random(1000));
  p[rnd].x=pmouseX;
  p[rnd].y=pmouseY;
 
}
 
 
class p {
  float id,x,y,xp,yp,s,d;  
 
  public p(float _id,float _x,float _y) {  
    id=_id; // prima valoare a "adincimi", Z pentru noise
    x=xp=_x;  
    y=yp=_y;  
    s=noise(100); //speed
  }  
 
 
  void update(){  
 
    id+=map(mouseX, 0,width,0.1,0.05);  
    d=noise(x/(float)mouseY,y/(float)mouseY,globalZ)*360;  // globalZ instead of id for continuity
   
    x+=cos(radians(d))*s*2;  
    y+=sin(radians(d))*s*3;  
 
    if(x<0) x=xp=width;//offscreen rewind  
    if(x>width)x=xp=0;  
    if(y<0) y=yp=height;  
    if(y>height)y=yp=0;  
 
    line(xp,yp,x,y);  
    xp=x;  
    yp=y;  
    
  }  
 }







