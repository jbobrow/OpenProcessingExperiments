

  
void setup(){
  size(600,400);
  noLoop();
  
  background(0);
}

int rint(int low, int high){
  return int(random(low,high));
}

void draw(){
  if(rint(0,10) > 7){
  pushStyle();
  fill(0,0,0,50);
  rect(0,0,width,height);
  popStyle();
  }
  else{
   background(0); 
  }
  int numPiles = rint(1,6);
  CirclePile[] cp = new CirclePile[numPiles];
  for(int i = 0; i< numPiles; i++){
   cp[i] = new CirclePile(); 
  }
  while(cp[0].levels > 0){
    for(int i = 0; i< numPiles; i++){
     cp[i].drawSelf(); 
    }
  }
  int numLines = rint(1,10);
  for (int i = 0; i <numLines; i++){
    pushStyle();
    noStroke();
    fill(rint(0,255),rint(0,255),rint(0,255),rint(0,60));
    int h = rint(0,20);
    int y = rint(0,height);
    rect(0,y,width,y+h);
    popStyle();
  }
  int filtermode = rint(10,20);
  switch(filtermode){
   case BLUR: 
   case POSTERIZE:
   filter(filtermode,rint(0,15));
   break;
   case THRESHOLD:
     filter(filtermode,random(0,1));
     break;
   case INVERT:
   case GRAY:
   case OPAQUE:
   case DILATE:
   case ERODE:
   filter(filtermode);
   break;
  }
  
  
  
  
}

void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}

class CirclePile{
  int x;
  int y;
  int variance;
  int levels = 20;
  int radius = 20;
  int r= 139;
  int g = 32;
  int b= 32;
  int a = 30;
  
  CirclePile(){
   x = rint(0,width); 
   y = rint(0,height);
   r = rint(0,155);
   g = rint(0,155);
   b = rint(0,155);
   levels = rint(4,25);

   variance=rint(4,20);
  }
  
  CirclePile(int rin,int gin, int bin){
   r = rin;
   g = gin;
   b = bin; 
  }
//  circlePile(int sx, int sy){
//    x=sx;
//    y=sy;
//    variance = 8;
//    
//  }
  
  void drawSelf(){
    if (levels==0){
     return; 
    }
    pushStyle();
    fill(vary(r),vary(g),vary(b),vary(a));
    noStroke();
    ellipse(vary(x),vary(y),levels * radius,levels * radius);
    popStyle();
    
    levels--;
  }
  
  int vary(int item){
   return item + rint(-1* variance, 1 * variance) ;
  }
  
  
}



