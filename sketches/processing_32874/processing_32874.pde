
size (500,500);
smooth();

int rad = 50;

int centerX, centerY;
centerX = round(random(0, 400));
centerY = round(random(0, 400));

//quadrants
line(width/2, 0, width/2, height);
line(0,height/2, width, height/2);

//if the ball is on the right side of the screen change color and bottom

//where is the circle

if (centerX > width/2 && centerY > height/2){
  fill (0, 255, 0);
  ellipse(centerX, centerY, rad, rad);
}

else if(centerX< width/2 && centerY < height/2){
  fill(0, 255, 255);
  ellipse(centerX, centerY, 2*rad, 2*rad);
}

else if(centerX > width/2 && centerY < height/2){
  fill(random(0,255), random(0,255), random(0,255));
  ellipse(centerX, centerY, 5*rad, 5*rad);
}

else if (centerX < width/2 && centerY > height/2){
  fill(0, 0, 255);
  rect(centerX, centerY, rad, rad);
}




