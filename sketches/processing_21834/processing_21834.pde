
PImage layer1;
PImage layer2;
PImage layer3;
PImage layer4;
PImage layer5;
PImage layer6;
PImage layer7;
PImage layer8;
PImage layer9;
int x,y,prevX,prevY,a,c,j,k,prevJ,prevK;
int e,f,g,h,m,n,o,p,q,r,s,t,l,v,prevL,prevV,d,w,prevD,prevW;


void setup(){
  colorMode(HSB,360,100,100);
  size(477,720);
  smooth();
 

 
  layer1=loadImage("layer1.jpg");
  layer2=loadImage("layer2.jpg");
  layer3=loadImage("layer3.jpg");
  layer4=loadImage("layer4.jpg");
  layer5=loadImage("layer5.jpg");
  layer6=loadImage("layer6.jpg");
  layer7=loadImage("layer7.jpg");
  layer8=loadImage("layer8.jpg");
  layer9=loadImage("layer9.jpg");
  prevX=0;
  prevY=0;
  
  
  
  for(int i=0; i<100000; i++){
    o=int( random(width));
    p=int( random(height));
    color cp= layer5.get(o,p);
    float b=brightness(cp);
    if(b == 0){
       noStroke();
       float ellSize =random(7,10);
       fill(57,25,88);      
       ellipse(o,p,ellSize,ellSize);
       float rectSize =random(4,8);
       
       fill(82,27,70); 
       ellipse(o,p,rectSize,rectSize);
    }
  }
  
  
  
  for(int i=0; i<5000; i++){
    q=int( random(width));
    r=int( random(height));
    color cp= layer6.get(q,r);
    float b=brightness(cp);
    if(b == 0){
      float ellSize =random(10,10);
      noStroke();
      fill(89,27,52);     
      rect(q,r,ellSize,ellSize);
    }
  }
  
   

  for(int i=0; i<1000000; i++){
    x=int( random(width));
    y=int( random(height));
    y=int(random(width));
    y= int(random(height));
    color cp= layer1.get(x,y);
    color prevcp = layer1.get(prevX,prevY);
    float b=brightness(cp);
    float prevb= brightness(prevcp);
    if(b == 0 && prevb ==0 && dist(x,y,prevX, prevY) <100){
      stroke(0,0,99);
      line(x,y,prevX, prevY);
    }
     prevX =x;
     prevY =y;
  }
   for(int i=0; i<10000; i++){
    s=int( random(width));
    t=int( random(height));
    color cp= layer7.get(s,t);
    float b=brightness(cp);
    if(b == 0){
      float ellSize =random(10,10);
      noStroke();
      fill(27,43,33);     
      ellipse(s,t,ellSize,ellSize);
    }
  }
  
  for(int e=0; e<100000; e++){
    a=int( random(width));
    c=int( random(height));
    
    color cp= layer2.get(a,c);
    float b=brightness(cp);
    if(b == 0){
      float ellSize =random(5,10);
      noStroke();
      fill(57,38,93);
      rect(a,c,ellSize,ellSize);
    }
  }
   for(int f=0; f<100000; f++){
    j=int( random(width));
    k=int( random(height));
    k=int(random(width));
    k= int(random(height));
    color cp= layer1.get(j,k);
    color prevcp = layer1.get(prevJ,prevK);
    float b=brightness(cp);
    float prevb= brightness(prevcp);
    if(b == 0 && prevb ==0 && dist(j,k,prevJ, prevK) <50){
      stroke(0,0,99);
      line(j,k,prevJ, prevK);
    }
     prevJ =j;
     prevK =k;
  }
  
  for(int i=0; i<1000000; i++){
    x=int( random(width));
    y=int( random(height));
    y=int(random(width));
    y= int(random(height));
    color cp= layer1.get(x,y);
    color prevcp = layer1.get(prevX,prevY);
    float b=brightness(cp);
    float prevb= brightness(prevcp);
    if(b == 0 && prevb ==0 && dist(x,y,prevX, prevY) <100){
      stroke(0,0,99);
      line(x,y,prevX, prevY);
    }
     prevX =x;
     prevY =y;
  }
   for(int i=0; i<10000; i++){
    s=int( random(width));
    t=int( random(height));
    color cp= layer7.get(s,t);
    float b=brightness(cp);
    if(b == 0){
      float ellSize =random(10,10);
      noStroke();
      fill(27,43,33);     
      ellipse(s,t,ellSize,ellSize);
    }
  }
  
  for(int e=0; e<100000; e++){
    a=int( random(width));
    c=int( random(height));
    
    color cp= layer2.get(a,c);
    float b=brightness(cp);
    if(b == 0){
      float ellSize =random(5,10);
      noStroke();
      fill(57,38,93);
      rect(a,c,ellSize,ellSize);
    }
  }
   for(int f=0; f<1000000; f++){
    l=int( random(width));
    v=int( random(height));
    v=int(random(width));
    v= int(random(height));
    color cp= layer1.get(l,v);
    color prevcp = layer8.get(prevL,prevV);
    float b=brightness(cp);
    float prevb= brightness(prevcp);
    if(b == 0 && prevb ==0 && dist(l,v,prevL, prevV) <50){
      stroke(0,0,99);
      line(l,v,prevL, prevV);
    }
     prevL =l;
     prevV =v;
   }
  
   for(int i=0; i<1000000; i++){
    e=int( random(width));
    f=int( random(height));
    color cp= layer2.get(e,f);
    float b=brightness(cp);
    if(b == 0){
      float ellSize =random(5,10);
      noStroke();
      fill(57,54,73);
      ellipse(e,f,ellSize,ellSize);
    }
  }
  for(int i=0; i<10000; i++){
    g=int( random(width));
    h=int( random(height));
    color cp= layer3.get(g,h);
    float b=brightness(cp);
    if(b == 0){
      float ellSize =random(5,10);
      noStroke();
       fill(57,63,34);     
      ellipse(g,h,ellSize,ellSize);
    }
  }
     for(int i=0; i<25000; i++){
    m=int( random(width));
    n=int( random(height));
    color cp= layer4.get(m,n);
    float b=brightness(cp);
    if(b == 0){
      float ellSize =random(4,4);
      noStroke();
       fill(57,25,64);     
      ellipse(m,n,ellSize,ellSize);
    }
  }

   for(int f=0; f<1000000; f++){
    d=int( random(width));
    w=int( random(height));
    w=int(random(width));
    w= int(random(height));
    color cp= layer7.get(d,w);
    color prevcp = layer7.get(prevD,prevW);
    float b=brightness(cp);
    float prevb= brightness(prevcp);
    if(b == 0 && prevb ==0 && dist(d,w,prevD, prevW) <50){
      stroke(0,0,99,60);
      line(d,w,prevD, prevW);
    }
     prevD =d;
     prevW =w;
   }
}


