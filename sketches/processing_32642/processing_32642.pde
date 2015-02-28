
size(400,400);
background(255,210,0);

noStroke();
fill(0,100,0);//green area
beginShape();
vertex(0,290);
vertex(70,325);
bezierVertex(40,390,65,350,55,360);
vertex(55,360);
vertex(60,400);
vertex(0,400);
endShape(CLOSE);

fill(0);
beginShape();//mouth above front black
vertex(257,238);
bezierVertex(140,255,150,250,110,250);
vertex(110,250);
bezierVertex(130,280,200,265,260,258);
endShape(CLOSE);

beginShape();//below mouth black
vertex(325,275);
vertex(375,235);
vertex(400,200);
vertex(400,230);
vertex(380,260);
vertex(340,290);
endShape();



fill(255,100,0);
beginShape();//left orange
vertex(200,0);
bezierVertex(175,50,150,20,80,35);
vertex(80,35);
bezierVertex(75,90,50,75,25,125);
vertex(25,125);
bezierVertex(100,120,80,100,80,78);
bezierVertex(175,125,100,150,40,170);
vertex(40,170);
bezierVertex(0,330,75,300,145,300);
vertex(145,300);
bezierVertex(100,360,25,310,0,300);
vertex(0,300);
vertex(0,0);
endShape(CLOSE);


fill(210,0,0);
beginShape();//right up red
vertex(275,0);
bezierVertex(310,50,320,50,350,120);
vertex(350,120);
vertex(400,190);
vertex(400,0);
endShape(CLOSE);

fill(255,100,0);
beginShape();//right above mouth back
vertex(400,190);
bezierVertex(310,232,300,220,250,238);
vertex(250,238);
vertex(250,250);
vertex(255,252);
vertex(255,260);
vertex(350,242);
vertex(355,243);
vertex(355,243);
bezierVertex(342,230,375,233,390,225);
vertex(390,225);
vertex(400,230);
endShape(CLOSE);

fill(180,0,0);//below mouth red
beginShape();
vertex(300,295);
bezierVertex(200,327,200,310,175,300);
vertex(174,300);
bezierVertex(180,350,280,325,310,320);
vertex(305,310);

endShape(CLOSE);
fill(255,100,0);
beginShape();//mouth below
vertex(400,235);
vertex(390,247);
vertex(375,265);
vertex(375,265);
vertex(325,275);
vertex(290,300);
vertex(300,300);
vertex(300,310);
vertex(300,320);
bezierVertex(390,295,390,255,400,260);
vertex(400,260);
endShape(CLOSE);

fill(255);//below mouth white
beginShape();
vertex(350,240);
vertex(395,215);
vertex(400,230);
vertex(390,245);
vertex(380,235);
vertex(375,235);
vertex(360,246);
endShape(CLOSE);

fill(0);//right little black
beginShape();
vertex(400,190);
vertex(355,125);
vertex(400,125);
endShape(CLOSE);

fill(255,150,0);//right big orange
beginShape();
vertex(350,100);
vertex(375,105);
vertex(400,85);
vertex(400,160);
vertex(380,140);
vertex(355,125);
vertex(350,120);
endShape(CLOSE);

fill(0);
beginShape();//left black
vertex(200,0);
bezierVertex(175,50,150,20,80,35);
vertex(80,35);
vertex(0,43);
vertex(0,0);
endShape(CLOSE);

fill(100,0,0);
beginShape();//left black2
vertex(25,125);
vertex(73,120);
vertex(60,165);
vertex(45,173);
vertex(30,205);
vertex(25,200);
vertex(10,195);
vertex(10,175);
endShape(CLOSE);

fill(130,0,0);
beginShape();
vertex(50,295);
bezierVertex(90,320,100,304,148,300);
vertex(148,300);
bezierVertex(110,355,50,320,25,310);
vertex(25,310);

endShape(CLOSE);

