
//Ji-Young Lee; jiyoung3;
//homework 2, tuesday 11:30
//Copyright to Jiyoung Lee
size(400,400);
smooth();
background(255);
float x,y,wd,ht;
x=50;
y=50;
wd=300;
ht=300;






noFill();
strokeWeight(0);
stroke(255,255,0);
rect(x,y,wd,ht);



strokeWeight(1);
stroke(255);
ellipse(x+wd*.5,y+ht*.5,wd,ht);

fill(247,241,192);
ellipse(x+wd*.5,y+ht*.5,wd,ht);


//eye
strokeWeight(18);
stroke(0,0,0);

point(x+(.72*wd),y+(.45*ht));
point(x+(.28*wd),y+(.45*ht));

//eyebrow

strokeWeight(5);
stroke(200,0,0);

point(x+(.61*wd),y+(.40*ht));
point(x+(.72*wd),y+(.38*ht));
point(x+(.83*wd),y+(.40*ht));


point(x+(.17*wd),y+(.40*ht));
point(x+(.28*wd),y+(.38*ht));
point(x+(.39*wd),y+(.40*ht));

strokeWeight(0);
stroke(200,0,0);
//hair
point(x+(.70*wd),y+(.19*ht));
point(x+(.70*wd),y+(.20*ht));
point(x+(.80*wd),y+(.30*ht));
point(x+(.95*wd),y+(.40*ht));
point(x+(.90*wd),y+(.37*ht));
point(x+(.96*wd),y+(.28*ht));
point(x+(1.0*wd),y+(.42*ht));
point(x+(.99*wd),y+(.42*ht));
point(x+(.99*wd),y+(.40*ht));
point(x+(.90*wd),y+(.20*ht));
point(x+(.80*wd),y+(.10*ht));
point(x+(.70*wd),y+(.05*ht));
point(x+(.60*wd),y+(.025*ht));
point(x+(.50*wd),y+(.0125*ht));
point(x+(.60*wd),y+(.15*ht));
point(x+(.70*wd),y+(.05*ht));
point(x+(.60*wd),y+(.025*ht));
point(x+(.50*wd),y+(.0125*ht));
point(x+(.40*wd),y+(.025*ht));
point(x+(.30*wd),y+(.05*ht));
point(x+(.20*wd),y+(.1*ht));
point(x+(.10*wd),y+(.19*ht));
point(x+(.05*wd),y+(.26*ht));
point(x+(.025*wd),y+(.37*ht));
point(x+(.0*wd),y+(.5*ht));
point(x+(.60*wd),y+(.25*ht));
point(x+(.50*wd),y+(.30*ht));
point(x+(.40*wd),y+(.35*ht));
point(x+(.30*wd),y+(.40*ht));
point(x+(.20*wd),y+(.45*ht));
point(x+(.10*wd),y+(.47*ht));
point(x+(.05*wd),y+(.47*ht));

stroke(183,181,144);
strokeWeight(3);
fill(183,181,144);
beginShape();
curveVertex(x+(.70*wd),y+(.19*ht));
curveVertex(x+(.70*wd),y+(.20*ht));
curveVertex(x+(.80*wd),y+(.30*ht));
curveVertex(x+(.95*wd),y+(.40*ht));
curveVertex(x+(.90*wd),y+(.37*ht));
curveVertex(x+(.99*wd),y+(.42*ht));
curveVertex(x+(1.0*wd),y+(.42*ht));
curveVertex(x+(.99*wd),y+(.40*ht));
curveVertex(x+(.96*wd),y+(.28*ht));
curveVertex(x+(.90*wd),y+(.20*ht));
curveVertex(x+(.80*wd),y+(.10*ht));
curveVertex(x+(.70*wd),y+(.05*ht));
curveVertex(x+(.60*wd),y+(.015*ht));
curveVertex(x+(.50*wd),y+(.0125*ht));
curveVertex(x+(.60*wd),y+(.15*ht));
curveVertex(x+(.70*wd),y+(.19*ht));
curveVertex(x+(.70*wd),y+(.20*ht));


endShape();


stroke(183,181,144);
strokeWeight(3);
fill(183,181,144);
beginShape();


