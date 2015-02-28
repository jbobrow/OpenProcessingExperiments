
size(60, 60);
background (255);
smooth();

// Rectangulo fondo
noStroke();
fill(170,168,120);
rect(0,0,60,60);

//triangulos verdes oscuros
noStroke();
fill(0,0,0,150);
beginShape();
vertex(0,20);
vertex(10,30);
vertex(0,40);
endShape(CLOSE);

beginShape();
vertex(20,0);
vertex(30,10);
vertex(40,0);
endShape(CLOSE);

beginShape();
vertex(60,20);
vertex(60,40);
vertex(50,30);
endShape(CLOSE);

beginShape();
vertex(20,60);
vertex(40,60);
vertex(30,50);
endShape(CLOSE);

//rectangulos verdes
fill(0,0,0,100);
beginShape();
vertex(0,20);
vertex(10,30);
vertex(30,10);
vertex(20,0);
endShape(CLOSE);

beginShape();
vertex(30,10);
vertex(40,0);
vertex(60,20);
vertex(50,30);
endShape(CLOSE);

beginShape();
vertex(50,30);
vertex(60,40);
vertex(40,60);
vertex(30,50);
endShape(CLOSE);

beginShape();
vertex(20,60);
vertex(30,50);
vertex(10,30);
vertex(0,40);
endShape(CLOSE);

// Linias oscuras
stroke(75,75,75,100);
strokeWeight(1);
line(0,0,60,60);
line(60,0,0,60);

//Linias blancas
stroke(220,220,220,100);
strokeWeight(1);
line(0,30,30,0);
line(30,0,60,30);
line(60,30,30,60);
line(30,60,0,30);



