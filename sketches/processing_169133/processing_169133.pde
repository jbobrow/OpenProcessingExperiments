
int eSize=26;
size(400, 400);
colorMode(HSB, 100,60,100);
noStroke();
 


for(int y = 0; y < 10; y++){
  for(int x = 0; x < 10 ; x++){
    fill(10*x, 5+y*5, 100);
   rect(x*50, y*50, 50, 50);
  }
}
 for (int i = 0; i < width; i++) {
  if (i%4 >=2) stroke(2,0);
  else stroke(50,50,100);
  line(width,i ,0, i);
}



stroke(#00FF00);
noFill();
  
int drawPointX = 0;
  
while( drawPointX <= 400 ) {
  ellipse( drawPointX, 0, 40, 40 );
  ellipse( drawPointX, 50, 40, 40 );
  ellipse( drawPointX, 100, 40, 40 );
  ellipse( drawPointX, 150, 40, 40 );
  ellipse( drawPointX, 200, 40, 40 );
  ellipse( drawPointX, 250, 40, 40 );
  ellipse( drawPointX, 300, 40, 40 );
  ellipse( drawPointX, 350, 40, 40 );
  ellipse( drawPointX, 400, 40, 40 );
  drawPointX = drawPointX + 20;
}
noStroke();
for(int y=0; y<=height; y+=30){
  for(int x=0; x<=width; x+=30){
    if(x>50&&x<100){
      fill(255);
    }
    
    else{
      fill(0);
    }
    rect(x,y,eSize,eSize);
    
  }
}
    


