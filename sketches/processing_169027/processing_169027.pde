
int eSize = 55;

size(400,400);
colorMode(RGB,400);
background(400);
noStroke();

for(int y = 0; y <=400; y +=20){
for(int x=0; x<=400; x+=30){
 
 stroke(x,0,y,10);
 strokeWeight(5);
 line(0,0,400,y) ;
  
  stroke(x,0,y,10);
 strokeWeight(5);
 line(400,0,0,y) ;
  
  stroke(x,0,y,10);
 strokeWeight(5);
 line(0,400,400,y) ;
  
  stroke(x,0,y,10);
 strokeWeight(5);
 line(400,400,0,y) ;
   
   stroke(x,0,y,10);
 strokeWeight(5);
 line(200,0,0,200+y) ;
  
  stroke(x,0,y,10);
 strokeWeight(5);
 line(200,0,400,200+y) ;
 
  stroke(x,0,y,10);
 strokeWeight(5);
 line(200,400,0,200-y) ;
  
  stroke(x,0,y,10);
 strokeWeight(5);
 line(200,400,400,200-y) ;
  
  stroke(x,0,y,10);
 strokeWeight(5);
 line(0,200,400,y) ;
  
  stroke(x,0,y,10);
 strokeWeight(5);
 line(400,200,0,y) ;
  
  rectMode(CENTER);
 noFill();
 stroke(148,10,176,2);
  rect(200,200,200,200);
  rect(200,200,300,300);
  rect(200,200,400,400); 
  rect(200,200,100,100);
  ellipse(200,200,100,100);
  ellipse(200,200,200,200);
  ellipse(200,200,300,300);
  ellipse(200,200,400,400);
}}


