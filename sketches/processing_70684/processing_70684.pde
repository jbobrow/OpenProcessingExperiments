
size(300,300);
background(58,47,44);//Mondrian Bloack
noStroke();
smooth();//does nothing, rects are all pixel perfect.

//XXX
float xA = 64, xB = 72, xC = 274, xD = 282;
//YYY
float yA = 90, yB = 102, yC =  218, yD = 226, yE = 261, yF= 271;

fill(254,250,231);//Mondrian Cream

rect(0, 0, xA, yA);
rect(0, yB, xA, yC-yB);
rect(xB, yD, xC-xB, 9999);
rect(xD, yD, 9999, yE-yD);

fill(226,50,39);//Mondrian Red

rect (xB, 0, 9999, yC);

fill(39,137,188);//Mondrian Blue

rect(0, yD, xA, 9999);

fill(255,210,0);//Mondrian Yellow

rect(xD, yF, 9999,9999);
