
 
int w = 30; 
int h = 30; 
float t = 0; 

void setup(){ 
  size(1000,500); 
  background(255); 
  smooth();  
 
} 
 
void draw(){ 
 
 int fill1 = int( random(255) );
    int fill2 = int( random(255) );
    int fill3 = int( random(255) );
  fill(fill1,fill2,fill3); 

  for(int x = 0; x<=width; x+=w/2) 
    for(int y = 0; y<=height; y+=h) 
  
          triangle(x,y,x-w/2,y+h,x+w/2,y+h); 

  for(int x = -w/2; x<=width; x+=w) 
    for(int y = h; y<=height; y+=h*5) 
      if(mouseX > x-w/2 && mouseX <= x+w/2) 
        if(mouseY >= y && mouseY <= y+h) 
          triangle(x,y,x-w/2,y+h,x+w/2,y+h); 
 
  for(int x = 0; x<=width; x+=w) 
    for(int y = 0; y<=height; y+=h*2) 
      if(mouseX > x && mouseX <= x+w) 
        if(mouseY >= y && mouseY <= y+h) 
          triangle(x,y,x+w,y,x+w/2,y+h); 
 
  for(int x = -w/2; x<=width; x+=w) 
    for(int y = h; y<=height; y+=h*2) 
      if(mouseX > x && mouseX <= x+w) 
        if(mouseY >= y && mouseY <= y+h) 
          triangle(x,y,x+w,y,x+w/2,y+h); 
 
} 
 


