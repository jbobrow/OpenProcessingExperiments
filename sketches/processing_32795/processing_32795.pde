
size(500,500);
background(124,134,156);
 
//assign radius of ellipse as a variable
int rad = 50;
 
//make X & Y coordinate of ellipse random
int centerX = round(random(100,width-100));
int centerY = round(random(100,height-100));
 
 
 
//quadrants
line(width/2,0,width/2,height);
line(0,height/2,width,height/2);
 
if(centerX < width/2 && centerY < height/2){ //top left//
  fill(244,234,256);
  ellipse(centerX,centerY,rad,rad);
  //if we do JUST THIS, we may not ever see the circle
  //so let's make an else statement
  
}else if(centerX > width/2 && centerY > height/2){ //top right//
//what to do
   fill(90,156,67);
   ellipse(centerX,centerY,rad,rad);

}else if(centerX > width/2 && centerY < height/2){ //bottomleft//
//what to do
   fill(30,90,60);
   ellipse(centerX,centerY,rad,rad);
  
}else{
  background(255);
  fill(11,3,90);
  ellipse(centerX,centerY,rad*2,rad*2);
}







  
//so, what are we saying here?
//if the ball is in the top left quadrant, make it pink
//if the ball is in the  left quadrant, make it pink
//if the ball is anywhere else on the screen, make it purple
 


                
                
