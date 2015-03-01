
int eSize = 55;

size(400,400);
colorMode(RGB,400);
background(400);
noStroke();

for(int y = 0; y <=400; y +=20){
for(int x=0; x<=400; x+=30){
  noStroke();
  fill(100,x,150,300);
  
  rectMode(CENTER);
  rect(x,y,eSize,eSize);
  
  fill(x,100,y,20);
  ellipse(200,400-x,x,90);
  
  fill(x,100,y,5);
  triangle(400,0,200,400,400,400);
  
  fill(180,200+x,151,5);
  triangle(0,0,200,400,0,400);
  
  
  
}
}


