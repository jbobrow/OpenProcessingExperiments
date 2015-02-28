
size(300,331);
background(255);
smooth();

noStroke();
fill(255,0,0); //RED
rect(0,0,18,69); // big
rect(259,148,27,27); // medium
rect(0,175,17,17); // small

fill(0,0,255); //BLUE
rect(86,0,40,29); // big
rect(259,318,width,height); // small

fill(255,255,0); //YELLOW
rect(86,116,40,75);

stroke(0);
strokeCap(SQUARE);
strokeWeight(9);
line(0,28,288,28); //horizontal 01
line(17,113,288,113); //horizontal 02
line(0,192,width,192); //horizontal 03
line(89,314,width,314); //horizontal 05

strokeWeight(8);
line(202,249,width,249); //horizontal 04
line(88,0,88,height); //vertical 02
line(255,0,255,height); //vertical 07

strokeWeight(7);
line(128,0,128,192); //vertical 03
line(203,0,203,height); //vertical 04
line(230,0,230,315); //vertical 06


strokeWeight(6);
line(18,0,18,192); //vertical 01
line(214,0,214,height); //vertical 05
line(288,0,288,195); //vertical 08

