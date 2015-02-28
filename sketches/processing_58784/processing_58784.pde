
size(400, 400);
smooth();
// background color first
background(#FAF5E3);

// for the most part, you want to draw the things in the background first
// then overlap closer shapes on top

// hair first
noStroke(); // turn off the shape outlines
fill(#342A1A);
triangle(40, 0, 0, 80, 40, 160);
rect(40, 0, 320, 40);
rect(40, 40, 40, 120);
triangle(80, 40, 80, 160, 120, 40);
triangle(120, 40, 200, 80, 280, 40);
triangle(280, 40, 320, 160, 320, 40);
triangle(320, 160, 360, 120, 320, 120);
rect(320, 40, 40, 80);
triangle(360, 0, 400, 0, 360, 120);

// forehead
fill(#E8B18F);
triangle(120, 40, 80, 160, 200, 160);
fill(#D89A83);
triangle(120, 40, 200, 160, 200, 80);
fill(#DEAC9A);
triangle(280, 40, 200, 160, 200, 80);
fill(#F2D3C6);
triangle(280, 40, 200, 160, 320, 160);

// ears
fill(#D89A83);
triangle(40, 160, 80, 160, 80, 280);
fill(#F2D3C6);
triangle(320, 160, 360, 160, 320, 280); 

// neck
fill(#D89A83);
rect(120, 320, 160, 80);

// shirt
fill(#557C6D);
rect(0, 360, 120, 40);
rect(280, 360, 120, 40);
triangle(0, 360, 120, 360, 120, 320);
triangle(400, 360, 280, 360, 280, 320);

// lower face
fill(#E8B18F);
triangle(80, 280, 200, 440, 320, 280);

// lower lip
fill(#E08C7F);
triangle(140, 280, 160, 320, 200, 320);
triangle(260, 280, 240, 320, 200, 320);
ellipse(200, 320, 80, 40);

// tongue
fill(#C1524C);
ellipse(200, 280, 80, 80);

// teeth
fill(#FAF5E3);
ellipse(200, 280, 100, 40);

// upper lip
fill(#E8B18F);
ellipse(200, 280, 120, 20);

// middle face
fill(#E8B18F);
rect(80, 160, 240, 120);

// nose
// left nostril
fill(#D89A83);
ellipse(180, 240, 30, 20);
// right nostril
fill(#F2D3C6);
ellipse(220, 240, 30, 20);
// main nose
fill(#EABCAD);
ellipse(200, 230, 35, 70);

// glasses
stroke(#342A1A);
strokeWeight(6);
noFill();
// left eyepiece
ellipse(140, 200, 80, 70);
// right eyepiece
ellipse(260, 200, 80, 70);
// nose bridge
line(180, 200, 220, 200);
// left ear piece
line(80, 160, 100, 200);
// right ear piece
line(320, 160, 300, 200);


