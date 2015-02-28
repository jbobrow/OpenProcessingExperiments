
//copyright Sophie Vennix
//Homework Assignment2
//1.21.14

size(400,400);
background(255);

/*stroke(230);
int i = 0;
for (i = 0; i < 400; i+=10) {
  line(0,i, 400,i);
  line(i,0,i,400);

}*/


//variables//
float x, y, w, h;
x=200;
y=230;
w=100;
h=100;

//head//
noStroke();
fill(250,235,215);
ellipseMode(CENTER);
ellipse(x,y-.30*h,2.25*w,2*h);

//ear1
fill(250,235,215);
//(91,200, 25,50)
arc(x-1.09*w,y-.30*h, .25*w,.5*h, .5*PI,1.5*PI); 

//ear2
fill(250,235,215);
arc(x+1.09*w,y-.3*h, .25*w,.5*h, 1.5*PI,2.5*PI); 
 
//glasses1
stroke(3);
fill(255);
beginShape();
  curveVertex(x,y+.70*h);
  curveVertex(x-.70*w,y-.45*h);
  curveVertex(x-.40*w,y-.30*h);
  curveVertex(x-.10*w,y-.45*h);
  curveVertex(x-.50*w,y+.70*h);
endShape();//

//glasses2
stroke(3);
fill(255);
beginShape();
  curveVertex(x,y+.70*h);
  curveVertex(x,y-.45*h);
  curveVertex(x+.40*w,y-.30*h);
  curveVertex(x+.60*w,y-.45*h);
  curveVertex(x-.50*w,y+.70*h);
endShape();//

//glasses3
line(x-.15*w,y-.45*h, x+.15*w,y-.45*h);

//nose
smooth();
strokeWeight(2);
noFill();
stroke(227,168,105);
line(x,y-.40*h, x+.08*w,y-.15*h);
curve(x-w,y-.40*h, x-.10*w,y-.15*h, x+.08*w,y-.15*h, x+w,y-.50*h);

//mustache ( S Initial);
smooth();
strokeWeight(5);
stroke(255);
fill(220);
beginShape();  
  curveVertex(x-w,y-1.8*h);
  curveVertex(x-.50*w,y-.05*h);
  curveVertex(x-.20*w,y+.15*h);
  curveVertex(x,y);
  curveVertex(x+.45*w,y+.15*h);
  curveVertex(x-.50*w,y+1.20*h);
endShape();

/*Circle-binding-initial;
noStroke();
fill(140,50);
ellipse(x,y, w,h);*/

//mouth
smooth();
strokeWeight(2);
stroke(222,133,177);
fill(231,158,169);
curve(x-.50*w,y-.30*h, x-.25*w,y+.30*h, x+.25*w,y+.30*h, x,y-.30*h);

/*border
stroke(183,195,208);
strokeWeight(50);
line(0,0, 0,2*y);
line(0,2*y, 2*x,2*y);
line(2*x,2*y, 2*x,0);
line(2*x,0, 0,0);*/

//saveFrame("hw2.jpg");


