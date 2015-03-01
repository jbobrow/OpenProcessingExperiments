
int eSize = 20;

  size(400,400);
  background(100);
  smooth();
  
 
  
for(int x = 0; x <= 500; x += 15 ){
  for(int y =0; y <= height; y += 15){
  if(x >= 0 && x < 210 && y > 200 ){
    fill(600-x,500-y,350-x,200);
  } else {
    fill(200-y,500-x,400-x,200);
  }
  if(x >= 200 && y <=200){
      fill(400-y,500-x,300-y,200); 
  }
   else if(x >= 200 && y <= 400){
      fill(350-x,700-x,450-y,200);
  }
  stroke(255-x,255,0,20);
  ellipse(x,y,eSize,eSize);
    println(x);
}
}
for(int i =0; i <=400; i +=15){
  fill(400-i,200-i,300-i,50);
  ellipse(i,200,eSize,eSize);
  ellipse(200,i,eSize,eSize);
}


