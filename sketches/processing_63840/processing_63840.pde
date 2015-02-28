
float angle = 40;

size(700,600);
smooth();

strokeWeight(2);

line(338, 380, 336, 393);
line(362, 380, 364, 393);

pushMatrix();
translate(390,245);
rotate(radians(angle));
ellipse(0, 0, 25, 40);
popMatrix();
pushMatrix();
translate(310,245);
rotate(radians(-angle));
ellipse(0, 0, 25, 40);
popMatrix();

ellipse(350, 305, 80, 160);

line(317, 152, 350, 200);
ellipse(317, 152, 10, 10);
line(383, 152, 350, 200);
ellipse(383, 152, 10, 10);

ellipse(350, 200, 70, 70);

strokeWeight(8);
point(366, 192);
point(334, 192);
strokeWeight(3);
line(338, 215, 362, 215);

