
void setup(){

  size(600,600);

  background(0);

  

}




void draw(){

//desk

println(mouseX + " : " + mouseY);







//background




fill(255,255,255);

noStroke();

smooth();

quad(15,4,537,64,592,532,77,580);










//arc




noFill();

stroke(0);

strokeWeight(1);

arc(60, 57, 40, 40, radians(220), radians(360));




noFill();

stroke(0);

strokeWeight(1);

arc(97, 70, 40, 40, radians(220), radians(360));




noFill();

stroke(0);

strokeWeight(1);

arc(139, 87, 50, 50, radians(220), radians(360));

 

noFill();

stroke(0);

strokeWeight(1);

arc(195, 110, 80, 80, radians(220), radians(360));

 

 

noFill();

stroke(0);

strokeWeight(1);

arc(255, 130, 59, 59, radians(220), radians(360));

 

noFill();

stroke(0);

strokeWeight(1);

arc(305, 145, 50, 50, radians(220), radians(360));




noFill();

stroke(0);

strokeWeight(1);

arc(340, 151, 20, 20, radians(220), radians(360));







//triangle




stroke(0);

fill(255,134,55);

triangle(249,223,308,165,344,215);




stroke(0);

fill(22,183,225);

triangle(243,185,275,164,288,209);




noStroke();

fill(0,0,0);

triangle(56,354,459,122,450,142);




stroke(0);

fill(255,4,19);

triangle(68,224,46,199,87,209);










noStroke();

fill(255,184,44);

triangle(168,116,146,230,204,244);




//shape

noStroke();

fill(255,4,19);

beginShape();

vertex(255,424);

vertex(361,434);

vertex(332,381);

vertex(250,405);




endShape();







noStroke();

fill(0,0,0);

beginShape();

vertex(226,319);

vertex(261,254);

vertex(263,292);

vertex(275,272);

vertex(281,300);

vertex(289,287);

vertex(297,309);

vertex(234,347);




endShape();




noStroke();

fill(255,4,19);

beginShape();

vertex(332,381);

vertex(250,405);

vertex(234,347);

vertex(262,291);

vertex(265,314);

vertex(276,298);

vertex(282,318);

vertex(296,307);




endShape();




noStroke();

fill(192,164,143);

beginShape();

vertex(332,381);

vertex(250,405);

 vertex(240,374);

vertex(310,335);




endShape();




noStroke();

fill(192,164,143);

beginShape();

vertex(332,381);

vertex(369,371);

vertex(387,425);

vertex(361,435);




endShape();




noStroke();

fill(255,4,19);

triangle(361,435,387,425,391,436);




noStroke();

fill(192,164,143);

beginShape();

vertex(387,425);

vertex(391,436);

vertex(427,437);

vertex(423,410);

endShape();




 

noStroke();

fill(0,0,0);

beginShape();

vertex(259,313);

vertex(440,358);

vertex(443,366);

vertex(260,322);

endShape();










//ellipse

fill(255,184,44);

stroke(0);

strokeWeight(8);

ellipse(380,280,125,125);




fill(0,0,0);

noStroke();

ellipse(480,200,30,30);




fill(0,0,0);

noStroke();

ellipse(520,125,60,60);

fill(0,0,0);

noStroke();

ellipse(180,355,80,80);




fill(255,184,44);

stroke(0);

strokeWeight(1);

ellipse(300,430,20,20);







fill(84,125,205);

stroke(0);

strokeWeight(1);

ellipse(233,350,20,20);
















//line




stroke(0);

strokeWeight(1.2);

line(55,482,273,362);

line(70,530,277,380);

line(107,577,275,400);




stroke(0);

strokeWeight(1.2);

line(295,566,167,113);

line(77,580,167,113);

stroke(0);

strokeWeight(1.2);

line(438,391,536,330);

line(440,394,538,340);

line(441,398,549,345);

line(443,400,560,353);

line(445,403,554,364);

line(521,516,425,352);

line(550,474,440,330);

line(553,375,510,328);

line(551,377,508,330);

line(549,379,506,332);

line(430,429,563,390);

line(432,435,564,407);

line(434,441,567,421);

line(445,450,581,437);

line(564,449,517,396);

line(566,447,519,394);

line(568,445,521,392);

line(504,346,531,377);

line(502,348,529,379);







line(151,327,84,258);

line(151,327,93,230);

line(74,233,46,199);

line(46,199,99,212);

line(60,229,93,203);
















strokeWeight(2);

line(513,372,539,403);




strokeWeight(0.3);

line(38,40,356,151);




strokeWeight(2);

line(229,187,344,57);




strokeWeight(1);

line(469,385,343,214);

line(343,214,322,409);




strokeWeight(1);

line(78,281,119,240);

line(80,283,121,242);

line(82,285,123,244);

line(84,287,125,246);

line(86,289,127,248);

line(70,262,99,287);

line(68,264,97,289);













//left shape







stroke(0);

strokeWeight(1);

fill(208,55,39);

beginShape();

vertex(111,417);

vertex(120,480);

vertex(125,415);

vertex(153,430);

vertex(130,382);

vertex(176,361);

vertex(122,357);

endShape();




stroke(0);

fill(84,125,205);

triangle(111,417,122,357,98,357);




 










}
