
size(250,250);
background(255);
noStroke();

rectMode(CENTER); //retangle's origin spawns from the center
fill(50,0,0); //1st layer of square's colour
translate(125,125); //origin is in the middle of canvas

for(int a=185; a>0;a-=10){
//looping of square; original size 185, size decreasing by 10
  fill((a-255)*-1,0,0); //gradient of colour fading to a lighter red
  //rectangle size changes with x
  rect(0,0,a,a); //rectangle's size affected by a variable
  rotate (0.5); //rotation of 0.5 rads)

}
