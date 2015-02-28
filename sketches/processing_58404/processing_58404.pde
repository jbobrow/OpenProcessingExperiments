
/*
Week 1 Homework: Landscape
 by Matt Richard
 */

// first set the size of the sketch in pixels
size(400, 400);// size(width, height);

// now turn on anti-aliasing (makes curves look smooth and pretty)
smooth();

// when drawing a landscape, it is easier to draw form the back forward
// start with the background color
background(#FC9F61);

// now draw the sun, outer ring first then inner ring
noStroke();
fill(#DE6433);
ellipse(240, 160, 240, 240);// outer ring
fill(#C92B12);
ellipse(240, 160, 160, 160);// inner ring

// now draw the water
fill(#3C99DE, 64);// a light blue with only 1/4 opacity (64/255 = 1/4)
rect(0, 160, 400, 240);

// now draw the mountain on the upper right
// my mountain is a combo of 2 triangles and one rectangle
fill(#A57669);
triangle(280, 160, 320, 160, 320, 120);
rect(320, 120, 80, 40);
triangle(360, 120, 400, 120, 400, 80);
// now recreate the same shape but flipped where it touches the water
triangle(280, 160, 320, 160, 320, 200);
rect(320, 160, 80, 40);
triangle(360, 200, 400, 200, 400, 240);
// now draw the same mirrored shape but give it the same color and opacity as the water
fill(#3C99DE, 64);
triangle(280, 160, 320, 160, 320, 200);
rect(320, 160, 80, 40);
triangle(360, 200, 400, 200, 400, 240);

// now draw the second mountain on the left
// this mountain is closer to the viewer, so it is more complex
// 
fill(#865142);
triangle(-40, 200, 40, 200, 40, 80);
rect(40, 80, 40, 120);
triangle(40, 80, 80, 80, 80, 40);
triangle(80, 200, 160, 200, 80, 40);
triangle(120, 160, 200, 160, 120, 120);
triangle(160, 160, 200, 160, 240, 200);
// closer layer of mountain
fill(#76392F);
triangle(-40, 200, 80, 200, 80, 160);
rect(80, 160, 80, 40);
triangle(80, 160, 160, 160, 120, 120);
triangle(160, 200, 240, 200, 160, 160);
// now we need to flip these shapes like we did for the first mountain
fill(#865142);
triangle(-40, 200, 40, 200, 40, 320);
rect(40, 200, 40, 120);
triangle(40, 320, 80, 320, 80, 360);
triangle(80, 200, 160, 200, 80, 360);
triangle(120, 240, 200, 240, 120, 280);
triangle(160, 240, 200, 240, 240, 200);
// closer layer of mountain
fill(#76392F);
triangle(-40, 200, 80, 200, 80, 240);
rect(80, 200, 80, 40);
triangle(80, 240, 160, 240, 120, 280);
triangle(160, 200, 240, 200, 160, 240);
// now one last shape that serves as the transparent water overlay for the second mountain
fill(#3C99DE, 64);// blue water color and opacity
triangle(-40, 200, 40, 200, 40, 320);
triangle(40, 320, 80, 320, 80, 360);
rect(40, 200, 40, 120);
rect(80, 200, 40, 80);
triangle(80, 360, 120, 280, 80, 280);
rect(120, 200, 80, 40);
triangle(120, 280, 200, 240, 120, 240);
triangle(200, 240, 240, 200, 200, 200);
// viola!!!

