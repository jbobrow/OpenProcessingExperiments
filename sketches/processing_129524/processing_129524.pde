
//background
size(400,600);
noStroke();
fill(238,232,170);
rect(0,0,400,800);
//lightsaber body
noStroke();
fill(192,192,192);
rect(160,200,80,375);
//beam
stroke(255,0,0);
strokeWeight(40);
line(200,180,200,0);
stroke(255,255,255,100);
strokeWeight(20);
line(200,180,200,0);
strokeWeight(3);
line(203,180,203,0);
//top triangle part
noStroke();
fill(0,0,0);
triangle(160,200,240,200,240,140);
//top black rectangle
rect(160,200,80,30);
//middle black rectangle
rect(160,300,80,80);
//bottom left rectangle
rect(153,420,18,155);
//bottom middle rectangle
rect(193,420,18,155);
//bottom right triangle
rect(231,420,18,155);
//middle silver rectangle
fill(192,192,192);
rect(130,303,30,74);
//black line on middle silver rectangle
fill(0,0,0);
rect(130,303,8,74);
//random thing on top right
fill(192,192,192);
ellipse(240,200,4,25);
//small rectangle on top right
rect(240,200,7,8);
//small ellipse on small rectangle on top right
ellipse(247,204,4,14);
//bottom rectangle details
stroke(50,50,50,200);
strokeWeight(4);
line(162,423,162,570);
line(202,423,202,570);
line(240,423,240,570);
//other small black rectangle on top right
noStroke();
fill(0,0,0);
rect(230,230,10,40);
