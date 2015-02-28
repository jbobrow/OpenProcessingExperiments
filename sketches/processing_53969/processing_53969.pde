
//sets screen size
size(250,250);
//sets the screen background colour to white
background(255);
//smooth edges
smooth();
//no stroke on shapes created
noStroke();
 
//rectangles will be drawn from the centre point
//the first/second value is x and y, third/fourth value is width and height
rectMode (CENTER);
//moves the origin to the centre of the image
translate(125,125);
 
//this is the loop to create the shapes
//it starts at 165, is greater than 0, and decreases by 4
for(int x=165; x>0;x-=4){
   
  //this changes the colour from red to blue
  fill((180),(160-x),(200-x));
  //this changes the size of the shape
  rect(0,0,x+3,x+3);
  //this changes the angle of the shape by 2.3
  rotate (1.6);
   
}

                
                                                                                                                                                                                                                                                                                                                                                
