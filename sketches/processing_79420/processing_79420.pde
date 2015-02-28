
void setup(){
  size(400,400);
}

void draw(){
  rata(-100,-100,15,3,5,0);
  rata(30,-100,25,6,20,-200);
  
}

void rata(int x, int y, int dientes, int ojos, int bigote, int pelo){
pushMatrix();
translate(x,y);
noStroke();
fill(230+pelo);
beginShape();
vertex(230,300);
vertex(250,300);
vertex(270,340);
vertex(255,335);
vertex(265,390);
vertex(241,380);
vertex(215,390);
vertex(225,335);
vertex(210,340);
endShape(CLOSE);
fill(255,150,110);
ellipse(225,335,10,20);
ellipse(255,335,10,20);
arc(215,390,20,15,PI,TWO_PI);
arc(265,390,20,15,PI,TWO_PI);
//Dientes
stroke(1);
fill(255,255,150);
rect(237,300,3,10+dientes);
rect(240,300,3,10+dientes);
noStroke();
//Cabeza
fill(255+pelo);
triangle(220,280,260,280,240,320);
ellipse(220,280,20,40);
ellipse(260,280,20,40);
fill(255,100,100);
ellipse(235,290,8,8-ojos);
ellipse(245,290,8,8-ojos);
//Bigotes
stroke(1);
line(235,305,209-bigote,305);
line(235,307,212-bigote,308);
line(235,309,215-bigote,312);
line(245,305,270+bigote,305);
line(245,307,268+bigote,308);
line(245,309,265+bigote,312);
popMatrix();
}
