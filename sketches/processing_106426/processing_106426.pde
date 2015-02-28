
lnt x=20;
lnt y=20;

lnt dx=0;
lnt dy=3;



void setup() {  //setup function called initially,only once
    size(300,400);
}



void draw()  {  //draw function loops
    
    background(0,0,0);
    fill(255,255,0);
    ellipse(x,y,30,30);
     
   if(y>400)  {
     dy=-dy;
  }
   if(y<2)  {
     dy=-dy;
  }
    y=y+dy;
 
 


   if(x>400)  {
     dx=-dx;
  }
   if(x<2)  {
     dx=-dx;
  }
    x=x+dx;
    
   if(mousePressed)  {
   
      x=mouseX;
      y=mouseY;
}  

}
