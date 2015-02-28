
// jingjin1@andrew.cmu.edu
//copyright 2013


int radius=40;
float x=radius;
float speed = 1.5;
int dirc = 1;

void setup(){
 size(340,120);
 smooth();
 ellipseMode(RADIUS);
 rectMode(CENTER); 
}

void draw(){
  background(0);
  x+=speed*dirc;
  if ((x>width+radius)||(x<-radius))
  {dirc=-dirc;}
    if (dirc==1){
      fill(255,0,0);
      
       for(int j=10;j<=width;j+=25)
       {fill(0,0,255);
        noStroke();
        ellipse(j,0.5*height,8,8);
        fill(0);
        rect(-radius,0.5*height,2*x,radius);
       }
       
    fill(255,0,0);
    arc(x,0.5*height,radius,radius,0.52,5.8);
     }
  else{
       for(int j=10;j<=width;j+=25)
       {fill(0,0,255);
        noStroke();
        ellipse(j,0.5*height,8,8);
        fill(0);
        rect(-radius,0.5*height,-2*(x+radius),radius);
       }
    
    fill(0,255,0);
    arc(x,60,radius,radius,3.62,8.9); 
}
}



