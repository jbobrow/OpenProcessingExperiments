
//Alina Marie Barron
//assignment #1
//for Loudogg



size(600, 600);
smooth();
background (157, 200, 255);
    PImage b;
b = loadImage("sky.jpg") ;
image(b, 0, 0) ;


//grass
fill(9, 124, 15);
arc(390, 600, 1400, 300, TWO_PI-PI/2, TWO_PI );
arc(0, 600, 1400, 360, TWO_PI-PI/2, TWO_PI );


//pole
strokeWeight(5.0);
line(450, 480, 450, 280);
strokeWeight(2.0);
beginShape();
vertex(434,290);
vertex(466,290);
endShape();
beginShape();
vertex(420,315);
vertex(480,315);
endShape();
beginShape();
vertex(430,340);
vertex(470,340);
endShape();

//pole 2
strokeWeight(4.0);
line(553, 452, 553, 380);
strokeWeight(1.5);
beginShape();
vertex(560,385);
vertex(545,385);
endShape();
beginShape();
vertex(565,395);
vertex(540,395);
endShape();
beginShape();
vertex(562,405);
vertex(543,405);
endShape();

//line 1
strokeWeight(0.5);
beginShape();
vertex(104,1);
vertex(605,439);
endShape();

//line2
beginShape();
vertex(186,1);
vertex(610,439);
endShape();

//line3
beginShape();
vertex(1,88);
vertex(600,440);
endShape();

//line4
beginShape();
vertex(1,13);
vertex(600,436);
endShape();









