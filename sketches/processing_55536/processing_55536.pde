
//Generates a different shape each time
//screen size will be 250x250
size(250,250);
background(255);
smooth();
//no stroke on shapes
noStroke();
 
//draws the rectangle from the center
rectMode (CENTER);
//moves it to the middle of the canvas
translate(125,125);
 
//it starts at 255, is greater than 0, and decreases by 10
for(int x=255; x>0; x-=10){
   
  //changes colour from pink to blue
  fill((x-255)*-1,13,140);
  //changes the size of shape
  rect(0,0,x,x);
  //rotates shape each time, multiplied by a random number
  rotate (-2*random(10));
}

