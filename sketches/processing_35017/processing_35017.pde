
DrawStar[] Ds = new DrawStar[150];

float[] x = new float[150];
float[] y = new float[x.length];
float[] sizes = new float[x.length];
float[] speedx = new float[x.length];
float[] speedy = new float[x.length];
int[] h = new int[x.length];
int[] s = new int[x.length];
int[] v = new int[x.length];
int[] ran = new int[x.length];
float[] rad = new float[x.length];
float speed = 1;
int ex = 400;
int ey = 0;
float e = 1;
void setup(){
  colorMode(HSB);
  size(800,600);
  background(0);
  smooth();
  
   for(int i = 0;i<x.length;i++){
     
     x[i] = random(-800,0);
     y[i] = random(600);
     sizes[i] = random(0.5,2);
     speedx[i] = random(15,20);
     speedy[i] = random(5,10);
     rad[i] = 0;
     ran[i] = int(random(30));
     
     h[i] = 40 -int(random(10))+int(x[i]/100*random(2));
     s[i] = 255;
     v[i] = int(random(2))*255;
    
     Ds[i] = new DrawStar(x[i],y[i],sizes[i],rad[i],speedx[i],speedy[i]);
     
   }
  
}

void draw(){
  
  
  fill(0,255-ey/2+e);
  rect(0,0,width,height);
  noStroke();
  for(int i = 0;i<x.length;i++){
        
    Ds[i].update();
    colorMode(HSB);
    if(ran[i] ==1) fill(200, s[i], v[i],180);
    if(ran[i] != 1)fill(h[i], s[i],v[i],140);
    
    
    Ds[i].disp();



    
  }
     noStroke();
     colorMode(RGB);
     fill(255,230-ey/2,150-ey/2,120);
     ellipse(ex,ey,70,70);
     
     ey = ey + int(speed);
     
     if(ey >= 600){
      fill(0,1200-ey); 
     ellipse(400,600,e,e);
     e = e+e/10;
     }
  
  }
  
    void trans(float x,float y,float s,float rad){

    pushMatrix();    
    translate(x,y);
    rotate(radians(rad));
    star(0,0,s);
    popMatrix();
  
  }
  
  
  void star(float x,float y,float sizes){
    

    beginShape();
    vertex(0,0-20*sizes);
    vertex(0 - 12*sizes, 0 + 15*sizes);
    vertex(0 + 18*sizes, 0 -  8*sizes);
    vertex(0 - 18*sizes, 0 -  8*sizes);
    vertex(0 + 12*sizes, 0 + 15*sizes);
  endShape(CLOSE);
  
  }
  


class DrawStar{
  
  float x;
  float y;
  float sizes;
  float rad;
  float speedx;
  float speedy;

 DrawStar(float _x, float _y,float _sizes,float _rad,float _speedx,float _speedy) {
   
   x = _x;
   y = _y;
   sizes = _sizes;
   rad = _rad;
   speedx = _speedx;
   speedy = _speedy;
   rad = _rad;
   
 }
 
 void disp(){
   


   trans(x,y,sizes,rad);
  
 }
 
 void update(){
   
   
   

    rad = rad + random(10);
    x = x + speedx;
    y = y + speedy;
    
     if(x > width){
     x = 0;
   y = random(height/2);
 }
    if(y > height){
    x = 0;
  y = random(height/2,height);
}
   
 }
 
}


