
size(270,350);
background(255);
smooth();
strokeWeight(5);
stroke(0);
fill(255);

// Cabeça
ellipse(135,90,70,70);
point(125, 80);
point(145, 80);
arc(135, 95, 30, 30, 0, PI);

// Tronco
triangle(135, 130, 100, 230, 170, 230);

// Braços
line(60, 160, 120, 160);
line(150, 160, 210, 160);

// Pernas
line(120, 230, 120, 290);
line(150, 230, 150, 290);
                
