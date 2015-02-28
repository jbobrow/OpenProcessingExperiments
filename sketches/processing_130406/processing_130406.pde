

float x,y,w,h;

void setup(){
  size(500,500);
  x = 100;
  y = 100;
  w = 80;
  h = 80;

  
}

void draw(){
  
  background(0);
  noStroke();
  for(int a = 0, s = 0;a<4;a++){
    
    for(int i = 0, j=0; i<4;i++){
      
      for(int k=0, l=8;k<5;k++){
        fill(255,0,0);
        ellipse(x+j,y+s,w-l,h-l);
        
        fill(255);
        ellipse(x+j,y+s,w-8-l,h-8-l);
        l+=16;
        
      }
      j+=100; 
    }
    
    s+=100;
  
  }
}


