
size(800,800);
background(#222222);

// tea mug ----------------------------------------
// handle
fill(255,255,255,255);
noStroke();
ellipse(325,200, 100,100);

fill(34,34,34,255);
noStroke();
ellipse(325,200, 80,80);

// mug
fill(#ffffff);
noStroke();
quad(125, 100, 150, 300, 300, 300, 320, 100);

// the sun <3 ----------------------------------------
fill(#FBFFCE);
ellipse (width/2+200, 200, 100,100);

// top bottom triangles
triangle(width/2 + 220, 140, width/2 + 180, 140, width/2 + 200, 100);
triangle(width/2 + 220, 260, width/2 + 180, 260, width/2 + 200, 300);

// left right triangles
triangle(width/2 + 140, 220, width/2 + 140, 180, width/2 + 100, 200);
triangle(width/2 + 260, 220, width/2 + 260, 180, width/2 + 300, 200);

// GRAPH OUT OTHER SIDES
stroke(#FBFFCE);
strokeWeight(10);
line(width/2 + 150, 150, width/2 + 130, 130); 
line(width/2 + 250, 150, width/2 + 270, 130); 
line(width/2 + 250, 250, width/2 + 270, 270); 
line(width/2 + 150, 250, width/2 + 130, 270); 

// smile
noFill();
stroke(#C3EFF7);
arc(400, 400, 480,480, 0, PI);

