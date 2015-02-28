
//Assigment 02 - Initials + CurveVertex
//Copyright Felipe Castelblanco, Sept 05 2011

size (400, 400);
background(10);
smooth();

strokeWeight(5);
stroke(10);

fill(200, 10, 150);

float x = 50; //value position x
float y = 50; //value position y

//float wd = 200; //value width
//float ht = 200; //value height

float dt = 200; //diameter of ellipse / governing variable

point(x,y);

ellipseMode(CORNER);
ellipse(x + .25*dt, y + .25*dt, dt, dt);
//f
beginShape();
    curveVertex(x + .60*dt, y - .28*dt);
    curveVertex(x + .60*dt, y + .28*dt);
    curveVertex(x + .60*dt, y + .50*dt);
    curveVertex(x + .55*dt, y + .50*dt);
    curveVertex(x + .45*dt, y + .50*dt);
    curveVertex(x + .40*dt, y + .60*dt);
    curveVertex(x + .40*dt, y + .65*dt);
    curveVertex(x + .45*dt, y + .70*dt);
    curveVertex(x + .60*dt, y + .70*dt);
    curveVertex(x + .60*dt, y + .75*dt);
    curveVertex(x + .60*dt, y + .85*dt);
    curveVertex(x + .45*dt, y + .90*dt);
    curveVertex(x + .45*dt, y + dt);
    curveVertex(x + .45*dt, y + (dt + .13*dt));
    curveVertex(x + .40*dt, y + (dt + .20*dt));  
endShape();
//C
beginShape();
    curveVertex(x + .80*dt, y - .25*dt);
    curveVertex(x + .90*dt, y + .28*dt);
    curveVertex(x + .95*dt, y + .60*dt);
    curveVertex(x + .80*dt, y + .60*dt);
    curveVertex(x + .75*dt, y + .50*dt);
    curveVertex(x + .70*dt, y + .50*dt);
    curveVertex(x + .68*dt, y + .65*dt);
    curveVertex(x + .68*dt, y + .75*dt);
    curveVertex(x + .70*dt, y + .85*dt);
    curveVertex(x + .70*dt, y + .90*dt);
    curveVertex(x + .72*dt, y + .95*dt);
    curveVertex(x + .82*dt, y + .95*dt);
    curveVertex(x + .82*dt, y + .80*dt);
    curveVertex(x + .95*dt, y + .80*dt);
    curveVertex(x + .95*dt, y + dt);
    curveVertex(x + .90*dt, y + (dt + .10*dt));
    curveVertex(x + .80*dt, y + (dt + .23*dt));
    curveVertex(x + .70*dt, y + (dt + .25*dt));  
endShape();
//O
fill(10);
ellipse(x + dt+10, y + .5*dt, .05*dt, .5*dt);






