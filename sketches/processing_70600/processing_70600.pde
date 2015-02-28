
size(400,400);
smooth();
strokeWeight(3);
background(12, 60, 100);
smooth();

for(int x=0; x<=400;x+=20){
  for(int y=0;y<=400;y+=20){
    if((x+y)%15==0){
      stroke(255, 0, 0);
    }else{
      stroke(0, 255,0);
    }
      point(x, y);
  }  
}

//lines
for(int x=0; x<=400; x+=50){
  for(int y=0; y<=400; y+=60){
    if((x)%5==0){
noStroke();
ellipse(x,y,10,10);
}
}
}

