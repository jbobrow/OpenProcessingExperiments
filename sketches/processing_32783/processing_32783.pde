
size(500,500);
background(255,0,127);

int X=50;

//random.. width of circle is 50... keeping circle completely in the screen
float centerX, centerY;
centerX=random(50, width-50);
centerY=random(50, height-50);

//If using int instead of float.. below is how to round the number to a whole number
//int centerX, centerY;
//centerX = round(random(0,100));

//quadrants
line(width/2,0,width/2,height);
line(0,height/2,width,height/2);

//if th eball is on the right side and bottom
//of the screen change to green

//where is the circle?
if(centerX > width/2 && centerY > height/2){
  fill(0,255,0);
  ellipse(centerX, centerY, X, X);
  
  //what happens if the top is not true
}else{
  fill(237,228,43);
  ellipse(centerX,centerY,X,X);
  
}

if(centerX < width/2 && centerY < height/2) {
  fill(0,0,255);
  ellipse(centerX, centerY, X, X);
}

if(centerX > width/2 && centerY < height/2) {
  fill(255,0,0);
  ellipse(centerX, centerY, X, X);
}


