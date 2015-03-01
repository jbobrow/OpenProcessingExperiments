
//Exploring shapes.
//This bird was inspired by a design in a Celtic quilting book.
//It is drawn using many shapes of different kind and size.
//I wanted to challenge myself since I'm not very artistic.

size(400, 600);
background(#E0DCDC);

//this code drew the grid which made it easier for me to 
//estimate all the numbers
for (int i = 0; i < 600; i = i+50) {
  line(0, i, 400, i);
}
for (int i = 0; i < 400; i = i+50) {
  line(i,0,i,600);
}

//foot
fill(#C4B086);
stroke(#C4B086);
triangle(240, 330, 240, 380, 200, 360);
fill(#554B16);
stroke(#554B16);
strokeWeight(10);
line(240, 375, 248, 388);
line(240, 400, 260, 380);
line(240, 400, 235, 410);
line(260, 380, 270, 375);

//tail feathers
fill(#ED0C0C);
stroke(#ED0C0C);
strokeWeight(1);
rect(180, 350, 40, 180);
ellipse(200, 530, 40, 40);
fill(#B98809);
stroke(#B98809);
rect(170, 350, 36, 150);
ellipse(188, 500, 36, 36);
fill(#FAC85B);
stroke(#FAC85B);
rect(160, 350, 32, 110);
ellipse(176, 460, 32, 32);

//body
fill(#C4B086);
stroke(#C4B086);
ellipse(200, 260, 120, 200);
triangle(225, 350, 140, 420, 140, 270);

//neck
quad(130, 100, 150, 80, 190, 180, 160, 200);

//head
quad(180, 70, 190, 85, 150, 130, 120, 90);
quad(120, 90, 90, 130, 110, 140, 140, 120);
quad(90, 130, 85, 170, 100, 175, 110, 140);
ellipse(120, 185, 30, 30);
quad(85, 170, 120, 200, 120, 170, 100, 160);
ellipse(140, 95, 40, 40);

//beak
fill(#FCF624);
stroke(#FCF624);
quad(180, 70, 220, 60, 190, 85, 175, 85);
stroke(#E8C515);
line(220, 60, 175, 85);

//eye
stroke(#3B3202);
fill(#F7DC52);
quad(130, 100, 140, 90, 150, 90, 145, 95);

//colour on body
fill(#507126);
stroke(#507126);
ellipse(200, 260, 100, 150);
triangle(220, 330, 150, 390, 150, 270);
fill(#DE9910);
rect(150, 250, 100, 10);
quad(150, 320, 231, 320, 221, 330, 150, 330);
fill(#AA7305);
stroke(#AA7305);
triangle(150, 260, 210, 260, 185, 320);
triangle(190, 260, 250, 260, 220, 320);

