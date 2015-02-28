
void setup(){
  size(300,300);
 
}

  int x=10;
  int y=80;
  int z=10;
void draw(){
    background(255,z*4,0);
    
    fill(0,225,z*2);
   ellipseMode(CENTER);
   ellipse(x,80,80,80);
  
   line(40+x,80,40+x,y);
   line(30+x,108,30+x,y);
   line(20+x,114,20+x,y);
   line(10+x,118,10+x,y);
   line(x,120,x,y);
   line(x-10,118,x-10,y);
   line(x-20,114,x-20,y);
   line(x-30,108,x-30,y);
   line(x-40,80,x-40,y);
   x++;
   y++;
   z++;
  
}


