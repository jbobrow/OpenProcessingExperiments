
int i = 0;

size(510,510);
background(255);
stroke(0);

for( int x=0;x<=width;x++){
  
  
  stroke(100,x,255,10);
  line(0,0,x,height);
  
  stroke(100,x,255,20);
  line(0,100,x,height);
  
  stroke(100,x,255,30);
  line(0,200,x,height);
  
  stroke(100,x,255,40);
  line(0,300,x,height);
  
  stroke(100,x,255,50);
  line(0,400,x,height);
  
  stroke(100,x,255,60);
  line(0,500,x,height);
  
  
  
  
  
  stroke(x,0,0,10);
  line(width,0,x,height);
  
    stroke(x,0,0,20);
  line(width,100,x,height);
  
   stroke(x,0,0,30);
  line(width,200,x,height);
  
  stroke(x,0,0,40);
  line(width,300,x,height);
  
  stroke(x,0,0,50);
  line(width,400,x,height);
  
    stroke(x,0,0,60);
  line(width,500,x,height);
  


}

  
stroke(150);
strokeWeight(100);
ellipse(255, 100, 100, 100 );



