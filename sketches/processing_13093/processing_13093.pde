
size (640,480);
smooth ();
background (204,203,169);

noStroke();            //Blue rect
fill(39,90,125);
quad(380,360, 465,365,465,480,380,480);

noStroke();                //red rhombus
fill(196,45,52);
quad(300,390,390,390,400,420,300,420);

noStroke();                      //grey rect
fill(127,127,108);
rect(325,410,60,100);


noStroke();                    //large grey triangle
fill(159,168,158);
triangle(120,0,640,0,640,335);

noStroke();                  //yellowish rect
fill(175,137,72);
quad(205,335,282,340,282,480,205,480);

noStroke();                   //red rect,right corner
fill (187,47,49);
quad(545,385,630,395,630,480,545,480);

stroke(100);             //little lines :(
strokeWeight(.5);
noFill();
beginShape();
vertex (580,420);
for (int i=420; i<480; i+=5) {
  vertex(500,1.2*i);
  vertex(640,i);
}
vertex(640,440);
endShape();

beginShape();
vertex (320,250);
for (int i=200; i<480; i+=5) {
  vertex(420,1.2*i);
  vertex(600,i);
}
vertex(580,390);
endShape();

beginShape();
vertex (160,200);
for (int i=180; i<260; i+=5) {
  vertex(160,1.5*i);
  vertex(400,i);
}
vertex(160,390);
endShape();

beginShape();
vertex (160,100);
for (int i=130; i<290; i+=5) {
  vertex(160,1.5*i);
  vertex(400,i);
}
vertex(160,300);
endShape();

beginShape();
vertex (0,200);
for (int i=200; i<300; i+=5) {
  vertex(0,1.2*i);
  vertex(100,i);
}
vertex(100,300);
endShape();

bezier(320,480,323,363,440,270,440,270);
bezier(315,480,317,363,430,260,430,260);
bezier(310,475, 312,363,425,250,425,250);

ellipse(220,160,30,30);
rect(160,70,30,200);

noStroke();                  //beige rect
fill(221,177,150);
quad(40,40,580,80,580,110,40,90);



noStroke();                      //circle
fill(222,138,71);
ellipse (290,240,135,135);



noStroke();                      //pink rectangle
fill(187,74,110);
quad (0,50,70,47,70,150,0,150);

noStroke();                     //white rectangle(flag)
fill (199,204,194);
quad(0,145,70,150,70,380,0,375);

stroke (40,72,148);          //blue rectangle
strokeWeight(40);
strokeCap (PROJECT);
line(80,120,82,240);

noStroke();                      //green rhombus
fill(23,110,57,210);
quad (120,-15,280,90,280, 420, 120, 355);

stroke(0);   
noFill();                      //thick black lines
strokeWeight(2);
line(0,340,480,480);
line(0,356,640,373);
line(0,378,640,390);
rect(510,378,90,120);
line(0,202,545,415);
line(0,242,460,270);
beginShape();
vertex(0,130);
vertex(100,180);
vertex (280,190);
endShape();






noStroke();              //blue rhombus
fill(40,64,128);
quad(510,220,610,220,650,345,540,345);




noStroke();                      //circle
fill(211,111,46);
ellipse (495,265,130,130);

noFill();                         //blues squares and lines
stroke(45,67,143);
rect(130,448,50,40);
stroke(45,67,143);
strokeWeight(5);
strokeCap(SQUARE);
bezier(-2,340,40,325,590,290,640,300);
bezier(-2,55,155,15,540,70,620,120);


stroke (221,111,46);          //orange lines
strokeWeight(25);
strokeCap(SQUARE);
line(170,140,270,490);

stroke (221,111,46);
strokeWeight(25);
strokeCap(SQUARE);
line(250,180,330,490);

stroke(71,50,75);              //purple cross
strokeWeight(10);
strokeCap(SQUARE);
line(475,300,580,300);

stroke(71,50,75);
strokeWeight(10);
strokeCap(SQUARE);
line(510,260,510,340);

noStroke();                          //red rhombus
fill(190,43,47);
quad(25,382,210,410,210,450,35,435);

