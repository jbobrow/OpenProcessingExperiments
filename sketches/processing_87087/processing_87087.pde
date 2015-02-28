
size(520, 480);
smooth();
stroke(245, 223, 133); 
noStroke();
background(0);
for (int y = 0; y <= height; y += 32) {
  for ( int x = 0; x <= width; x += 32) {
  fill(245, 73, 87);
  ellipse(x, y, 40, 40);
  }
}
//Rectangles
int x = 25;
int h = 20;
int y = 25;
fill (0);
rect(x*6, y , 300, h);  // Top
x = x + 100;
fill (224, 223, 133);
rect(x, y + h, 300, h); // Middle
x = x - 250;
fill (106, 168, 82);
rect(100, y + h*2, 300, h); // Bottom

//Text
textSize(52);
fill(255, 255, 0);
text("ROBOT", 170, 80);
fill(34, 139, 34);
text("TIME", 200, 130); 
 
//background
stroke(0);
strokeWeight(3);
line(0, 0, width, height); 
line(width, 0, 0, height);

//circles
fill(34, 139, 34);
ellipse(482, height/2, 60, 60);
fill(0);
ellipse(450, height/2, 60, 60);
fill(255, 255, 0);
ellipse(469, 275, 60, 60);

//Rectangles
fill(34, 139, 34);
rect(38, height/2.03, 45, 45); //green
fill(0);
rect(80, height/1.84, 45, 45); // black
fill(255, 255, 0);
rect(80, height/2.2, 45, 45); // yellow 


//Ears
fill(106, 168, 82); // Set stroke to green
beginShape();
triangle(242, 188, 232, 215, 242, 215); //left ear
triangle(332, 188, 323, 215, 332, 215); // right ear
endShape();

// Outer Eyes
fill (224, 223, 133);
beginShape();
rect(215, 215, 72, 72);
rect(287, 215, 72, 72);
endShape();

// Middle Eyes
fill (245, 73, 87);
beginShape();
rect(226, 226, 54, 54);
rect(297, 226, 54, 54);
endShape();

// Inner Eyes
fill (106, 168, 82);
beginShape();
rect(242, 242, 18, 18);
rect(315, 242, 18, 18);
endShape();

// Outter Mouth
fill (106, 168, 82);
beginShape();
rect(234, 288, 108, 90);
endShape();

//Inner Mouth
fill (0);
beginShape();
rect(242, 296, 90, 72);
endShape();

// Teeth
fill (245, 73, 87);
beginShape();
triangle(261, 342, 252, 369, 270, 369);
triangle(288, 342, 279, 369, 297, 369);
triangle(315, 342, 306, 369, 324, 369); 
endShape();

// Body
fill (224, 223, 133);
beginShape();
rect(242, 378, 90, 99);
fill (0);
rect(252, 378, 72, 90);
endShape();

// Body Symbols
fill (106, 168, 82);
beginShape();
triangle(287, 388, 279, 396,296, 396);
endShape();
fill (224, 223, 133);
beginShape();
rect(278, 404, 18, 36);
endShape();
fill (245, 73, 87);
beginShape();
triangle(287, 449, 278, 457, 296, 457);
endShape();

// Left Hand
stroke(245, 223, 133); 
strokeWeight(5);
line(239, 404, 188, 404);
line(239, 440, 188, 440);
line(189, 405, 162, 423);
line(162, 423, 188, 440);
stroke(0); 
strokeWeight(3);
line(200, 413, 243, 413);
line(200, 432, 243, 432);
line(189, 413, 180,423);
line(180, 423, 188,432);

// Right Hand
stroke(245, 223, 133); 
strokeWeight(5);
line(332, 404, 387, 404);
line(332, 440, 387, 440);
line(387, 404, 407, 423);
line(407, 423, 387, 440);
stroke(0); 
strokeWeight(3);
line(332, 413, 371, 413);
line(332, 432, 371, 432);
line(378, 413, 387, 422);
line(387, 422, 378, 432);










