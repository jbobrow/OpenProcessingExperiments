
int eSize = 30;


size(400,400);
colorMode(RGB,400);
background(400);
noStroke();


for(int x = 0; x <=400; x += 20){
for(int y = 0; y <=400; y += 20){
  if(x == 0 ||  x == 100 || x == 300 || x == 200 || x == 360){
    
 fill(x, 180, y, 200);
 rect(x, y, eSize, eSize);
 
  fill(255, 255, 255, 10);
 rect(400, 200-x, x, 40);
 
 
 fill(92, 252, 141, 5);
triangle(0, 300, 0, 0, 200, 0);
 
 fill(x,255,255,5);
 triangle(400, 100, 200, 400, 400,400);
 
 fill(255, x, 10, 2);
 triangle(100, 0, 400, 0, 400, 200);

fill(0, x, 255, 2);
triangle(0, 200, 0, 400, 300, 400);

  }else{
    fill(400,400,400,10);
    rect(x,y,100,100);
  }




fill(x,255,255,5);
triangle(169,46,109,137,263,109);

fill(92, 252, 141, 5);
triangle(231,354,137,291,291,263);

fill(255, x, 10, 2);
triangle(45,232,109,137,137,291);

fill(0, x, 255, 2);
triangle(355,168,263,109,291,263);



fill(0, x, 255, 2);
triangle(109,137,123,213,183,123);

fill(255, x, 10, 2);
triangle(291,263,218,276,276,185);

fill(92, 252, 141, 5);
triangle(263,109,183,123,277,185);

fill(x,255,255,5);
triangle(137,291,123,213,217,276);




}}

for(int x=0; x<=width; x+=20){
  for(int y=0; y<=height; y+=20){
  if((x > 100 && x <=300) || x == 300){  
    fill(0,0,400,30);
  }
  
  else{
    fill(400,0,0,30);
  }
  
  rect(x,y,eSize,eSize);
  
}}


