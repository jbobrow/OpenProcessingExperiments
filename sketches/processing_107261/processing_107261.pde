
/* @pjs preload="SandyBeach.jpg" */

//Set size and add background
size(1024, 768);
background(loadImage("SandyBeach.jpg"));

//Makes linear gradient. Code for borrowed from processing.org/examples
color mainColor = color(255, 242, 0);
color secondaryColor = color(81, 77, 0);
for (int i = 133; i <= 266; i++) {
  float inter = map(i, 133, 266, 0, 1);
  color c = lerpColor(secondaryColor, mainColor, inter);
  stroke(c);
  line(i, 250, i, 416);
}
stroke(0); //Resets brush

//Draws trapezoid thing left of triangle
noFill();
beginShape();
vertex(133, 250);
vertex(133, 416);
vertex(166, 416);
vertex(266, 250);
vertex(133, 250);
endShape();

//Draws triangle
fill(mainColor);
triangle(166, 416, 266, 250, 366, 416);


