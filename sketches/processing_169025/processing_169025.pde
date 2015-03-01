
int eSize =30;

size(400,400);
colorMode(RGB,400);
background(0,0,255);
//noStroke();

for(int y=0;y<=400; y+=10){

for(int x=0;x<=400;x+=10){
  fill(x,200,400,50);
  rect(x,y,eSize,eSize);
  stroke(40,40,90,50);
  strokeWeight(5);
  
  
 fill(x,100,100,5);

 triangle(200,200,0,0,400,0);
 
 triangle(200,200,0,400,400,400);
  
 rectMode(CENTER);
 
 fill(y,x,10,0);

rect(200,200,100,100);

rect(200,200,300,300);
 
rect(200,200,400,400);
 
 

}
}


