
//Miro #13 by Juan Pablo Patiño

size(251,315);
background(246,247,229);

smooth();
strokeWeight(2);
//upper left-hand corner star, CW
line(0,35,5,0);
line(0,35,30,15);
line(0,35,35,40);
line(0,30,25,65);

//upper right-hand corner star, CW
line(206,0,203,33);
line(218,6,192,27);
line(189,18,223,15);
line(193,5,219,28);

//mid-level right-hand corner star, CW
line(199,75,200,135);
line(172,130,235,75);
line(175,104,230,107);
line(177,87,230,135);

//Curves: left-hand side
noFill();
beginShape();
curveVertex(100,0); //C1
curveVertex(111,0); //V1
curveVertex(90,65); //V2
curveVertex(60,100); //V3
curveVertex(0,122); //V4
curveVertex(0,105); //C2
endShape();

//Curves: the BIG one
beginShape();
curveVertex(140,0); //C1
curveVertex(140,0); //V1
curveVertex(142,40); //V2
curveVertex(145,100); //V3
curveVertex(149,160); //V4
curveVertex(156,200); //V5
curveVertex(158,260); //V6
curveVertex(60,280); //V7
curveVertex(10,282); //V8
curveVertex(0,284); //V9
curveVertex(0,290); //C2
endShape();

//Ellipses, Black only

fill(0);
ellipse(61,25,30,22);
ellipse(17,84,16,13);
ellipse(167,143,18,17);
ellipse(170,183,15,16);
ellipse(238,196,18,18);
ellipse(234,265,35,35);
ellipse(194,222,27,25);
ellipse(188,270,25,20);

//Lines
line(17,84,167,143);
line(0,115,170,183);

line(194,222,188,270);

//BlackBox
beginShape();
vertex(60,100);
vertex(10,120);
vertex(150,175);
vertex(145,133);
endShape(CLOSE);

//Black Ellipses with Red Halves CW from top left
ellipse(90,65,23,20); //E1
ellipse(142,40,20,17); //E2
ellipse(158,210,24,22); //E3
ellipse(160,257,17,17); //E4
ellipse(96,276,18,17); //E5
ellipse(58,279,18,17); //E6
ellipse(9,281,18,17); //E7

//Red Halves
fill(255,0,0);
strokeWeight(1);
//E1 ellipse(90,65,23,20);
beginShape();
curveVertex(135,59);
curveVertex(94,54);
curveVertex(80,60);
curveVertex(85,75);
curveVertex(125,81);
endShape(CLOSE);

//E2 ellipse(142,40,20,17);
beginShape();
curveVertex(175,28);
curveVertex(142,31);
curveVertex(133,40);
curveVertex(142,50);
curveVertex(175,50);
endShape(CLOSE);

//E3 ellipse(158,210,24,22);
beginShape();
curveVertex(115,198);
curveVertex(156,198);
curveVertex(171,209);
curveVertex(160,223);
curveVertex(135,225);
endShape(CLOSE);

//E4 ellipse(160,257,17,17);
beginShape();
curveVertex(175,275);
curveVertex(165,249);
curveVertex(153,255);
curveVertex(154,265);
curveVertex(153,270);
endShape(CLOSE);

//E5 ellipse(158,210,24,22);
beginShape();
curveVertex(106,300);
curveVertex(106,274);
curveVertex(97,267);
curveVertex(87,277);
curveVertex(87,300);
endShape(CLOSE);

//E6 ellipse(58,279,18,17);
beginShape();
curveVertex(66,250);
curveVertex(68,278);
curveVertex(60,289);
curveVertex(48,282);
curveVertex(26,248);
endShape(CLOSE);

//E7 ellipse(9,281,18,17);
beginShape();
curveVertex(19,250);
curveVertex(19,280);
curveVertex(10,291);
curveVertex(0,280);
curveVertex(0,225);
endShape(CLOSE);

//Miro's Signature
noFill();
strokeWeight(1);
beginShape();
curveVertex(106,303);
curveVertex(107,301);
curveVertex(108,293);
curveVertex(112,300);
curveVertex(115,294);
curveVertex(117,299);
curveVertex(121,302);
curveVertex(122,296);
curveVertex(127,301);
curveVertex(127,295);
curveVertex(132,296);
curveVertex(133,301);
curveVertex(139,296);
curveVertex(140,301);
curveVertex(143,298);
curveVertex(140,295);
curveVertex(136,295);
endShape();
point(123,290);
line(142,290,146,285);

println("tile #13");
println("Ciphers and Constellations, in Love with a Woman. 1941. Gouache and terpentine on paper. Art Institute of Chicago, Chicago, IL, USA.");



