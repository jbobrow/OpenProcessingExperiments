

int eSize = 6;

size(400,400);
background(255);
smooth();

//background_________________

for(int y = 0; y<=height; y++){
  for(int x = 0; x<= width; x++){
    line(x,y,400,400);
    stroke(0,x/3+y/3,255);
    
    line(x,y,400,400);
    strokeWeight(3);
    stroke(0);    
  }
}

//rect_______________________________

for(int y =0; y<=400; y+=10){
  for(int x = 0; x<= 400; x+=10){
 
if(x<400 && y<100){
  noFill();
  stroke(x*2,188,117,255-x-y);
  strokeWeight(3/2);}
  
  else if(y>=90 && x<100){
  noFill();
  stroke(y*2,188,117,255-x-y);
  strokeWeight(3/2);}
  
  else{
    noFill();
    noStroke();}
    
  
  
  rect(x,y,eSize,eSize);

  }
}
//line_______________________________

for(int y =0; y<=height; y+=10){
  for(int x = 0; x<= width; x+=10){
    if(x<width && y<width){
    stroke(225,255,255,100);
    strokeWeight(1/7);
  }
  else if(x>300 && y>300){
    stroke(255,158,0,255);
    strokeWeight(1/3);
  }    
    else if(x>200  && y>200){
    stroke(254,255,0,255);
  strokeWeight(1/3);
}

else if(x>100 && y>100){
  stroke(3,255,0,255);
  strokeWeight(1/3);}
  
else{
  noFill();
  stroke(242,15,255);
  strokeWeight(1/3);
}
  
line(x*3,y*3,100,100);
  }
}

  


  


