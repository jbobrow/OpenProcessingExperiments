
//screen size
size(250,250);
//background colour
background(0);
//sets rectangle to the center
rectMode(CENTER);
//centers origin of image
translate(125,125);
//first rectangle colour is dark blue
fill(50,0,0);
//change stroke colour to white
stroke(255);
//looping rectangles, starting at 200 width and length square, decreasing by 30
for(int a = 200; a > 0; a -= 30){
//colour changes from dark blue to magenta;
fill((a-255)*-1,0,(a-255)*-10);
//rectangle size changes with the value of a
rect(0,0,a,a);
//rotate rectangles by 280
rotate (280);
}
                
                
