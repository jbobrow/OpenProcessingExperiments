
size(500,500);
background(255,0,127);

int rad = 50;

float centerX, centerY;
centerX = random(50,width -50);
centerY = random(50,height -50);


//fill(255);
//ellipse(centerX,centerY,rad,rad);
//println(centerX + " " + width);

//quadrants
line(width/2,0,width/2,height);
line(0, height/2,width,height/2);

//if the ball is on the right side
//of the screen & the bottom,
//change to green

//where is the circle?
if(centerX>width/2 && centerY> height/2){
  fill(0,255,100);
  ellipse(centerX, centerY, rad, rad);
}else if(centerX>width/-2 && centerY>height/-2){
  fill(0,155,0);
  ellipse(centerX, centerY, rad, rad);
}else if(centerX>width/2 && centerY<height/2){ 
  fill(0,0,255,100);
  ellipse(centerX, centerY, rad, rad);
}else{
  fill(255);
  ellipse(centerX, centerY, rad,rad);
}


