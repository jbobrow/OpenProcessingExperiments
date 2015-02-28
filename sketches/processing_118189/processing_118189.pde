
size(800, 500);
background(255);

noStroke();

fill(0);
rect(20, 20, 20, 460);
rect(40, 20, 740, 20);
rect(40, 250, 20, 20);
fill(0, 100, 0);
ellipse(70, 470, 20, 20);
fill(0);
rect(130, 20, 20, 460);
rect(150, 250, 20, 20);

fill(0, 100, 0);
rect(190, 250, 100, 100);
rect(190, 350, 20, 110);
rect(190, 460, 100, 20);
fill(255);
ellipse(243, 297, 70, 70);
fill(0);

rect(310, 60, 20, 420);
rect(330, 460, 20, 20);

rect(370, 250, 20, 230);
fill(0, 100, 0);
ellipse(380, 210, 20, 20);
fill(0);

pushMatrix();
translate(410, 260);
rotate(radians(-30));
rect(0, 0, 20, 250);
popMatrix();
pushMatrix();
translate(540, 250);
rotate(radians(30));
rect(0, 0, 20, 250);
popMatrix();

rect(660, 20, 20, 460);
rect(680, 250, 20, 20);
fill(0, 100, 0);
ellipse(710, 470, 20, 20);
