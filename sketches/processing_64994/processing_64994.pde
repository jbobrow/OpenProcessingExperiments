
//Laure Joumier
//DESMA28 Interactivity
//Workshop#2
//Artist: El Lissitzky 'Proun, Street Decoration Design"

size(640,360);
background(234,231,204);

strokeWeight(0.25);
strokeCap(SQUARE);
stroke(224,224,224);
smooth();

fill(198,195,178);
beginShape(); //grey rectangle behind big blue rectangle
vertex(590,100); //top right
vertex(380,165);
vertex(468,213);
vertex(650,152);
endShape(CLOSE);

fill(52,51,45);
beginShape(); //dark grey side of grey rectangle behing big blue rectangle
vertex(468,213); //bottom right
vertex(469,228);
vertex(422,189);
vertex(432,184);
endShape(CLOSE);

fill(247,243,117);
beginShape(); //light grey/yellow side of grey rectangle behing big blue rectangle
vertex(468,213); //top left
vertex(469,228);
vertex(645,168);
vertex(645,154);
endShape(CLOSE);

fill(132,188,242);
beginShape(); //big blue rectagle
vertex(147,0);
vertex(159,59);
vertex(346,209);
vertex(563,153);
vertex(530,0);
endShape(CLOSE);

fill(0);
quad(390,66,393,79,640,12,640,0); //black line

fill(255,33,33);
beginShape(); //red rectangle behing black circle
vertex(0,102); //top left
vertex(320,15);
vertex(343,106);
vertex(0,202);
endShape(CLOSE);

fill(255,33,33);
beginShape(); //mini rectangle, barely visible
vertex(320,15); //intersection point with red rectangle
vertex(317,0);
vertex(377,0);
endShape(CLOSE);

fill(18,21,67);
beginShape(); //dark blue rectangle
vertex(151,22); //top right
vertex(159,59);
vertex(31,94);
vertex(22,55);
endShape(CLOSE);

fill(0);
ellipse(230,245,250,250); //the black circle

fill(255,33,33);
beginShape();//red on black circle shape
vertex(163,165); //top left
vertex(92,360);
vertex(110,360);
vertex(180,173);
endShape(CLOSE);

fill(255,255,240);
beginShape();//left shape to the upper red on black circle shape
vertex(180,173);//top left
vertex(216,159);
vertex(142,360);
vertex(110,360);
endShape(CLOSE);

fill(255,255,240);
beginShape(); //shape on top of red shape on black circle
vertex(199,150); //top left
vertex(216,159);
vertex(180,173);
vertex(163,165);
endShape(CLOSE);

fill(198,198,198);
beginShape(); //grey shape
vertex(54,298); //top left
vertex(286,242);
vertex(292,268);
vertex(60,326);
endShape(CLOSE);

fill(255,250,90);
beginShape(); //the yellow shape
vertex(228,221); //top right
vertex(245,293);
vertex(211,302);
vertex(204,262);
vertex(91,289);
vertex(84,256);
endShape(CLOSE);

fill(247,245,225);
quad(640,28,228,136,231,148,640,41); //second grey 'line'
fill(255,33,33);
quad(232,148,640,41,640,47,233,153); //red 'under' second grey 'line'

fill(247,245,225);
quad(640,113,582,131,587,134,640,118); //third grey line
fill(255,33,33);
quad(587,134,640,118,640,123,587,139); //red 'under' third grey 'line'
fill(247,245,225);
quad(587,139,587,134,582,131,582,136); //'face' of third grey 'line'

fill(80,80,60);
triangle(583,189,528,208,596,265); //triangle under grey shpae behing big blue rectangle
fill(255,254,242);
quad(583,189,596,265,603,260,590,186);//face of upper triangle

