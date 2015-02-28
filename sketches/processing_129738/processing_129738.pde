
//HW_2-copyright Joanne Lo jylo 2014

size(400,400);
background(230,230,250);

//variables 
float x,y,w,ht;
 x=100;
 y=100;
 w=100;
 ht=100;

//head
fill(255,218,185);
noStroke();
ellipseMode(CENTER);
ellipse(x+w,y+ht,2.5*w,2*ht);

//L eye
fill(160,82,45);
noStroke();
ellipse(x+.35*w,y+ht,0.2*w,0.2*ht);

//R eye
fill(160,82,45);
noStroke();
ellipse(x+1.55*w,y+ht,0.2*w,0.2*ht);

//R-ear
fill(255,218,185);
ellipse(x-0.3*w,y+ht,w*0.2,ht*0.6);

//R-ear
fill(255,218,185);
ellipse(x+2.3*w,y+ht,w*0.2,ht*0.6);

//glasses
noFill();
stroke(70,70,70);
strokeWeight(8);
rect(x,y+.65*ht,.75*w,.5*ht);
rect(x+1.2*w,y+.65*ht,.75*w,.5*ht);

//hatbrim
fill(160,82,45);
ellipse(x+w,y+0.5*ht,w*3,ht*0.3);

//hat
fill(160,82,45);
beginShape();
 curveVertex(x-0.15*w,y+0.4*ht);
 curveVertex(x-0.15*w,y+0.4*ht);
 curveVertex(x+0.5*w,y-0.4*ht);
 curveVertex(x+w,y-0.4*ht);
 curveVertex(x+1.58*w,y-.5*ht);
 curveVertex(x+2.3*w,y+.5*ht);
 curveVertex(x+2.3*w,y+.5*ht);
endShape();
  
//glasses arc
noFill();
stroke(70,70,70);
strokeWeight(8);
arc(x+.98*w,y+ht,.4*w,.2*ht,PI,TWO_PI);

//mustache
noStroke();
fill(190,190,190);
beginShape();
 vertex(x+.5*w,y+1.7*ht);
 vertex(x+.4*w,y+1.7*ht);
 vertex(x+1.5*w,y+1.7*ht);
 vertex(x+1.3*w,y+1.4*ht);
 vertex(x+.7*w,y+1.4*ht);
 vertex(x+.7*w,y+1.4*ht);
endShape();

//initials (J)
  //J vertical line
  fill(244,164,96);
  noStroke();
  rect(x+1.01*w,y+ht,w*0.05,ht*0.35,w*0.02);
  //J arc
  noFill();
  stroke(244,164,96);
  strokeWeight(6);
  arc(x+.95*w,y+1.25*ht,0.2*w,0.2*ht,QUARTER_PI,PI);
  
  //initials(L)
  //L vertical line
  stroke(139,134,130);
  line(x+1.2*w,y+.7*ht,x+1.2*w,y+1.155*ht);
  line(x+1.2*w,y+1.15*ht,x+1.95*w,y+1.15*ht);






