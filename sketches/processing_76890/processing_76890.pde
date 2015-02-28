
size(500,500);
background(217,218,219);

// LE MUR
stroke(131,131,131);
    line(340,210,340,0);
    line(340,210,0,290);
    line(340,210,500,270);
// LA BOITE
fill(203,187,121);
stroke(124,112,66);
    // en haut
    beginShape();
    vertex(100,150);
    vertex(260,110);
    vertex(400,150);
    vertex(250,200);
    endShape(CLOSE);

    //  a gauche
    beginShape();
    vertex(100,150);
    vertex(250,200);
    vertex(250,400);
    vertex(100,330);
    endShape(CLOSE);

    //  a droite
    beginShape();
    vertex(250,200);
    vertex(400,150);
    vertex(400,320);
    vertex(250,400);
    endShape(CLOSE);
    
    
// L'ETIQUETTE
fill(250,246,232);
strokeWeight(5);
stroke(206,206,204);
    quad(270,220,350,191,350,247,270,280);

// LE TIMBRE
fill(111,163,203);
strokeWeight(2);
stroke(250,253,255);
    quad(130,178,150,185,150,215,130,207);
    
    
// LE RUBAN
stroke(240,229,184);
strokeWeight(5);
strokeCap(SQUARE); // extrémité avec 2 petits angles brisés
    
    // a gauche
    line(175,175,175,365);
    
    // a droite
    line(330,174,330,357);
    
    // en haut de gauche
    line(175,175,327,129);
    
    // en haut de droite
    line(330,174,183,129);


