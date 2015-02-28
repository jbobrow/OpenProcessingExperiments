
size(400, 400);
background(255, 255, 255);
smooth();


//Colored boxes

//red box (small)
fill(230, 63, 46);
noStroke();
rectMode(CORNER);
rect(369.5, 309, 23.5, 91);

//blue box
fill(23, 43, 162);
rect(249, 309, 121, 68);

//yellow box (big)
fill(247, 213, 107);
rect(242, 9.5, 135, 141.5);

//yellow box (small)
rect(0, 301, 47, 99);

//black boxes (big)
fill(0, 0, 0);
rect(47, 259, 94, 50);

//black boxes (small)
rect(148, 350, 94, 27);


//horizontal lines (from top to bottom)

stroke(0, 0, 0);
strokeCap(SQUARE);

strokeWeight(9.5);
line(0, 4.75, width, 4.75);

strokeWeight(7.5);
line(7, 57.2-3.75, 370, 57.2-3.75);

strokeWeight(7.5);
line(7, 158.5-3.75, 370, 158.5-3.75);

strokeWeight(8);
line(40, 255, 376, 255);

strokeWeight(8);
line(5, 305, width, 305);

strokeWeight(7);
line(141, 384-3.5, 376, 384-3.5);


//vertical lines (from right to left)

strokeWeight(8);
line(396, 0, 396, height); 

strokeWeight(7.5);
line(369.5+3.75, 20, 369.5+3.75, 395);

strokeWeight(7.5);
line(305.5+3.75, 151, 305.5+3.75, 258);

strokeWeight(7.5);
line(242+3.75, 13.5, 242+3.75, 383);

strokeWeight(7);
line(141+3.5, 251, 141+3.5, 395);

strokeWeight(7);
line(90.5+3.5, 17, 90.5+3.5, 56);

strokeWeight(7.5);
line(39.5+3.75, 50, 39.5+3.75, 389.5);


//red box (big)
fill(230, 63, 46);
noStroke();
rectMode(CORNER);
rect(47, 57, 195, 195);

