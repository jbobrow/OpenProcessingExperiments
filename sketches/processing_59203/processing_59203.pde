
size (296, 350); 
background (255); 
smooth();

//bezier
noFill();
strokeWeight(3);
stroke(255, 102, 0);
stroke(0, 0, 0);
bezier(30, 20,  80, 5,  80, 75,  30, 75);

//estrella
stroke(1);
strokeWeight(3);
line(170,230,170,150);
line(140,220,200,160);
line(200,220,140,160);
line(130,190,210,190);

//cabeza
noStroke();
fill(1);
ellipse (150, 90, 190, 140);
fill(255);
ellipse (150, 90, 175, 125);

//ojo izquirdo
fill(240,0,0); 
rect(100, 40, 50, 40);
fill(1);
ellipse (100, 60, 70, 70);
fill(255);
ellipse (100, 60, 50, 50);
fill(1); 
ellipse (100, 60, 25, 25);

//ojo derecho
fill(50, 59, 188);
rect(150, 55, 83, 25);
fill(1);
ellipse (200, 60, 70, 70);
fill(255);
ellipse (200, 60, 50, 50);
fill(1);
ellipse (200, 60, 25, 25);

//nariz
fill(1); 
triangle (153, 20, 140, 100, 166, 100);
//boca
fill(1);
triangle (130, 120, 180, 130, 130, 140);

//cuello
rect(150, 150, 10, 60);

//cuerpo
fill(50, 59, 188); 
rect(75, 210, 150, 80); 
fill(240,0,0); 
noStroke(); 
ellipse (170, 245, 75, 55); 
fill(0,250,0);
ellipse (230, 165, 15, 15);

//red vertical
fill(1);
rect(77, 205, 5, 90);
rect(120, 205, 5, 90);
rect(170, 205, 5, 90);
rect(219, 205, 5, 90);

// red horizontal
fill(1);
rect(72, 213, 160, 5);
rect(72, 233, 160, 5);
rect(72, 255, 160, 5);
rect(72, 280, 160, 5);


