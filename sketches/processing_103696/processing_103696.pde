
////GSwP 3.18 Draw an Arrow and 3.19 Close the Gap
//
//size(480, 120);
//beginShape();
//vertex(180, 82);
//vertex(207, 36);
//vertex(214, 63);
//vertex(407, 11);
//vertex(412, 30);
//vertex(219, 82);
//vertex(226, 109);
//endShape(CLOSE);

//GSwP 3.20 Create Some Creatures

size(480, 120);
smooth();

//Left creature
beginShape();
vertex(50, 120);
vertex(100, 90);
vertex(110, 60);
vertex(80, 20);
vertex(210, 60);
vertex(160, 80);
vertex(200, 90);
vertex(140, 100);
vertex(130, 120);
endShape();
fill(0);
ellipse(155, 60, 8, 8);

//Right creature
fill(255);
beginShape();
vertex(360, 120);
vertex(360, 90);
vertex(290, 80);
vertex(340, 70);
vertex(280, 50);
vertex(420, 10);
vertex(390, 50);
vertex(410, 90);
vertex(460, 120);
endShape();
fill(0);
ellipse(345, 50, 10, 10);

//To comment out lines, press Ctrl-/
//You can also comment out many lines by hiliting them then Ctrl-/
