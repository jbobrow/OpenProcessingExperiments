
size(300,260);
background(0,130,0);
stroke(200);
strokeWeight(2);
fill(0,0,100,65);

beginShape();
vertex(60,35);
bezierVertex(250,10,350,180,220,120);
endShape(CLOSE);

beginShape();
vertex(60,35);
bezierVertex(-100,310,270,280,60,35);
endShape(CLOSE);

beginShape();
vertex(60,35);
bezierVertex(250,50,300,280,130,200);
bezierVertex(230,100,0,65,60,35);
endShape();


