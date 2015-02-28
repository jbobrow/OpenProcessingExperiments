



void setup(){
    size(400,400);
    smooth();
    background(255,0,0);
   
    
}

void draw(){
    int r=0;
    int g=0;
    int bb=0;
  
  for(int a=0; a<=height; a+=50 ){
    
   for(int b=0; b<=height; b+=50 ){
    circleFunction(a,b,r,g,bb);
    r+=5;
    g+=5;
    bb+=5;
    
   }
    
  }

  
}

void circleFunction(int xPos, int yPos,int re,int gr,int bl){
  noStroke();
  fill(re,gr,bl);
  ellipse(xPos,yPos,20,20);

  
}

