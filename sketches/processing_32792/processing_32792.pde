
size(500,500);
background(150,50,95);
smooth();
 
//radius of ellipse as a variable
int rad = 100;
 
//X & Y coordinate of ellipse are random
int centerX = round(random(50,width-50));
int centerY = round(random(50,height-50));
 
//4quadrants
strokeWeight(10);
line(width/2,0,width/2,height);
line(0,height/2,width,height/2);
 
//commenting out the conditionals above
if(centerX <= width/2 - rad && centerY <= height/2 - rad){
  fill(255,255,255,100);
  ellipse(centerX,centerY,rad,rad);
  //if we do JUST THIS, we may not ever see the circle
  //so let's make an else statement
}else{
  fill(0,0,255,100);
  ellipse(centerX,centerY,rad,rad);
}