curveVertex(x+(.70*wd),y+(.051*ht));
curveVertex(x+(.70*wd),y+(.05*ht));
curveVertex(x+(.60*wd),y+(.025*ht));
curveVertex(x+(.50*wd),y+(.005*ht));
curveVertex(x+(.40*wd),y+(.005*ht));
curveVertex(x+(.30*wd),y+(.05*ht));
curveVertex(x+(.20*wd),y+(.1*ht));
curveVertex(x+(.10*wd),y+(.19*ht));
curveVertex(x+(.05*wd),y+(.26*ht));
curveVertex(x+(.025*wd),y+(.37*ht));
curveVertex(x+(.0*wd),y+(.5*ht));
curveVertex(x+(.0*wd),y+(.51*ht));

curveVertex(x+(.05*wd),y+(.47*ht));
curveVertex(x+(.10*wd),y+(.47*ht));
curveVertex(x+(.20*wd),y+(.45*ht));
curveVertex(x+(.30*wd),y+(.40*ht));
curveVertex(x+(.40*wd),y+(.35*ht));
curveVertex(x+(.50*wd),y+(.30*ht));
curveVertex(x+(.60*wd),y+(.25*ht));
curveVertex(x+(.70*wd),y+(.20*ht));
curveVertex(x+(.70*wd),y+(.19*ht));
curveVertex(x+(.70*wd),y+(.051*ht));

endShape();




beginShape();

//eyebrow
strokeWeight(5);
stroke(113,113,100);
noFill();

curveVertex(x+(.60*wd),y+(.40*ht));
curveVertex(x+(.61*wd),y+(.40*ht));
curveVertex(x+(.72*wd),y+(.38*ht));
curveVertex(x+(.83*wd),y+(.40*ht));
curveVertex(x+(.84*wd),y+(.40*ht));
endShape();

beginShape();
strokeWeight(5);
stroke(113,113,100);
curveVertex(x+(.16*wd),y+(.40*ht));
curveVertex(x+(.17*wd),y+(.40*ht));
curveVertex(x+(.28*wd),y+(.38*ht));
curveVertex(x+(.39*wd),y+(.40*ht));
curveVertex(x+(.4*wd),y+(.40*ht));
endShape();

//J
strokeWeight(0);
stroke(200,0,0);
noFill();

point(x+(.54*wd),y+(.47*ht));
point(x+(.54*wd),y+(.52*ht));
point(x+(.54*wd),y+(.57*ht));

point(x+(.54*wd),y+(.57*ht));
point(x+(.46*wd),y+(.57*ht));
point(x+(.50*wd),y+(.61*ht));

stroke(216,77,31);
strokeWeight(5);

beginShape();

vertex(x+(.54*wd),y+(.46*ht));
vertex(x+(.54*wd),y+(.47*ht));
vertex(x+(.54*wd),y+(.52*ht));
vertex(x+(.54*wd),y+(.53*ht));
endShape();


stroke(132,157,51);
strokeWeight(5);

beginShape();
vertex(x+(.54*wd),y+(.52*ht));
vertex(x+(.54*wd),y+(.53*ht));
vertex(x+(.54*wd),y+(.57*ht));
vertex(x+(.54*wd),y+(.5701*ht));
endShape();


stroke(240,77,180);
strokeWeight(5);

beginShape();

curveVertex(x+(.54*wd),y+(.57*ht));

curveVertex(x+(.54*wd),y+(.565*ht));
curveVertex(x+(.50*wd),y+(.61*ht));
curveVertex(x+(.46*wd),y+(.57*ht));

curveVertex(x+(.50*wd),y+(.61*ht));
endShape();


//mustaches
strokeWeight(0);
stroke(200,0,0);
point(x+(.50*wd),y+(.63*ht));
point(x+(.47*wd),y+(.61*ht));
point(x+(.43*wd),y+(.61*ht));
point(x+(.40*wd),y+(.63*ht));
point(x+(.37*wd),y+(.64*ht));
point(x+(.34*wd),y+(.64*ht));
point(x+(.31*wd),y+(.63*ht));
point(x+(.34*wd),y+(.67*ht));
point(x+(.37*wd),y+(.69*ht));
point(x+(.40*wd),y+(.69*ht));
point(x+(.43*wd),y+(.69*ht));
point(x+(.46*wd),y+(.68*ht));
point(x+(.50*wd),y+(.68*ht));
point(x+(.54*wd),y+(.68*ht));
point(x+(.57*wd),y+(.69*ht));
point(x+(.60*wd),y+(.69*ht));
point(x+(.63*wd),y+(.67*ht));

