
size(250,250);
background(#4D3731);

smooth();
stroke(#ACED78);
strokeWeight(2);
line(0,170,10,150);
line(10,150,20,160);
line(20,160,20,120);
line(20,120,30,140);
line(30,140,50,100);
line(50,100,60,120);
line(60,120,50,140);
line(50,140,70,130);
line(70,130,60,100);
line(60,100,90,125);
line(90,125,0,210);

line(250,170,240,150);
line(240,150,230,160);
line(230,160,230,120);
line(230,120,220,140);
line(220,140,200,100);
line(200,100,190,120);
line(190,120,200,140);
line(200,140,180,130);
line(180,130,190,100);
line(190,100,160,125);
line(160,125,250,210);

fill(#ACED78,200);
//white fill, with transparency
//0 totally transparent, 255 all opaque
stroke(#F8FF36);
strokeWeight(0.75);
rect(100,70,50,30);
rect(100,100,50,50);
rect(70,100,30,50);
rect(150,100,30,50);
rect(100,150,50,30);

fill(#63BCBB,160);
//white fill, with transparency
//0 totally transparent, 255 all opaque
stroke(#F8FF36);
strokeWeight(1);
quad(100,70,70,100,100,125,125,100);
quad(150,70,125,100,150,125,180,100);
quad(100,125,70,150,100,180,125,150);
quad(150,125,125,150,150,180,180,150);
quad(125,100,100,125,125,150,150,125);

fill(#ACED78,100);
//white fill, with transparency
//0 totally transparent, 255 all opaque
stroke(#F8FF36);
strokeWeight(1);
rect(100,100,50,50);

fill(#63BCBB,200);
//white fill, with transparency
//0 totally transparent, 255 all opaque
stroke(#F8FF36);
strokeWeight(1);
rect(120,120,10,10);
//rectangle on top

fill(#ACED78,100);
rect(70,150,30,30);
rect(60,160,30,30);
triangle(80,170,50,170,80,200);
triangle(40,180,70,180,70,210);

rect(150,150,30,30);
rect(160,160,30,30);
triangle(170,170,200,170,170,200);
triangle(180,180,210,180,180,210);

triangle(125,190,100,200,150,200);
triangle(100,200,150,200,125,230);
triangle(100,180,150,180,125,210);
triangle(125,190,150,220,100,220);

