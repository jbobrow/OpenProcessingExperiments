
int x ;
int y ;
int dirX ;
int dirY ;

void setup () {
  size (500,500) ;
  smooth () ;
  background (50,60,130) ;
  x = 10 ;
  y = 10 ;
  dirX=1;
  dirY=1 ;
  
}

void draw () {
   x +=dirX ;
  y +=dirY ;
  ellipse (x,y,30,30) ;
  ellipse (80,90,10,10) ;
  ellipse (500,500,10,10 );
  ellipse (300,300,10,10) ;
  ellipse (400,400,10,10) ;
  ellipse (350,350,6,6) ;
  ellipse (430,300, 4,4) ;
  ellipse (500,60,8,8 );
  ellipse (300,400, 3,3) ;
  ellipse (360,360,7,7) ;
  triangle (60,35,37,58,69,69) ;
  


 
  if(y>500){
    dirY = -1;
    fill (6,8,12);
  }
   
  if(x>500){
    dirX = -1;
    fill (24,26,58);
  }
  if(y<0){
    dirY = 2;
    fill (68,7,120);
  }
  if(y<0){
    dirY = 1;
    fill (45,140,25);
  }
  if(x<0){
    dirX = 2;
    fill (50,70,130);
  }
}
                                
