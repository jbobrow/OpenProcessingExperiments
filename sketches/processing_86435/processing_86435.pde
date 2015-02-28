
//hw2 
//Jingjing Chen jingjin1@andrew.cmu.edu
//copyright 2013

size(500,500);
background(106,191,255);
noFill();

float x,y,wd,ht;
x=120;
y=150;
wd=150;
ht=1.8*wd;
//body
strokeWeight(3);
stroke(#FFFFFF);
beginShape();
curveVertex(x+.625*wd,y+.025*ht);
curveVertex(x+.625*wd,y+.025*ht);
curveVertex(x+.36*wd,y+.25*ht);
curveVertex(x+.2*wd,y+ .5*ht);
curveVertex(x+.28*wd,y+ .77*ht);
curveVertex(x+.55*wd,y+.995*ht);
curveVertex(x+.55*wd,y+.995*ht);
endShape();
beginShape();
curveVertex(x+1.375*wd,y+.025*ht);
curveVertex(x+1.375*wd,y+.025*ht);
curveVertex(x+1.64*wd,y+.25*ht);
curveVertex(x+1.8*wd,y+ .5*ht);
curveVertex(x+1.72*wd,y+ .77*ht);
curveVertex(x+1.45*wd,y+.995*ht);
curveVertex(x+1.45*wd,y+.995*ht);
endShape();

//shoes
stroke(#210F08);
strokeWeight(8);
beginShape();
curveVertex(x+1.45*wd,y+.995*ht);
curveVertex(x+1.45*wd,y+.995*ht);
curveVertex(x+1.56*wd,y+1.02*ht);
curveVertex(x+1.58*wd,y+1.045*ht);
curveVertex(x+1.45*wd,y+ 1.045*ht);
curveVertex(x+1.25*wd,y+ 1.05*ht);
curveVertex(x+1.15*wd,y+ 1.05*ht);
curveVertex(x+1.1*wd,y+1.05*ht);
curveVertex(x+1.1*wd,y+1.05*ht);
endShape();
beginShape();
curveVertex(x+.55*wd,y+.995*ht);
curveVertex(x+.55*wd,y+.995*ht);
curveVertex(x+.44*wd,y+1.02*ht);
curveVertex(x+.42*wd,y+1.045*ht);
curveVertex(x+.55*wd,y+ 1.045*ht);
curveVertex(x+.75*wd,y+ 1.05*ht);
curveVertex(x+.85*wd,y+ 1.05*ht);
curveVertex(x+.9*wd,y+1.05*ht);
curveVertex(x+.9*wd,y+1.05*ht);
endShape();

//J
stroke(#FFFFFF);
strokeWeight(8);
beginShape();
curveVertex(x+.2*wd,y+ .35*ht);
curveVertex(x+.35*wd,y+ .56*ht);
curveVertex(x+   wd,y+ .645*ht);
curveVertex(x+1.65*wd,y+ .56*ht);
curveVertex(x+1.8*wd,y+.35*ht);
endShape();
beginShape();
curveVertex(x+   wd,y+ .645*ht);
curveVertex(x+   wd,y+ .645*ht);
curveVertex(x+   .995*wd,y+ .82*ht);
curveVertex(x+   1.03*wd,y+ .93*ht);

curveVertex(x+   .98*wd,y+ .98*ht);
curveVertex(x+.9*wd,y+ht);
curveVertex(x+.9*wd,y+ht);
endShape();

//hands
strokeWeight(8);
stroke(#0D3B71);
beginShape();
curveVertex(x+   .5*wd,y+ .07*ht);
curveVertex(x+   .5*wd,y+ .07*ht);
curveVertex(x+   .12*wd,y+ .35*ht);
curveVertex(x+   .25*wd,y+ .4*ht);
curveVertex(x+.8*wd,y+.32*ht);
curveVertex(x+1.1*wd,y+.31*ht);
curveVertex(x+1.1*wd,y+.31*ht);
endShape();

beginShape();
curveVertex(x+   1.65*wd,y+ .15*ht);
curveVertex(x+   1.65*wd,y+ .15*ht);
curveVertex(x+   1.75*wd,y+ .3*ht);
curveVertex(x+   1.66*wd,y+ .42*ht);
curveVertex(x+1.3*wd,y+.48*ht);
curveVertex(x+.9*wd,y+.5*ht);
curveVertex(x+.9*wd,y+.5*ht);
endShape();

//face
strokeWeight(3);
stroke(#0D3B71);
beginShape();
curveVertex(x+   .6*wd,y- .17*ht);
curveVertex(x+   .6*wd,y- .17*ht);
curveVertex(x+   .7*wd,y+ .05*ht);
curveVertex(x+   wd,y+ .1*ht);
curveVertex(x+1.25*wd,y+.04*ht);
curveVertex(x+1.35*wd,y-.2*ht);
curveVertex(x+1.35*wd,y-.2*ht);
endShape();

//mao
strokeWeight(5);
stroke(#894400);
beginShape();
curveVertex(x+   .6*wd,y- .08*ht);
curveVertex(x+   .6*wd,y- .08*ht);
curveVertex(x+   .45*wd,y- .09*ht);
curveVertex(x+   .42*wd,y- .125*ht);
curveVertex(x+   .6*wd,y- .16*ht);
curveVertex(x+   .9*wd,y- .15*ht);
curveVertex(x+1.35*wd,y-.2*ht);
curveVertex(x+   1.55*wd,y- .15*ht);
curveVertex(x+1.34*wd,y-.1*ht);
curveVertex(x+1.34*wd,y-.1*ht);
endShape();

beginShape();
curveVertex(x+   .6*wd,y- .16*ht);
curveVertex(x+   .6*wd,y- .16*ht);
curveVertex(x+   .65*wd,y- .3*ht);
curveVertex(x+   .7*wd,y- .33*ht);
curveVertex(x+   .9*wd,y- .32*ht);
curveVertex(x+   1.15*wd,y- .33*ht);
curveVertex(x+   1.3*wd,y- .34*ht);
curveVertex(x+1.35*wd,y-.2*ht);
curveVertex(x+1.35*wd,y-.2*ht);
endShape();

//
stroke(#FFFFFF);
strokeWeight(3);
beginShape();
curveVertex(x+   .75*wd,y- .05*ht);
curveVertex(x+   .75*wd,y- .05*ht);
curveVertex(x+.85*wd,y-.1*ht);
curveVertex(x+.85*wd,y-.1*ht);
endShape();
beginShape();
curveVertex(x+   1.25*wd,y- .05*ht);
curveVertex(x+   1.25*wd,y- .05*ht);
curveVertex(x+1.05*wd,y-.1*ht);
curveVertex(x+1.05*wd,y-.1*ht);
endShape();
beginShape();
curveVertex(x+.85*wd,y-.1*ht);
curveVertex(x+.85*wd,y-.1*ht);
curveVertex(x+.85*wd,y-.01*ht);
curveVertex(x+1.05*wd,y-.1*ht);
curveVertex(x+1.05*wd,y-.1*ht);
endShape();

beginShape();
curveVertex(x+   .75*wd,y+ .03*ht);
curveVertex(x+   .75*wd,y+ .03*ht);
curveVertex(x+.78*wd,y);
curveVertex(x+.78*wd,y);
endShape();
beginShape();
curveVertex(x+   .8*wd,y+ .03*ht);
curveVertex(x+   .8*wd,y+ .03*ht);
curveVertex(x+.82*wd,y);
curveVertex(x+.82*wd,y);
endShape();
beginShape();
curveVertex(x+   .86*wd,y+ .03*ht);
curveVertex(x+   .86*wd,y+ .03*ht);
curveVertex(x+.88*wd,y);
curveVertex(x+.88*wd,y);
endShape();
beginShape();
curveVertex(x+   .915*wd,y+ .03*ht);
curveVertex(x+   .915*wd,y+ .03*ht);
curveVertex(x+.92*wd,y);
curveVertex(x+.92*wd,y);
endShape();
beginShape();
curveVertex(x+   .96*wd,y+ .03*ht);
curveVertex(x+   .96*wd,y+ .03*ht);
curveVertex(x+.956*wd,y);
curveVertex(x+.956*wd,y);
endShape();
beginShape();
curveVertex(x+ wd,y+ .03*ht);
curveVertex(x+ wd,y+ .03*ht);
curveVertex(x+wd,y);
curveVertex(x+wd,y);
endShape();
beginShape();
curveVertex(x+   1.06*wd,y+ .03*ht);
curveVertex(x+   1.06*wd,y+ .03*ht);
curveVertex(x+1.04*wd,y);
curveVertex(x+1.04*wd,y);
endShape();

//
line(x+.72*wd,y-.1*ht,x+1.2*wd,y-.14*ht);
line(x+.73*wd,y-.12*ht,x+1.2*wd,y-.1*ht);
fill(#E50000);
triangle(x+wd,y+.15*ht,x+.75*wd,y+0.1*ht,x+.75*wd,y+.2*ht);
triangle(x+wd,y+.15*ht,x+1.25*wd,y+0.1*ht,x+1.25*wd,y+.2*ht);

noStroke();
noFill();
strokeWeight(0.5);
rect(x,y,wd,ht);
ellipse( x + .5*wd, y +.5*ht, wd,ht );
//
fill(#FFF14D);
ellipse(x+wd,y+.4*ht,.2*wd,.12*ht);




