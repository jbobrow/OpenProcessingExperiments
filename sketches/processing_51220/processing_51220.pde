
int x=1;
int y=1;

void setup() {
size(300,300);
smooth();
frameRate(100);
}

void draw() {
  background(255);
  for (int i=1;i<20;i++){
line(x*i,y,x+100,y*i);
  }
  x+=1;
  y+=1;
  
  if (x>200){
   x=0;
  y=0; 
    
  }
}

                
                                
