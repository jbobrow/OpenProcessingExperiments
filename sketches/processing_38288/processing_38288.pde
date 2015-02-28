
//September 19 / while iteration
//Copyright Felipe Castelblanco, 2011

//while loops

float dt;//diameter
float posV;//vertical position
float posH;//horizontal position

void setup () 
{
  size (600,600);
  dt = 70;
  posV = 0;//vertical pos
  posH = 0;//horizontal position
  
  smooth();
  
  ellipseMode(CORNER);
  randomSeed(100);
  
  strokeWeight(3);
  
}

void draw ()
{
  
 stroke(255);
 

 //extenal frame
 while(posH < 540 && posV < 540){//limits of the screen = 600px - posV increment
 initials(.01*width, posV, dt +10  );
 initials(posH, .01*height, dt +10);
 initials(posH,.8*height, dt+10 );
 initials(.8*width,posV,dt+10);
 
 //internal
 initials(.2*width, .2*height+.5*posV, dt -10 );
 initials(.65*width, .2*height+.5*posV, dt -10 );
 initials(.2*width+posH/2, .2*height, dt -10 );
 initials(.2*width+posH/2, .6*height, dt -10 );
 initials(.2*width+posH/2, .2*height+.5*posV, dt -10 );
 initials(.65*width-posH/2, .2*height+.5*posV, dt -10 );
 
 posH =  posH+60 ;
 posV =  posV+60;
 }
 }
 
 

void initials(float x, float y, float dt)
{
  
fill(random (255), random (200), random (255));
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
noFill();
ellipse(x + dt+7, y + .5*dt, .04*dt, .5*dt);
}



