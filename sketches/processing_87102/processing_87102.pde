
size(200, 300);
background(0);
smooth();
for (int y = 0; y <= height; y += 40) {
  for (int x = 0; x <= width; x+= 40) {
     fill(202, 180, 154);
     ellipse(x, y, 80, 80);
  }
}

strokeWeight(2);

fill(21, 39, 48);
// HEAD
beginShape();
vertex(60, 80);
vertex(70, 70);
vertex(90, 60);
vertex(110, 60);
vertex(130, 70);
vertex(140, 80);
vertex(130, 110);
vertex(70, 110);
endShape(CLOSE);

//BODY
beginShape();
vertex(70, 120);
vertex(130, 120);
vertex(130, 190);
vertex(110, 210);
vertex(90, 210);
vertex(70, 190);
endShape(CLOSE);

beginShape();   //shoulder left
vertex(50, 120);
vertex(60, 120);
vertex(60, 140);
vertex(40, 140);
endShape(CLOSE);

beginShape();   //shoulder right
vertex(140, 120);
vertex(150, 120);
vertex(160, 140);
vertex(140, 140);
endShape(CLOSE);

fill(72, 129, 117);
triangle(70, 80, 80, 80, 75, 85); //lefteye
triangle(120, 80, 130, 80, 125, 85); //righteye
triangle(100, 90, 120, 100, 80, 100); //mouth

line(100, 60, 100, 30);    //Top Antennae
line(100, 40, 90, 40);
line(100, 50, 120, 50);

line(140, 80, 160, 60); //Right Antennae
line(155, 65, 150, 60);

line(60, 80, 40, 60); //Left Antennae
line(45, 65, 40, 70);

line(80, 130, 100, 130);  //chest designs
line(80, 140, 100, 140);
line(80, 150, 100, 150);
line(110, 130, 110, 170);
line(120, 140, 120, 160);
line(80, 180, 120, 180);
line(90, 190, 110, 190);


fill(107, 97, 93);
//NECK
rect(90, 110, 20, 10);

//LEFT ARM
line(60, 130, 70, 130);

line(50, 140, 50, 150); //wire

rect(40, 150, 20, 40); //arm

line(40, 190, 40, 200); //fingers
line(50, 190, 50, 210);
line(60, 190, 60, 200);

//RIGHT ARM
line(130, 130, 140, 130);

line(150, 140, 150, 150); //wire

rect(140, 150, 20, 40); //arm

line(140, 190, 140, 200); //fingers
line(150, 190, 150, 210);
line(160, 190, 160, 200);

//LEFT LEG
line(80, 200, 80, 220);

beginShape();
vertex(70, 220);
vertex(90, 220);
vertex(90, 260);
vertex(60, 260);
vertex(60, 250);
vertex(70, 250);
endShape(CLOSE);

//RIGHT LEG
line(120, 200, 120, 220);

beginShape();
vertex(110, 220);
vertex(130, 220);
vertex(130, 250);
vertex(140, 250);
vertex(140, 260);
vertex(110, 260);
endShape(CLOSE);









