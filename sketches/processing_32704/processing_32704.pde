
//setup
size(500,500);
background(255,0,127);

//assign radius of ellipse as a variable
int rad = 50;

//make X & Y coordinate of ellipse random
int centerX = round(random(50,width-50));
int centerY = round(random(50,height-50));



//quadrants
line(width/2,0,width/2,height);
line(0,height/2,width,height/2);

//draw white circle
//fill(255);
//ellipse(centerX,centerY,rad,rad);
//println(centerX + " " + width);

//conditional statements
//if the ball is on the right side of the screen, make it green
/*if(centerX >= width/2){
  fill(0,255,0);
  ellipse(centerX,centerY,rad,rad);

//if the ball is on the left side of the screen, make it purple 
}else{
  fill(0,0,255,100);
  ellipse(centerX,centerY,rad,rad);
}

//if the ball is on the top of the screen, make it
if(centerY <= height/2){
  fill(255,0,255,100);
  ellipse(centerX,centerY,rad,rad);
}*/
/*** When we do this, our program conflicts.  What is it supposed to do in the top left/right quadrants? ***/

//let's do this instead (and comment out the conditionals above)
if(centerX <= width/2 - rad && centerY <= height/2 - rad){
  fill(255,255,255,100);
  ellipse(centerX,centerY,rad,rad);
  //if we do JUST THIS, we may not ever see the circle
  //so let's make an else statement
}else{
  fill(0,0,255,100);
  ellipse(centerX,centerY,rad,rad);
}
//so, what are we saying here?
//if the ball is in the top left quadrant, make it pink
//if the ball is anywhere else on the screen, make it purple

//etc...continue this excercise with the other quadrants



                
                                