point(x+(.68*wd),y+(.63*ht));
point(x+(.65*wd),y+(.64*ht));
point(x+(.62*wd),y+(.64*ht));
point(x+(.59*wd),y+(.63*ht));
point(x+(.56*wd),y+(.61*ht));
point(x+(.53*wd),y+(.61*ht));
point(x+(.50*wd),y+(.63*ht));




stroke(108,108,108);
strokeWeight(2);
fill(131,131,131);
beginShape();

curveVertex(x+(.50*wd),y+(.64*ht));
curveVertex(x+(.50*wd),y+(.63*ht));
curveVertex(x+(.47*wd),y+(.61*ht));
curveVertex(x+(.43*wd),y+(.61*ht));
curveVertex(x+(.40*wd),y+(.63*ht));
curveVertex(x+(.37*wd),y+(.64*ht));
curveVertex(x+(.34*wd),y+(.64*ht));
curveVertex(x+(.31*wd),y+(.63*ht));
curveVertex(x+(.34*wd),y+(.67*ht));
curveVertex(x+(.37*wd),y+(.69*ht));
curveVertex(x+(.40*wd),y+(.69*ht));
curveVertex(x+(.43*wd),y+(.69*ht));
curveVertex(x+(.46*wd),y+(.68*ht));
curveVertex(x+(.50*wd),y+(.68*ht));
curveVertex(x+(.54*wd),y+(.68*ht));
curveVertex(x+(.57*wd),y+(.69*ht));
curveVertex(x+(.60*wd),y+(.69*ht));
curveVertex(x+(.63*wd),y+(.67*ht));

curveVertex(x+(.68*wd),y+(.63*ht));
curveVertex(x+(.65*wd),y+(.64*ht));
curveVertex(x+(.62*wd),y+(.64*ht));
curveVertex(x+(.59*wd),y+(.63*ht));
curveVertex(x+(.56*wd),y+(.61*ht));
curveVertex(x+(.53*wd),y+(.61*ht));
curveVertex(x+(.50*wd),y+(.63*ht));
endShape();

//mouth

stroke(0,0,0);
strokeWeight(0);
point(x+(.43*wd),y+(.695*ht));
point(x+(.45*wd),y+(.70*ht));
point(x+(.47*wd),y+(.70*ht));
point(x+(.5*wd),y+(.70*ht));
point(x+(.53*wd),y+(.70*ht));
point(x+(.55*wd),y+(.70*ht));
point(x+(.57*wd),y+(.695*ht));

point(x+(.57*wd),y+(.73*ht));
point(x+(.57*wd),y+(.75*ht));
point(x+(.56*wd),y+(.77*ht));
point(x+(.54*wd),y+(.79*ht));
point(x+(.52*wd),y+(.79*ht));

point(x+(.50*wd),y+(.79*ht));
point(x+(.48*wd),y+(.79*ht));
point(x+(.46*wd),y+(.77*ht));
point(x+(.45*wd),y+(.75*ht));
point(x+(.45*wd),y+(.73*ht));





noStroke();
strokeWeight(2);
fill(232,2,29);
beginShape();


curveVertex(x+(.43*wd),y+(.694*ht));
curveVertex(x+(.43*wd),y+(.695*ht));
curveVertex(x+(.45*wd),y+(.70*ht));
curveVertex(x+(.47*wd),y+(.70*ht));
curveVertex(x+(.5*wd),y+(.70*ht));
curveVertex(x+(.53*wd),y+(.70*ht));
curveVertex(x+(.55*wd),y+(.70*ht));
curveVertex(x+(.57*wd),y+(.695*ht));

curveVertex(x+(.57*wd),y+(.73*ht));
curveVertex(x+(.57*wd),y+(.75*ht));
curveVertex(x+(.56*wd),y+(.77*ht));
curveVertex(x+(.54*wd),y+(.79*ht));
curveVertex(x+(.52*wd),y+(.79*ht));

curveVertex(x+(.50*wd),y+(.79*ht));
curveVertex(x+(.48*wd),y+(.79*ht));
curveVertex(x+(.46*wd),y+(.77*ht));
curveVertex(x+(.45*wd),y+(.75*ht));
curveVertex(x+(.45*wd),y+(.73*ht));
endShape();

saveFrame("hw2.jpg");


