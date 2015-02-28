
size(250,250);
background(50);
smooth();
strokeWeight(0.001);
fill(85,40);
// white fill, with transparency
// 0 totally transparent, 255 all opaque
rect(10,0,10,250);
rect(30,0,10,250);
rect(50,0,10,250);
rect(70,0,10,250);
rect(90,0,10,250);
rect(110,0,10,250);
rect(130,0,10,250);
rect(150,0,10,250);
rect(170,0,10,250);
rect(190,0,10,250);
rect(210,0,10,250);
rect(230,0,10,250);
rect(250,0,10,250);
//rectangular grey bars from top to bottom

smooth();
fill(150,50,50);
ellipse(140,110,80,80);
//red center circle

smooth();
strokeWeight(0.01);
fill(120,100);
// white fill, with transparency
// 0 totally transparent, 255 all opaque
quad(0,160,0,200,70,170,50,160);
triangle(80,150,50,160,70,170);
triangle(80,150,50,160,70,170);
quad(50,130,30,160,50,160,80,150);
quad(100,10,90,40,110,60,120,30);
triangle(120,30,110,60,140,30);
triangle(120,30,110,60,140,30);
triangle(140,30,110,60,140,120);
quad(140,60,140,100,180,140,180,65);
line(180,65,140,100);
quad(110,170,180,140,170,180,170,210);
quad(70,170,90,190,120,150,80,150);
quad(140,210,140,190,170,210,180,230);
quad(140,210,140,190,170,210,180,230);
triangle(50,130,90,100,80,150);
triangle(50,130,90,100,80,150);
quad(80,80,90,100,100,110,110,60);
triangle(110,60,100,110,140,120);
triangle(110,60,100,110,140,120);
triangle(180,140,170,180,210,130);
triangle(180,140,170,180,210,130);
quad(210,130,170,180,250,140,250,65);
quad(180,140,210,130,220,120,180,90);
quad(90,100,80,150,120,150,110,90);
quad(80,180,135,120,140,120,170,180);
triangle(140,160,180,145,180,90);
triangle(30,160,0,200,50,178);
quad(250,140,220,110,210,130,250,100);
//grey transparent quads and triangles on top of large circle and background

fill(150,50,50);
triangle(140,60,130,110,180,90);
triangle(120,180,140,180,115,120);
//red triangles

fill(75,250);
// white fill, with transparency
// 0 totally transparent, 255 all opaque
ellipse(140,110,30,30);
//grey circle on top of large red circle

fill(150,50,50);
ellipse(140,110,10,10);
//small red circle

save("asymmetrical.jpg");


