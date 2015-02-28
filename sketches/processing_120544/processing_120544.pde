
int eSize = 10;

size(400,565);
background(0);
smooth();

for(int y=0; y<=height; y+=20){
  for(int x=0; x<=width; x+=20){
    
  stroke(x,255,255,127);
  line(510,0,x,height);

  stroke(255,255,X,127);

    line(x,0,0,height);
  line(0,0,width,x);
  
  noStroke();    
ellipse(250, 250, 150, 150);

fill(0,124,255);
strokeWeight(3); 
ellipse(100, 100, 100, 100);

fill(230,10,0);
rectMode(CENTER); 
rect(100, 480, 160, 160); 
 
   if(x > 100 &&  x <300 && y > 100 && y <300){
  fill(225);
 }else{
   fill(255);
 }
   ellipse(x,y,eSize,eSize);
  }

}


