
//size of shape
size(250,250);
//background colour
background(#FFFFFF);
//no outline for the shape
noStroke();
//sets image in the center
translate(125,125);
//shape's origin will begin in the middle
rectMode(CENTER);
//x starts at 180. x is greater than 0, therefore 10 will be subtracted
for(int x=180; x>0;x-=10){
rect(0,0,x,x);
//loop rotates the rectangle and repeats
rotate(PI/3.0);
//colour of shape. by subtracting x from 255, the colour will change
fill(255-x, 0, 0);
}
                
                
