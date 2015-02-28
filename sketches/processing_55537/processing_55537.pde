
//screen size will be 250x250
size(250,250);
background(255);
smooth();
//no stroke
noStroke();
 
//draws the rectangle from the center
rectMode (CENTER);
//moves it to the middle of the canvas
translate(125,125);
 
//this is the loop to create the shapes
//integer is 180, greater than 0, and decreases by 10
for(int x=180; x>0; x-=10){
   
  //changes colour from dark to light red
  fill((x-255)*-1,0,0);
  //changes the size of shape
  rect(0,0,x,x);
  //rotates shape each time
  rotate (0.5);
}

