
//Assignment #1
//Name: Jessica Tan
//E-mail: jtan@brynmawr.edu
//Date: 9/6/10

size(520,520);
background(17,5,85);
smooth();

//outer octagon
fill(38,142,23);
stroke(5,52,4);
beginShape();
vertex(240,200);
vertex(280,200);
vertex(320,240);
vertex(320,280);
vertex(280,320);
vertex(240,320);
vertex(200,280);
vertex(200,240);
endShape(CLOSE);

//inner octagon
fill(18,203,63,100);
beginShape();
vertex(250,240);
vertex(270,240);
vertex(280,250);
vertex(280,270);
vertex(270,280);
vertex(250,280);
vertex(240,270);
vertex(240,250);
endShape(CLOSE);

//octagon lines
line(240,200,250,240);
line(280,200,270,240);
line(320,240,280,250);
line(320,280,280,270);
line(280,320,270,280);
line(240,320,250,280);
line(200,280,240,270);
line(200,240,240,250);

//outer diamond, north
fill(190,227,226);
stroke(11,90,89);
quad(260,60,300,120,260,160,220,120);
//inner diamond, north
quad(260,60,280,120,260,160,240,120);
//diamond lines, north
line(260,60,260,160);
line(300,120,220,120);

//outer diamond, east
fill(111,11,23);
stroke(70,8,20);
quad(460,260,400,300,360,260,400,220);
//inner diamond, east
quad(460,260,400,280,360,260,400,240);
//diamond lines, east
line(460,260,360,260);
line(400,220,400,300);

//outer diamond, south
fill(190,227,226);
stroke(11,90,89);
quad(260,460,300,400,260,360,220,400);
//inner diamond, south
quad(260,460,280,400,260,360,240,400);
//diamond lines, south
line(260,460,260,360);
line(300,400,220,400);

//outer diamond, west
fill(111,11,23);
stroke(70,8,20);
quad(60,260,120,220,160,260,120,300);
//inner diamond, west
quad(60,260,120,240,160,260,120,280);
//diamond lines, west
line(60,260,160,260);
line(120,300,120,220);


//outer triangle, northeast
fill(115,29,178);
stroke(59,8,70);
triangle(300,180,360,160,340,220);
//inner triangle, northeast
fill(178,110,222,100);
triangle(320,190,340,180,330,200);
//triangle lines, northeast
line(300,180,320,190);
line(360,160,340,180);
line(340,220,330,200);

//outer triangle, southeast
fill(229,225,104);
stroke(140,149,38);
triangle(360,360,340,300,300,340);
//inner triangle, southeast
fill(252,248,156,100);
triangle(340,340,320,330,330,320);
//triangle lines, southeast
line(360,360,340,340);
line(300,340,320,330);
line(340,300,330,320);

//outer triangle, southwest
fill(115,29,178);
stroke(59,8,70);
triangle(160,360,220,340,180,300);
//inner triangle, southwest
fill(178,110,222,100);
triangle(180,340,200,330,190,320);
//triangle lines, southwest
line(160,360,180,340);
line(220,340,200,330);
line(180,300,190,320);

//outer triangle, northwest
fill(229,225,104);
stroke(140,149,38);
triangle(160,160,180,220,220,180);
//inner triangle, northwest
fill(252,248,156,100);
triangle(180,180,190,200,200,190);
//triangle lines, northwest
line(160,160,180,180);
line(180,220,190,200);
line(220,180,200,190);


//circle, north
fill(240,238,201);
ellipse(260,30,30,30);
//circle, east
ellipse(490,260,30,30);
//circle, south
ellipse(260,490,30,30);
//circle, west
ellipse(30,260,30,30);

