



int ellipseSize = 7;  
int winSize = 400;   
size(400, 400);      
background(180);      
smooth();             
size(400,400);
colorMode(RGB,256);
background(80,130,115);
fill(0);   

 size(400,400);
ellipse(200,200,200,200);

/*
for(int i = 0; i < = winSize; i +=7){
  for(int j = 0; j <= winSize; j += 7){
  ellipse(i, j, ellipseSize, ellipseSize);
  }
}
*/
 
 
for(int i = 0; i <= winSize; i +=7){
  for(int j = 0; j <= winSize; j += 7){
    if(i%2 == 0 || j%2 == 0 ) ellipse(i, j, ellipseSize, ellipseSize);
  }
}

size(400, 400);

/*@pjs preload="test.png";*/

PImage photo2 = loadImage("test.png");

imageMode(CENTER); //
image(photo2, width / 2, height / 2);



