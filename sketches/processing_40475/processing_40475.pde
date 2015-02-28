
size(500, 500);

PImage img;
img = loadImage("Scan-110407-0016.jpg");
tint(102);
image(img, 20, 20, 100, 100);
image(img, 100, 75);
noTint();
image(img, 60, 60, 30, 30);
image(img, 0, 0);

for (int x = 5; x < 200; x +=15) {
  float n = map(x, 5, 150, -1, 1);
  float p = pow(n, 4);
  float ypos = lerp(200, 500, p);
  strokeWeight(4);
  stroke(#622928);
  line(x, 0, x, ypos);
}

smooth();
noStroke();
fill(#6FBED3);
beginShape();
vertex(90, 39);
bezierVertex(100, 46, 54, 17, 26, 83);
bezierVertex(26, 83, 90, 45, 90, 400);
endShape();

smooth();
noStroke();
ellipseMode(RADIUS);
fill(70, 50, 20, 75);
ellipse(33, 33, 100, 100);
fill(200, 30, 40, 200);
ellipseMode(CORNER);
ellipse(33, 33, 60, 60);
fill(0);
ellipseMode(CORNERS);
ellipse(33, 33, 60, 60);

PFont font;
font = loadFont("Zapfino-48.vlw");
textFont(font);
fill(255, 255, 255, 150);
String s = "Nothing seems to matter";
text(s, 250, 25, 250, 350);
String t = "seems";
text(t, 350, 150, 250, 350);
String u = "to";
text(u, 420, 275, 250, 350);
String v = "matter.";
text(v, 290, 375, 250, 350);

