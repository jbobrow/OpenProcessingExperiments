
size(400,400);

background(79,0,111);

fill(255,82,195);
strokeWeight(10);
stroke(255,0,170);

beginShape();
vertex(40,75);
vertex(125,150);
vertex(200,75);
vertex(265,150);
vertex(350,80);
vertex(350,280);
vertex(40,280);
vertex(40,75);
endShape();


fill(133,242,245);
noStroke();
ellipse(40,65,30,30);

fill(133,242,245);
noStroke();
ellipse(200,65,30,30);

fill(133,242,245);
noStroke();
ellipse(350,65,30,30);

strokeWeight(10);
stroke(255,255,255);
point(40,65);

strokeWeight(10);
stroke(255,255,255);
point(200,65);

strokeWeight(10);
stroke(255,255,255);
point(350,65);

strokeWeight(5);
stroke(255,0,170);
line(40,235,350,235);

strokeWeight(5);
rect(40,230,310,10);
