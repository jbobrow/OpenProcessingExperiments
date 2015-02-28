
size(600, 640);
background(#134290);
noStroke();

fill(204);
triangle(45, 108, 3, 168, 30, 168);

pushMatrix();
fill(204);
rotate(radians(0));
triangle(70, 128, 20, 155, 30, 168);
popMatrix();

pushMatrix();
fill(204);
rotate(radians(0));
triangle(50, 200, 30, 140, 30, 168);
popMatrix();

pushMatrix();
fill(204);
rotate(radians(0));
triangle(60, 180, 30, 140, 30, 168);
popMatrix();

fill(#335F51);
pushMatrix();
rotate(radians(-10));
quad(-27, 165, 0, 170, 18, 330, -18, 360);
popMatrix();

fill(#335F51);
quad(48, 380, 38, 320, 300, 340, 300, 400);

fill(#4D4D4D);
triangle(52, 377, 75, 323, 65, 360);

/*leg*/fill(#1F3E3E);
ellipse(340, 480, 40, 150);

/*leg*/fill(#1F3E3E);
ellipse(260, 480, 40, 150);

/*feet*/fill(#81A049);
ellipse(260, 550, 40, 25);

/*feet*/fill(#81A049);
ellipse(341, 550, 40, 25);

fill(#729D86);
ellipse(300, 317, 145, 250);

/*arm*/fill(#1F3E3E);
ellipse(215, 330, 40, 150);

/*arm*/fill(#1F3E3E);
ellipse(385, 330, 40, 150);

fill(#729D86);
arc(300, 280, 200, 180, PI , TWO_PI);

fill(#D83737);
quad(250, 300, 265, 280, 285, 290, 285, 300);

fill(#D83737);
quad(348, 300, 325, 285, 310, 290, 310, 300);

fill(#000000);
arc(300, 400, 100, 140, PI , TWO_PI);

fill(#ED60B2);
arc(300, 360, 78, 60, PI , TWO_PI);

pushMatrix();
fill(#CBE5A9);
rotate(radians(0));
triangle(259, 357, 278, 357, 270, 385);
popMatrix();

pushMatrix();
fill(#CBE5A9);
rotate(radians(0));
triangle(289, 357, 308, 357, 300, 385);
popMatrix();

pushMatrix();
fill(#CBE5A9);
rotate(radians(0));
triangle(319, 357, 338, 357, 330, 385);
popMatrix();

fill(#E3DF77);
ellipse(252, 160, 72, 72);

fill(000);
ellipse(235, 155, 18, 18);

fill(#434645);
ellipse(260, 145, 10, 10);

fill(#434645);
ellipse(255, 180, 25, 15);





