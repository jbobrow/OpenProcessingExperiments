
//screen size
size(250,250);
//background screen colour
background(255);
//smooth edges
smooth();
//removes strokes around object
noStroke();
 
//draws rectagle in the center
//the first/second value is x and y, third/fourth value is width and height
rectMode (CENTER);
//moves the origin to the centre of the image
translate(125,125);
 
//starts at 180, greater than 0, decreases by 10
for(int i=180; i>0;i-=10){
   
  //colour of the rectanlge (from dark red to light red)
  fill((i-255)*-1,0,0);
  //changes the size of the shape
  rect(0,0,i,i);
  // changes the angle of the shape by 0.5
  rotate (0.5);
}

                
                                
