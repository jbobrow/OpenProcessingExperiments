
size(400, 400);
smooth();

//background
background(227, 178, 133);
fill(100, 0, 0, 90);
noStroke();
rect(0, 0, 400, 400);
fill(100, 0, 0, 30);
ellipse(200, 200, 325, 325);
fill(100, 0, 0, 30);
ellipse(200, 200, 260, 260);

ellipseMode(CORNER);

float x, y, wd, ht;
x = 100;
y = 100;
wd = 200;
ht = 200;

//bounding circle + head
fill(227, 178, 133);
strokeWeight(5);
stroke(100, 61, 43);
noStroke();
ellipse(x, y, wd, ht);

//eyes
stroke(500, 500, 500);
strokeWeight(.2 * wd);
point(x + (.3  * wd), y + (.5 * ht));
point(x + (.7  * wd), y + (.5 * ht));
stroke(0, 0, 0);
strokeWeight(.05 * wd);
point(x + (.3  * wd), y + (.5 * ht));
point(x + (.7  * wd), y + (.5 * ht));

//nose
strokeWeight(.025 * wd);
stroke(103, 75, 61);
beginShape();
  vertex(x + (.5  * wd), y + (.45 * ht));
  vertex(x + (.45 * wd), y + (.7 * ht));
  vertex(x + (.55 * wd), y + (.7 * ht));
endShape();

//left lens
noFill();
stroke(90, 100, 91);
beginShape();
vertex(x, y + (.5  * ht));
vertex(x + (.15 * wd), y + (.5  * ht));
  curveVertex(x + (.15 * wd), y + (.57 * ht));
  curveVertex(x + (.15 * wd), y + (.43 * ht));
  curveVertex(x + (.4  * wd), y + (.43 * ht));
  curveVertex(x + (.4  * wd), y + (.57 * ht));
  curveVertex(x + (.15 * wd), y + (.57 * ht));
  curveVertex(x + (.15 * wd), y + (.5  * ht));
endShape();

beginShape();
vertex(x + (.43 * wd), y + (.5 * ht));
vertex(x + (.57 * wd), y + (.5 * ht));
endShape();

//right lens
beginShape();
vertex(x + wd, y + (.5  * ht));
vertex(x + (.85 * wd), y + (.5  * ht));
  curveVertex(x + (.85 * wd), y + (.57 * ht));
  curveVertex(x + (.85 * wd), y + (.43 * ht));
  curveVertex(x + (.6  * wd), y + (.43 * ht));
  curveVertex(x + (.6  * wd), y + (.57 * ht));
  curveVertex(x + (.85 * wd), y + (.57 * ht));
  curveVertex(x + (.85 * wd), y + (.57 * ht));
endShape();

//mouth
stroke(129, 67, 38);
line(x + (.45 * wd), y + (.83 * ht), x + (.55 * wd), y + (.83 * ht));

//moustache
noStroke();
fill(67, 37, 19, 95);
quad(x + (.4 * wd), y + (.75 * ht), x + (.6 * wd), y + (.75 * ht), x + (.65 * wd), y + (.8 * ht), x + (.35 * wd), y + (.8 * ht));

saveFrame("HW2.jpg");
