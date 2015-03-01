
int eSize= 10;

size(400,400);
colorMode(RGB,400);
background(400);




for(int y =0; y<=400; y+=10){
for(int x=0; x<=400; x+=10){
  
  stroke(y,x,y,0);
  
  fill(28,y,x,255);
  
  rect(x, y, eSize, eSize);
  
  stroke(#F9FF67,100);
  strokeWeight(3);
  line(0 ,height, x, y);

  fill(225);
  ellipse(0,400,200,200);
  
  fill(#FEFF29);
  ellipse(0,400,200,200);
  

  
   } 
}

  fill(#FA5628,160);
  ellipse(200,200,200,200);



  fill(#A0280A);
  ellipse(0,400,150,150);

  noStroke();
  fill(#FFA51C,300);
  ellipse(0,400,100,100);


  noStroke();
  fill(#5A29FF,100);
  ellipse(350,50,100,100);
  
  fill(#C95100);
  ellipse(0,400,50,50);


