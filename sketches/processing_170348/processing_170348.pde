
int eSize=8;

size(400,400);
colorMode(RGB,255);
background(0);

  int diameter,top,left,i;
 
colorMode(RGB,255,100,100,255);
background(0);
noStroke();
fill(255,255,255,75);
 
diameter = 175;
top = 373;
left = 373;
 
for(i=0; i<16; i++){
    rect(top,left,diameter,diameter);
    diameter = diameter - 20;
}


for(int y=-8; y<=400; y+=13){
  for(int x=-8; x<=400; x+=13){
    
    if(x>50 && x<100 && y>50 && y<100){
      fill(255);
    }
  else if(x>125 && x<200 && y>125 && y<200){
    fill(255);
  } 
   else if(x>200 && x<400 && y>200 && y<400){
    fill(255);
  }
  else if(x>50 && x<125 && y>275 && y<350){
  fill(0);
  }
 
 else if(x>140 && x<180 && y>220 && y<255){
  fill(0);
  }
  
  
    ellipse(x,y,eSize,eSize);
   fill(y,0,0);
  }
}


