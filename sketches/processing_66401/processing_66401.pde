
size(200,196);
background(255,245,225);
smooth();
noFill();
//stars 
strokeCap(ROUND);
line(70,40,70,80);
line(56,64,87,63);
line(91,43,53,75);
line(58,51,93,80);

line(147,0,142,31);
line(156,8,130,28);
line(132,13,162,18);
line(140,4,155,32);

line(75,0,72,17);
line(80,1,65,14);
line(68,0,82,15);
line(64,8,84,9);


//long lines
beginShape();
vertex(35,0);
bezierVertex(35,0,40,36,39,77);
bezierVertex(38,118,76,175,0,166);
endShape();

beginShape(); //swrill
vertex(180,62);;
bezierVertex(166,58,144,89,168,96);
bezierVertex(178,99,187,90,187,81);
bezierVertex(184,65,170,70,175,81);
endShape();


//lines
bezier(17,0,17,0,14,28,0,46);
bezier(0,62,0,62,38,78,48,78);
bezier(0,88,0,88,36,98,50,108);
bezier(165,0,165,0,168,19,200,25);
bezier(123,72,123,72,124,165,119,196);
line(123,123,104,120);
line(122,164,105,163);
line(70,141,67,165);

//dots
beginShape();
fill(0);
bezier(200,34,194,35,195,43,200,42);
endShape( );
beginShape();
bezier(200,57,195,57,194,64,200,65);
endShape();
beginShape();
fill(0);
bezier(200,57,195,57,194,64,200,65);
endShape();
//ellipse
fill(0);
ellipse(49, 78, 9.3, 9.2);
ellipse(55, 110, 9.3, 9.2);
ellipse(70,142,13,13);
ellipse(66,167,13,12);
ellipse(98,118,12.1,12);
ellipse(94,161,21.1,21);
ellipse(175,84,8.8,8.3 );

//2color
beginShape();
bezier(37,16,44,14,47,26,37,26);
endShape();
beginShape();
fill(255,0,0);
bezier(37,16,28,18,29,27,37,26);
endShape();
beginShape();
vertex(7,31);
bezierVertex(7,31,4,30,0,31);
bezierVertex(0,31,0,41,0,41);
bezierVertex(0,41,1,41.5,4,42);
endShape();
beginShape();
fill(0);
bezier(7,31,16,36,7,43,4,42);
endShape();

//rec
beginShape();
fill(0);
vertex(0,62);
bezierVertex(0,62,30,74,39,77);
bezierVertex(40,91,40,96,42,104);
bezierVertex(42,104,16,91,0,88);
endShape();

beginShape();
fill(0);
vertex(200,125);
bezierVertex(200,127,133,128,123,123);
bezierVertex(123,123,125,130,123,165);
bezierVertex(120,165,173,163,200,162);
endShape();



//two color dot2
beginShape();
fill(0);
bezier(43.5,120,32,123,37,134,46,132.3);
endShape();
beginShape();
fill(255,0,0);
bezier(43.5,120,57,116,54,131,46,132.3);
endShape();
beginShape();
fill(0);
vertex(47,150);
bezierVertex(54,154,48,164,41,158.6);
bezierVertex(41,158.6,46,155,47,150);
endShape();
beginShape();
fill(255,0,0);
vertex(41,158.6);
bezierVertex(41,158.6,46,155,47,150);
bezierVertex(46,148,33,152,41,158.6);
endShape();
beginShape();
bezier(14.8,166.8,14,160,5,157,3,166);
endShape();
beginShape();
fill(0);
bezier(14.8, 166.8, 16, 174, 4, 173, 3, 166);
endShape();

beginShape();
vertex(98,0);
bezierVertex(98,0,98,14,98,20);
bezierVertex(98,20,100,9,102,0);
endShape();
fill(255,0,0);
beginShape();
vertex(102,0);
bezierVertex(102,0,100,9,98,20);
bezierVertex(98,20,103,7,105,0);
endShape();
beginShape();
vertex(161,70);
bezierVertex(160,69,149,63,144,68);
bezierVertex(140,72,143,79,150,90);
bezierVertex(154,90,166,82,161,70);
endShape();


beginShape();
vertex(150,90);
fill(0);
bezierVertex(150,90,140,104,152,106);
bezierVertex(164,108,156,90,150,90);
endShape();

beginShape();
vertex(162.3,70.3);
bezierVertex(162.3,70.3,157,80,158.5,85);
bezierVertex(158.5,85,164,81,162.3,70.3);
endShape();

//largest dot
beginShape();
vertex(118,43);
bezierVertex(94,40,94,70,118,73);
bezierVertex(143,75,148,46,118,43);
endShape();


