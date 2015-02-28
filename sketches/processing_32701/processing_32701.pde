
size(500,500);
background(255,0,100);
smooth();

int x = 50;

float centerX, centerY;
centerX = random(50,width-50);
centerY = random(50,height-50);


//quadrants
line(width/2,0,width/2,height);
line(0,height/2,width,height/2);


//where is the circle?
if(centerX > width/2 && centerY > height/2){
  fill(0,255,0);
  ellipse(centerX, centerY, x, x);
}else{ 
  fill(255);
  ellipse(centerX, centerY, x, x);
}

if(centerX < width/2 && centerY < height/2){
   fill(0,0,255);
   ellipse(centerX, centerY, x, x);
}

if(centerX < width/2 && centerY > height/2){
   fill(255,0,0);
   ellipse(centerX, centerY, x, x);
}







