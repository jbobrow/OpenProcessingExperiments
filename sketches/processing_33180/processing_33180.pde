
size(500,500);
background(124,134,156);
  
int rad = 50;
  
int centerX = round(random(100,width-100));
int centerY = round(random(100,height-100));

line(width/2,0,width/2,height);
line(0,height/2,width,height/2);
  
if(centerX < width/2 && centerY < height/2){
  fill(244,234,256);
  ellipse(centerX,centerY,rad,rad);
   
}else if(centerX > width/2 && centerY > height/2){ 
   fill(90,156,67);
   ellipse(centerX,centerY,rad,rad);
 
}else if(centerX > width/2 && centerY < height/2){ 
   fill(30,90,60);
   ellipse(centerX,centerY,rad,rad);
   
}else{
  background(200);
  fill(11,3,90);
  ellipse(centerX,centerY,rad*2,rad*2);
}
 
  

