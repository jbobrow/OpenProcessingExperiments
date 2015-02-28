
if(5>3){
   fill(255,0,0);
  ellipse(width/2,height/2, 100, 100);
}

size(500,500);
background(255,0,127);

int rad = 50;

//quadrant
line(width/2,0,width/2,height);
line(0,height/2,width,height/2);

float centerX, centerY;
centerX = random(0,100);
centerY =random(0,100);

fill(255);
ellipse (centerX, centerY, rad, rad);

//where is the circle?
if(centerX > width/2){
  fill(0,255,0);
  ellipse (centerX, centerY, rad, rad);
}else if(centerX < width/2){
  fill(0,0,255);
  ellipse (centerX, centerY, rad, rad);

}else{
  fill(255);
   ellipse (centerX, centerY, rad, rad);
} 

if(centerX < width/2 && centerY < height/2){
   fill(0,134,0);
   ellipse(centerX, centerY, rad, rad);
}
 
if(centerX < width/2 && centerY > height/2){
   fill(3,77,0);
   ellipse(centerX, centerY, rad, rad);
}


