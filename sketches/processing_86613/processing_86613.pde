
void setup () {

background (177, 5, 5); //175, 7, 13

int grid = 20;

size (800, 800);

for (int i = 0; i < width; i+=grid) {

  line (i, 0, i, height);

}

for (int i = 0; i < height; i+=grid) {

  line (0, i, width, i);

}







}

void draw() {

  fill(255);
pushMatrix();
 translate(400,400);
 rotate(radians(frameCount));

  beginShape();
  vertex( 400, 400 );
  vertex(399, 404);
  vertex( 395, 395 );
  vertex( 28, 26 );
  vertex( 405, 405 );
  vertex( -64, -20 );
  vertex(400, 410);
  endShape(CLOSE);
popMatrix();

fill (103, 62, 20);

beginShape();

vertex (400, 689); // change all points to vertex when outline finished. add begin and end shape.

vertex (379, 688);

vertex (361, 683);

vertex (342, 662);

vertex (329, 639);

vertex (312, 613);

vertex (296, 594);

vertex (284, 572);

vertex (272, 544);

vertex (265, 520);

vertex (259, 495);

vertex (249, 491);

vertex (243, 483);

vertex (237, 464);

vertex (231, 442);

vertex (222, 422);

vertex (217, 402);

vertex (218, 384);

vertex (220, 377);

vertex (211, 339);

vertex (205, 274);

vertex (207, 311);

vertex(206, 236);

vertex(212, 200);

vertex(235, 165);

vertex(254, 141);

vertex(350, 99);//start of left side

vertex(300, 109);

vertex(400, 94); // middle top.

vertex (450, 99);//start of right side

vertex (500, 109);

vertex (546, 141);

vertex (565, 165);

vertex (588, 200);

vertex (594, 236);

vertex (593, 311);

vertex (595, 274);

vertex (589, 339);

vertex (580, 377);

vertex (582, 384);

vertex (583, 402);

vertex (578, 422);

vertex (569, 442);

vertex (563, 464);

vertex (557, 483);

vertex (551, 491);

vertex (541, 495);

vertex (535, 520);

vertex (528, 544);

vertex (516, 572);

vertex (504, 594);

vertex (488, 613);

vertex (471, 639);

vertex (458, 662);

vertex (439, 683);

vertex (421, 688);

endShape();


fill(0);
quad(240, 379, 220, 377, 202, 254, 264, 254);


fill(0);
quad(557, 379, 581, 377, 597, 254, 535, 254);



fill(236, 237, 7);
rect(275, 275, 120, 120, 7);

fill(236, 237, 7);
rect(415, 275, 120, 120, 7);

if (mousePressed) {
fill(255); }
else {
fill(0); }
rect(280, 280, 110, 110, 7);


if (mousePressed) {
fill(255); }
else {
fill(0); }
rect(420, 280, 110, 110, 7);

fill(236, 237, 7);
rect(390, 340, 30, 8, 7);


fill(170, 5, 5);
arc(400, 565, 100, 100, PI, TWO_PI);

fill(0);
arc(400, 255, 395, 350, PI, TWO_PI);


triangle(400, 352, 410, 475, 400, 465);


strokeWeight(2);
fill(0);
line(410, 475, 420, 465);



fill(236, 237, 7);
rect(395, 5, 15, 15);

fill(236, 237, 7);
rect(395, 775, 15, 15);

fill(236, 237, 7);
rect(775, 400, 15, 15);

fill(236, 237, 7);
rect(10, 400, 15, 15);

}
















