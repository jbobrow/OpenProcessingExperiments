
//Assigment 02 - Initials + CurveVertex
//Copyright Felipe Castelblanco, Sept 05 2011
//Drag mouse to change background color
//move ellipse with keys up, down, left and right to change its position

int x; //value position x
int y; //value position y
int dt; //diameter of ellipse / governing variable

color col;

void setup() 
{
size (600, 600);
smooth();
strokeWeight(5);
stroke(10);

x = width/4;
y = height/4;
dt = 0;

}

void draw()
{
  
fill (50,250,200);

dt = dt + 1;

if (dt >= 200){
 dt = 50;
}

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

}

void keyPressed() 
{
 if (keyCode == UP){
 y = y - 10;
 }
 if (keyCode == DOWN){
 y = y + 10;
 }
 if (keyCode == RIGHT){
 x = x + 10;
 }
  if (keyCode == LEFT){
 x = x - 10;
 }
}

void mouseDragged()
{
 col = color(random(200),random(250),random(250));
 background(col);
}

