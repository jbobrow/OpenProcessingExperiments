
//screen size
size(250,250);
//background colour
background(255);
//sets rectangle to the center
rectMode(CENTER);
//centers origin of image
translate(125,125);
//first rectangle colour is dark red
fill(50,0,0);
//no border shapes
noStroke();
//looping rectangles, starting at 180 for a, decreasing by 10
for(int a = 180; a > 0; a -= 10){
//colour changes from dark red to vibrant red
fill((a-255)*-1,0,0);
//rectangle size changes with the value of a
rect(0,0,a,a);
//rotate rectangles by 0.5
rotate (0.5);
}
                
                
