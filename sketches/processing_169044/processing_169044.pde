
size(400,400);
background(0);
colorMode(RGB,400);


for(int y=0; y<=400; y+=10){
  for(int x=0; x<=400; x+=10){
stroke(x,x,y);
fill(y,x,y,0);
ellipse(200,200,x,y);
stroke(x,0,30,50);



    
  }
}




