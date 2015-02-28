
size(600,600);
background(230,224,202);
smooth();

//top-right lines
stroke(0);
line(315,125,  370,40);
line(370,40,  440,25);

//darkblue rectangle
noStroke();
fill(25,25,50);
quad(315,125,  450,90,  460,130,  325,160);

//lightblue rectangle
noStroke();
fill(125,175,200);
quad(428,0,  600,0,  600,100,  457,130);

//red rectangle
noStroke();
fill(255,0,0);
quad(12,237,  600,90,  600,180,  34,323);

//blackcircle
fill(0);
ellipse(530,290,  250,250);

//magenta under rectangle
noStroke();
fill(195,15,0);
quad(530,203,  600,190,  600,195,  533,212);


//grey rectangle
noStroke();
fill(200,200,200);
quad(527,196,  600,178,  600,190,  530,208);

//topClear
noStroke();
fill(230,224,202);
quad(464,222,  499,208,  514,217,  478,230);

//rightClear
stroke(125);
fill(230,224,202);
quad(514,217,  478,230,  357,534,  398,515);


//red
noStroke();
fill(255,0,0);
quad(340,527,  464,222,  478,230,  357,534);

//greybox 2
noStroke();
fill(200,200,200);
quad(356,347,  588,294,  594,319,  360,372);
                  
//yellowshape
noStroke();
fill(233,195,100);
beginShape();
vertex(385, 309);
vertex(530, 273);
vertex(545, 339);
vertex(512, 347);
vertex(504, 314);
vertex(392, 340);
endShape();

//bottom
noStroke();
fill(215,180,125);
quad(0,589,  600,591,  600,600,  0,600);

