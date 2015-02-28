
size(400,400);
smooth();
background(255);
noStroke();
fill(255,0,0);

//declare variables
float x,y,wd,ht;
x=200;
y=200;
wd=80;
ht=80;

fill(0);
ellipse(x,y,wd,ht);
ellipse(x,y,3.05*wd,3.05*ht);

fill(255,0,0);
ellipse(x,y,wd,ht);
ellipse(x,y,3*wd,3*ht);

stroke(1);
fill(175);
ellipse(x,y,wd,ht);
ellipse(x,y,4*wd,2*ht);

fill(100);
ellipse(x,y,wd,ht);
ellipse(x,y,4*wd,1*ht);

fill(255);
ellipse(x,y,wd,ht);
ellipse(x,y,1*wd,1*ht);

noStroke();
fill(255);
ellipse(x,y,wd,ht);
ellipse(x-1.85*wd,y,1*wd,1*ht);

fill(255);
ellipse(x,y,wd,ht);
ellipse(x+1.85*wd,y,1*wd,1*ht);

//A
stroke(184,134,11);
strokeWeight(2);
beginShape();
curveVertex(x-2*wd,y+.3*ht);
curveVertex(x-2*wd,y+.3*ht);//1
curveVertex(x-1.85*wd,y-.3*ht);//2
curveVertex(x-1.7*wd,y+.3*ht);//3
curveVertex(x-1.775*wd,y+.05*ht);//4
curveVertex(x-2.01*wd,y-.06*ht);//5
curveVertex(x-2.01*wd,y-.06*ht);
endShape();

//B
stroke(25,25,112);
strokeWeight(2);
beginShape();
curveVertex(x-.18*wd,y+.28*ht);
curveVertex(x-.18*wd,y+.28*ht);//1
curveVertex(x-.16*wd,y-.28*ht);
curveVertex(x-.16*wd,y-.28*ht);//2
curveVertex(x+.12*wd,y-.28*ht);//3
//curveVertex(x+.2*wd,y-.2*ht);//4
//curveVertex(x+.2*wd,y-.1*ht);//5
curveVertex(x+.12*wd,y-.02*ht);//6
curveVertex(x+.0*wd,y-.01*ht);//7
curveVertex(x+.20*wd,y-.01*ht);//8
curveVertex(x+.2*wd,y+.28*ht);//9
curveVertex(x+.0*wd,y+.35*ht);//10
curveVertex(x-.18*wd,y+.28*ht);//11
curveVertex(x-.18*wd,y+.28*ht);
endShape();

//V
stroke(184,134,11);
strokeWeight(2);
beginShape();
curveVertex(x+2*wd,y-.3*ht);
curveVertex(x+2*wd,y-.3*ht);//1
curveVertex(x+1.85*wd,y+.3*ht);//2
curveVertex(x+1.7*wd,y-.3*ht);//3
curveVertex(x+1.7*wd,y-.3*ht);
endShape();
