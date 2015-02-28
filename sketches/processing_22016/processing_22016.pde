
int x=0;
int speedx=1;
int y=0;
int speedy=3;
int radius;
int transition=50;

void setup()
  
  {
    size(500,750);
    smooth();
  }
 
void draw()

  {
 
    fill(0,0,0,transition);
    noStroke();
    rect(0,0,width,height);
    noFill();
    x=x+speedx;
    y=y+speedy;
    radius+=1;
    transition-=1;
    stroke(240,radius/2,radius/4);
    bezier(0,0,x,y,x,y,width,0);
    bezier(0,height,x,y,x,y,width,height);
    bezier(0,height/2,x,y,x,y,width,height/2);
    bezier(width/2,0,x,y,x,y,width/2,height);
    bezier(0,height,x,y,x,y,0,0);
    bezier(width,0,x,y,x,y,width,height);
    radius=constrain(radius,200,254);
    transition=constrain(transition,10,49);
   
    if((x>width) || (x<0))
   
   {
 
     speedx=speedx*-1;
    
   }
 
    if((y>height)|| (y<0)){
 
    speedy=speedy*-1;
  }
  
}

                
                
