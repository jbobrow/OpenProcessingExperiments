
//Code Section Coney Island Assignment One by Xiaofeng Lin

size(500,500);
background(244,245,238);

strokeWeight(0);


fill(215,222,214);//light grey
rect(0,0,110,50);
rect(0,185,50,200);
rect(185,320,135,130);
rect(480,0,20,385);

fill(213,42,25);//red
rect(50,50,270,270);
rect(480,385,20,115);

fill(246,212,108);//yellow
rect(320,0,160,185);
rect(0,385,50,115);

fill(29,19,18);//black
rect(50,320,135,130);
rect(185,442,135,39);

fill(13,32,170);//blue
rect(320,385,160,95);

strokeCap(SQUARE);
strokeWeight(7);
stroke(29,19,18);

//vertical lines
line(50,50,50,488);
line(110,7,110,50);
line(320,4,320,480);
line(480,9,480,494);
line(400,320-135,400,320);
line(320-135,320,320-135,494);

//horizontal lines
line(7,50,480,50);
line(320,4,320,480);
line(8,185,50,185);
line(320,185,480,185);
line(5,387,500,387);
line(50,320,480,320);
line(320-135,480,480,480);
