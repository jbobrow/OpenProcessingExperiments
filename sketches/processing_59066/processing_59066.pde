
/*
Self Portrait
*/

println("hello world");

size (500, 500);
background (#0E0F06, 10);

//backhair
smooth();
noStroke();
fill(#3B1C03);
triangle(290,140,490, 600, 450,150); //brown back right
triangle(290,140,500, 700, 480,300);
fill(#2E0E1C); //darker brown
triangle(290,140,490, 360, 450,150);
triangle(290,140,200, 500, 450,150);
triangle(290,140,450, 500, 450,150);
triangle(290,140,460, 500, 450,150);
triangle(290,140,490, 500, 450,150);
triangle(290,140,150, 700, 450,150);//left bottom
triangle(10-100,200,290, 140, 300,300);
triangle(10-100,400,290, 140, 300,350);
fill(#3B1C03);
triangle(10-300,700,290, 130, 300,360);
fill(#3B1C03);
triangle(290,140,460, 300, 450,450); //brown over right


//face
smooth();
noStroke();
fill(#F2DBD2);
//ellipse (350, 250, 185, 250);//face
ellipse (350, 238, 195, 220);//face
ellipse (350, 270, 170, 200);//face

ellipse (250, 250, 20, 60);//left ear
ellipse (450, 250, 20, 60);//right ear
fill(#15094D, 100);//brows
rect(275,210, 70,3);
rect(355, 210, 70,3);

fill(#15094D, 30);//undereyes
rect(287,238, 48,5);
rect(365, 238, 48,5);

//hair
fill(#3B1C03);
triangle(290,130,465, 260, 420,140);
triangle(300,120,465, 300, 420,140);
triangle(280,125,240, 250, 350,130);
ellipse (350, 140, 140, 38);


//eyes

fill(#000203);
triangle(298,232, 336,228, 274, 220); //left cat eye
triangle(405,232, 364,228, 427, 220); //right cat eye

fill(#3B1C03);
ellipse(310,230, 50, 10); //left brown ellipse
ellipse(390,230, 50, 10); //right brown ellipse

fill(#FAFEFF); //white eyes
ellipse(310,235, 40, 13);
ellipse(390,235, 40, 13);

fill(#3B1C03);//pupils
ellipse(390,234, 20, 18);
ellipse(310,234, 20, 18);

fill(#000203); //pupils black
ellipse(390,235, 10, 10);
ellipse(310,235, 10, 10);

//mouth
fill(#9D1636);
triangle (320,330, 355, 330, 348, 320);
triangle (380, 330, 345, 330, 352, 320);

triangle (350,340, 320,330, 380,330);
triangle (350, 325, 389, 320, 380, 330);
stroke(#8B072F, 50);
line(381, 327, 395, 312);

noStroke();
//nose
fill(#E3DCE8); //light purple long
ellipse(350, 270, 10, 60);
fill(#AC98B9, 30); //opaque purple cirlce bottom of nose
ellipse(350, 289, 30, 20);

ellipse(340, 294, 10, 5); //lil nose circles
ellipse(360, 294, 10, 5);

fill(#EDC2CF, 80); //cheecks
ellipse (305,270, 70, 30);
ellipse (395,270, 70, 30);

//nosepierce
stroke(#B9B51A);
fill(#D8D330);
ellipse(340, 288, 3, 3);

noStroke();
fill(#FF5261); //coral shirt
ellipse (350, 500, 270, 200);


noStroke(); //collar
fill(#F2DBD2);
ellipse(350, 416, 140, 32);
fill(#F2DBD2, 240);
rect(317,350, 65, 70); //neck

fill(#DBAB0B);//earrings
ellipse(250, 300, 20, 20); 
ellipse (450, 300, 20, 20);

ellipse(250, 320, 20, 20); 
ellipse (450, 320, 20, 20);

ellipse(250, 340, 20, 20); 
ellipse (450, 340, 20, 20);

ellipse(250, 360, 20, 20); 
ellipse (450, 360, 20, 20);
///
fill(#362A13);

ellipse(250, 300, 15, 15); 
ellipse (450, 300, 15, 15);

ellipse(250, 320, 15, 15); 
ellipse (450, 320, 15, 15);

ellipse(250, 340, 15, 15); 
ellipse (450, 340, 15, 15);

ellipse(250, 360, 15, 15); 
ellipse (450, 360, 15, 15);

