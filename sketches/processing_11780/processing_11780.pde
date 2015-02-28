
size(400, 400);
background(212, 227, 149);
smooth();

//organized by color
//gray stripe across background
fill(194, 198, 174);
stroke(194, 198, 174);
rect(0, 220, 400, 70);

//cylindrical shape in the back
fill(223);
stroke(194, 198, 174);
rect(145, 195, 108, 55);
ellipse(200, 195, 108, 15);

//shading on the cylindrical shape
fill(165);
stroke(165);
rect(200, 200, 53, 49);
ellipse(227, 197, 53, 13);

//shadow on grey stripes from bottles and cylinder
fill(85);
ellipse(260, 270, 110, 35);

//white bottles
fill(235);
stroke(210);
rect(135, 235, 35, 55);
rect(215, 235, 35, 55);
rect(140, 225, 25, 10);
rect(220, 225, 25, 10);
rect(147, 200, 12, 25);
rect(227, 200, 12, 25);
ellipse(153, 200, 22, 7);
ellipse(233, 200, 22, 7);

//black bottle
fill(65);
stroke(80);
rect(175, 235, 35, 55);
rect(180, 225, 25, 10);
rect(186, 200, 12, 25);
ellipse(192, 200, 22, 7);

