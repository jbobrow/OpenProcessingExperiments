

//Face with no sound
size(400,800);
background(#760404);
float x,y,wd,ht;
x=0;
y=0;
wd=400;
ht=800;

//the arms
noStroke();
fill(#B9AAAA);
ellipse(x+.49*wd,y+.85*ht,.95*wd,y+.25*ht);
//pants
noStroke();
fill(#983F1C);
rect( x+.15*wd,y+.80*ht,.7*wd,y+.30*ht);
//belly
noStroke();
fill(#E89D88);
ellipse(x+.5*wd,y+.8*ht,.75*wd,y+.25*ht); 
//the clothes
noStroke();
fill(#B9AAAA);
ellipse(x+.5*wd,y+.55*ht,.98*wd,y+.25*ht);
rect( x+.02*wd,y+.55*ht,.95*wd,y+.30*ht);
ellipse(x+.5*wd,y+.76*ht,.94*wd,y+.27*ht);

//the body
noStroke();
fill(#E89D88);
beginShape();
vertex(x+.35*wd,y+.38*ht);
vertex(x+.33*wd,y+.42*ht);
vertex(x+.2*wd,y+.45*ht);
vertex(x+.5*wd,y+.52*ht);
vertex(x+.8*wd,y+.45*ht);
vertex(x+.67*wd,y+.42*ht);
vertex(x+.65*wd,y+.38*ht);
endShape();
//sweat
fill(#FFBC29,50);
ellipse(x+.88*wd,y+.62*ht,.08*wd,.06*ht);
ellipse(x+.13*wd,y+.62*ht,.08*wd,.06*ht);
//shaddows on arm
fill(#766D6D,85);
triangle(x+.84*wd,y+.6*ht,x+.87*wd,y+.6*ht,x+.83*wd,y+.77*ht);
triangle(x+.17*wd,y+.6*ht,x+.13*wd,y+.6*ht,x+.17*wd,y+.77*ht);
//belly button
ellipse(x+.5*wd,y+.86*ht,.07*wd,.03*ht);
fill(#B9AAAA);
ellipse(x+.5*wd,y+.85*ht,.07*wd,.03*ht);

//the face
smooth();
fill(#FFA289);
noStroke();
ellipse(x+.5*wd,y+.25*ht,.35*wd,y+.32*ht); 
fill(#FFA289);
stroke(#FFA289);
strokeCap(ROUND);
strokeWeight(10);
beginShape();
curveVertex(x+.38*wd,y+.2*ht);
curveVertex(x+.35*wd,y+.25*ht);
curveVertex(x+.35*wd,y+.38*ht);
curveVertex(x+.65*wd,y+.38*ht);
curveVertex(x+.65*wd,y+.25*ht);
curveVertex(x+.60*wd,y+.2*ht);
endShape();

//face
//eyelids

//eyes
fill(#766D6D,85);
ellipse(x+.44*wd,y+.21*ht,.08*wd,.06*ht);
ellipse(x+.56*wd,y+.21*ht,.08*wd,.06*ht);
noStroke();
fill(255);
ellipse(x+.42*wd,y+.20*ht,.08*wd,.06*ht);
ellipse(x+.58*wd,y+.20*ht,.08*wd,.06*ht);

//
fill(0);
ellipse(x+.6*wd,y+.22*ht,.02*wd,.01*ht);
ellipse(x+.44*wd,y+.22*ht,.02*wd,.01*ht);
//nose
fill(#D62D39);
rect(x+.48*wd,y+.25*ht,.01*wd,.03*ht);
rect(x+.52*wd,y+.25*ht,.01*wd,.03*ht);
//mouth
noStroke();
strokeJoin(ROUND);
fill(#F57474);
beginShape();
vertex(x+.41*wd,y+.3*ht);
vertex(x+.47*wd,y+.29*ht);
vertex(x+.53*wd,y+.29*ht);
vertex(x+.59*wd,y+.3*ht);
endShape();
beginShape();
vertex(x+.41*wd,y+.3*ht);
vertex(x+.47*wd,y+.31*ht);
vertex(x+.53*wd,y+.31*ht);
vertex(x+.59*wd,y+.3*ht);
endShape();
//the tongue
fill(#FF5A5A);
beginShape();
curveVertex(x+.48*wd,y+.28*ht);
curveVertex(x+.45*wd,y+.3*ht);
curveVertex(x+.48*wd,y+.38*ht);
curveVertex(x+.5*wd,y+.4*ht);
curveVertex(x+.52*wd,y+.38*ht);
curveVertex(x+.55*wd,y+.3*ht);
curveVertex(x+.52*wd,y+.28*ht);
endShape();
//accent on the tongue
fill(147,47,56,85);
triangle(x+.47*wd,y+.3*ht,x+.5*wd,y+.3*ht,x+.5*wd,y+.4*ht);
//blushing

fill(#CB5A5A,50);
ellipse ( x+.37*wd,y+.28*ht,.08*wd,.06*ht);
ellipse ( x+.63*wd,y+.28*ht,.08*wd,.06*ht);

//eyelids
fill(#FF8F7E);
arc(x+.44*wd,y+.23*ht,.06*wd,.03*ht,0, radians (180));
arc(x+.56*wd,y+.23*ht,.06*wd,.03*ht,0, radians (180));
//graph
//x
//line(x,y+.5*ht,x+wd,y+.5*ht);
//line(x,y+.25*ht,x+wd,y+.25*ht);
//line(x,y+.75*ht,x+wd,y+.75*ht);
//y
//line(x+.5*wd,y,x+.5*wd,y+ht);
//line(x+.25*wd,y,x+.25*wd,y+ht);
//line(x+.75*wd,y,x+.75*wd,y+ht);