beginShape();
vertex(0,250);
vertex(20,260);
vertex(7,261);
vertex(30,280);
vertex(15,285);
vertex(40,290);
vertex(15,310);
vertex(20,315);
vertex(25,320);
vertex(5,330);
vertex(0,318);
vertex(0,280);
vertex(5,280);
vertex(0,270);
endShape(CLOSE);

stroke(191,188,156,225);              //red rhombus
strokeWeight(.25);
fill(190,43,47,235);
quad(163,335,163,357,100,400,70,400);

stroke(0);   
noFill();                      //thick black lines
strokeWeight(2);
line(0,400,237,480);

noStroke();                           //purple triangle
fill(89,65,133);
triangle(20,0,100,0,20,60);

triangle(0,430,80,480,0,480);

triangle(80,480,87,472,95,480);

noStroke();                      //grey rect
fill(127,127,108);
quad(158,430,215,432,215,480,158,480);
rect(440,420,40,60);


stroke(0);                          //thick black lines
strokeWeight(2);
noFill();
quad(190,433,510,450,525,482,200,482);
line(510,450,640,455);
line(90,60,244,50);
line(338,195,535,200);
beginShape();
vertex(0,80);
vertex(155,140);
vertex(300,135);
endShape();
line(440,135,640,132);
line(550,132,555,220);
line(590,132,595,220);
line(360,175,380,320);
line(390,180,390,460);

noStroke();                  //white rect, long
fill(212,220,213,245);
quad(290,107,640,165,640,215,290,165);

noStroke();                      //blue rect and diamonds
fill (0,110,169);
triangle(570,0,610,0,600,15);

noStroke();                         //blues squares and lines
fill(45,67,143);
quad (600,0,640,0,640,15,595,15);



noStroke();                    //red rhombus
fill(170,91,91);
quad(590,30,640,30,640,50,560,50);




noStroke();                         //blues squares and lines
fill(45,67,143);
rect(130,448,50,40);
stroke(45,67,143);
strokeWeight(5);
strokeCap(SQUARE);
line(40,470,38,482);
line(-2,415,15,482);
line(568,470,565,482);

line(260,0,400,480);              //two blue lines, long
line(395,260,460,480);

stroke (221,111,46);              //orange lines
strokeWeight(25);
strokeCap(SQUARE);
line(355,490,385,375);

stroke (221,111,46);
strokeWeight(25);
strokeCap(SQUARE);
line(425,490,445,410);

stroke(0);   
noFill();                      //thick black lines
strokeWeight(2);
rect(230,460,220,30);


noStroke();                      //blue rect and diamonds
fill (0,110,169);
quad(220,190,300,190,300,220,220,220);

noStroke();
strokeWeight(1);
fill(0,110,169);
quad (243,240, 260,230, 277,240, 260,250);
quad(243,265, 260,255, 277,265, 260,275);
quad(270,252, 285,242, 302,252, 285,261);

ellipse(40,450,25,25);
ellipse(160,460,22,22);

stroke(63,88,108);            //grey line parallel with green r
strokeWeight(6);
strokeCap(SQUARE);
line(159,-2,412,157);

noStroke();                //white rectangle with hole
fill(180,211,213);
rect(220,285,80,30);

                  // orange hole
fill(221,111,46);
beginShape();
vertex(275,290);
vertex (285,293);
vertex (287,288);
vertex (289,300);
vertex (287,310);
vertex (273,310);
vertex (270,300);
endShape(CLOSE);


stroke(0);                          //thick black lines
strokeWeight(2);
noFill();
strokeWeight(5);
line(0,110,160,0);
bezier(170,480,155,370,510,50,635,-2);

noFill();                    //grey curve
stroke(58,89,99);
strokeWeight(5);
strokeCap(SQUARE);
bezier(40,90,30,35,65,5,80,-2);

noStroke();
fill(4,143,113);
beginShape();
vertex(520,400);
vertex(522,402);
vertex(524,402);
vertex(523,401);
vertex(524,404);
vertex(520,403);
vertex(518,404);
vertex(519,402);
vertex(516,401);
vertex(518,401);
endShape();






//grid
stroke (0);
strokeWeight(1);

line (160,0, 160,480);
line (320,0, 320, 480);
line (480,0, 480,480);
line (640,0, 640, 480);

line(0,120, 640,120);
line (0,240, 640,240);
line (0, 360, 640, 360);
line (0,480, 640,480);





