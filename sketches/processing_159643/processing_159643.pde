
size(500,500);
background(0);
strokeWeight(4);
stroke(5);

//face
fill(122,184,198);
ellipse(250,350,470,500);

//hands

ellipse(50,470,50,100);
ellipse(200,480,50,100);

//mouth
noFill();
beginShape();
curveVertex(90, 400);
curveVertex(90, 400);
curveVertex(100, 450);
curveVertex(130, 450);
curveVertex(140, 420);
curveVertex(140, 420);
curveVertex(150, 450);
curveVertex(180, 450);
curveVertex(185, 400);
curveVertex(185, 400);
endShape();

//eye
fill(255);
noStroke();
//left
quad(40,290,120,290,100,350,50,350);
ellipse(80,280,80,100);
//right
quad(190,290,270,290,250,350,200,350);
ellipse(230,280,80,100);
fill(0);
ellipse(80,330,50,40);
ellipse(230,330,50,40);

//moon
fill(197,207,229);
ellipse(78,78,150,150);
fill(0,190);
ellipse(50, 50,130,130);

//cheek
fill(193,0,68,10);
ellipse(300,410,130,130);
ellipse(300,410,120,120);
ellipse(300,410, 100,100);
ellipse(300,410,90,90);
ellipse(300,410,80,80);
ellipse(300,410,70,70);

//cheek
fill(193,0,68,10);
ellipse(300,410,130,130);
ellipse(300,410,120,120);
ellipse(300,410, 100,100);
ellipse(300,410,90,90);
ellipse(300,410,80,80);
ellipse(300,410,70,70);
ellipse(30,410,130,130);
ellipse(30,410,120,120);
ellipse(30,410, 100,100);
ellipse(30,410,90,90);
ellipse(30,410,80,80);
ellipse(30,410,70,70);

//hands
strokeWeight(4);
stroke(5);
fill(122,184,198);
ellipse(50,470,50,100);
ellipse(200,480,50,100);
ellipse(50,470,50,100);
ellipse(200,480,50,100);




