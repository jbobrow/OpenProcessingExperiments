
size(1000,700);
smooth();
background(204,226,225);

//Body
beginShape();
fill(255,0,0,255);
vertex(380,240);
vertex(320,360);
vertex(360,400);
vertex(400,440);
vertex(500,480);
vertex(560,480);
vertex(620,460);
vertex(660,420);
vertex(700,380);
vertex(720,360);
endShape(CLOSE);

//Head
beginShape();
vertex(380,240);
vertex(340,220);
vertex(300,220);
vertex(240,240);
vertex(220,300);
vertex(240,360);
vertex(240,420);
vertex(260,380);
vertex(320,360);
endShape(CLOSE);
line(240,360,260,380);

beginShape();
vertex(380,240);
vertex(340,220);
vertex(230,330);
endShape(CLOSE);

ellipse(280,300,15,15);

//Wing
beginShape();
vertex(360,210);
vertex(600,280);
vertex(700,340);
vertex(820,420);
vertex(380,240);
vertex(340,220);
endShape(CLOSE);

//Tail
beginShape();
vertex(710,375);
vertex(780,600);
vertex(860,540);
endShape(CLOSE);
line(710,375,780,500);
beginShape();
vertex(780,500);
vertex(780,600);
vertex(860,540);
endShape(CLOSE);
beginShape();
vertex(800,540);
vertex(800,580);
vertex(840,551);
endShape(CLOSE);



