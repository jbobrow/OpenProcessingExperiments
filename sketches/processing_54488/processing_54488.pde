
//Eun Elaine Na
//Interactivity <YSDN> Winter 2012

//canvas size
size(250,250);
//canvas colour
background(255);
//sets square to the center
rectMode(CENTER);
//no outline for the squares
noStroke();
//centers origin of image
translate(125,125);
//Dark red for the first square
fill(50,0,0);
//looping squares. starting at 180 for a. decreasing by 10
for(int a = 180; a > 0; a -= 10){
//square size changes with the value of
rect(0,0,a,a);
//colour gradation from dark to bright
fill((a-255)*-1,0,0);
//rotate squares by 0.5
rotate (0.5);

}
  
