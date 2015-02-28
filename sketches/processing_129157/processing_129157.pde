
// copyright Josh Kim gyeongyk
size(400,400);
background(185,234,235);

//variables
float x=200;
float y=200;
float w=200;
float h=200;

//face
noStroke();
fill(250, 221, 195);
ellipse(x, y, x, y);

//hair
fill(150,149,147);
beginShape();
  curveVertex(x,0.55*y);
  curveVertex(0.75*x,0.55*y);
  curveVertex(0.7*x,0.7*y);
  curveVertex(x/2,y);
  curveVertex(0.6*x,0.6*y);
  curveVertex(1.5*x,y/2);
endShape();

fill(150,149,147);
beginShape();
  curveVertex(x,0.55*y);
  curveVertex(0.75*x,0.55*y);
  curveVertex(0.7*x,0.7*y);
  curveVertex(x/2,y);
  curveVertex(0.6*x,0.6*y);
  curveVertex(1.5*x,y/2);
endShape();

fill(150,149,147);
beginShape();
  curveVertex(x,0.55*y);
  curveVertex(1.25*x,0.55*y);
  curveVertex(1.3*x,0.7*y);
  curveVertex(1.5*x,y);
  curveVertex(1.4*x,0.6*y);
  curveVertex(x/2,y/2);
endShape();

//eyebrows
ellipse(0.75*x,0.9*y,w/5,h/20);
ellipse(1.25*x,0.9*y,w/5,h/20);

//J(nose)
strokeWeight(5);
stroke(163,107,78);
noFill();
line(0.9*x,y,1.1*x,y);
beginShape();
  curveVertex(x,y);
  curveVertex(x,y);
  curveVertex(1.075*x,1.15*y);
  curveVertex(x,1.2*y);
  curveVertex(0.95*x,1.175*y);
  curveVertex(0.95*x,1.125*y);
endShape();

//glasses
strokeWeight(5);
stroke(0);
line(0.6*x,0.95*y,1.4*x,0.95*y);
line(0.6*x,0.95*y,x/2,y);
line(1.4*x,0.95*y,1.5*x,y);

fill(255);
arc(0.75*x,0.95*y,0.3*w,0.3*h,0,PI);
arc(1.25*x,0.95*y,0.3*w,0.3*h,0,PI);

//eyes
noStroke();
fill(0);
ellipse(0.75*x,y,0.075*w,0.075*h);
ellipse(1.25*x,y,0.075*w,0.075*h);

//moustache
noStroke();
fill(150,149,147);
quad(0.9*x,1.2*y,1.1*x,1.2*y,1.15*x,1.3*y,0.85*x,1.3*y);


