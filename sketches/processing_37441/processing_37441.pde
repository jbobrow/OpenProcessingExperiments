


size(800,800);
//creates vertical lines from random array of points
for(int x=0; x<=width; x+=random(3)){
  for (int y=0; y<=height; y+=random(3)){
    point(x,y);}}
 
//creates horizontal lines from random points
for(int x=0; x<=width; x+=random(3)){
  for(int y=0; y<=height; y+=(10)){
    point(x,y);
  }}

//creates white grid 
for(int x=0; x<=width; x+=50){
  for(int y=0; y<=height; y+=50){
    stroke(255);
    line(x,x,x,y);
    line(x,y,y,y);
  }}
  
  //creates yellow rectangles 
  for(int x=0; x<=width; x+=random(100,450)){
    for(int y=0; y<=400; y+=random(100,450)){
     fill(200,200,20,150);
     rectMode(CENTER);
    rect(x,y,x,y);
    noStroke();
    }} 

      
   


