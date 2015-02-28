
class Ball{
 float xpos;
 float ypos;
 color c;
 float big;   //size of ball
 
 Ball(color tempC, float tempXpos, float tempYpos, float tempBig){
  c = tempC;
  xpos = tempXpos;
  ypos = tempYpos;
  big = tempBig;
 }
 
 void display(){
  //click & hold left mouse button to see black 'skeleton' balls 
  if (mousePressed == true){
   fill(tan(xpos));
  } else {
  fill(c, 5);
  strokeWeight(8);
  stroke(100, 100, 200, 10);
  }
  ellipse(xpos,ypos,big,big); 
}

void move(){
  //balls move towards mouse position
  if (mouseX < width/2){
   xpos = xpos + random(-2.2,2);
  } else {
    xpos = xpos + random(-2,2.2);
  }
  if (mouseY < height/2){
   ypos = ypos + random(-2.2,2);
  } else {
    ypos = ypos + random(-2,2.2);
  }
  //start white 'baby' ball
  if (xpos < 100) {
   fill(255, 5);
   ellipse(width/2 + xpos,ypos,big,big);
  }
  if (xpos > 700) {
   fill(255, 5);
   ellipse(xpos - width/2,ypos,big,big);
  }
  //move ball back to centre if reach edge of screen
  if (xpos < 10 || xpos > 790){
   xpos = width/2;
  }
  //start white 'baby' ball
  if (ypos < 100){
   fill(255, 5);
   ellipse(xpos, width/2 + ypos, big, big);
  }
  if (ypos > 500){
   fill(255, 5);
   ellipse(xpos, ypos - width/2, big, big);
  }
  //move ball to centre if reach edge of screen
  if (ypos < 10 || ypos > 590){
   ypos = height/2;
  }
}
}

