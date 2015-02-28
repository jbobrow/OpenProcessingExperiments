

size (600,600) ;
background (255) ;

// Point :
stroke (0); // Couleur de contour
point (30,30); // point (x,y) ;
point (60,30);
point (90,30);

// Ligne :
strokeWeight (5); // Epaisseur du trait
strokeCap(SQUARE); // Extrêmité du trait
line (30,80,130,180); // line(x1,y1,x2,y2) ;

// Rectangle :
strokeWeight (1);
fill(255,0,255,50) ; // Couleur de remplissage (r,v,b,Alpha)
rect(190,30,150,150) ; // (x,y,largeur,hauteur)

// Ellipse :
smooth();
stroke (255,0,0) ;
fill (0,0,255,50) ;
ellipseMode(CORNER); // (CENTER) par défaut
ellipse(190,250,150,150) ; // (x,y,largeur,hauteur)

// Triangle :
stroke (255,0,0,75) ;
fill (0,255,255,75) ;
triangle (380,180,470,30,560,180) ; // (x1,y1,x2,y2,x3,y3)

// Quadrilatère :
stroke (0,255,0,75) ;
fill (255,255,0,50) ;
quad (380,260,560,250,510,420,410,360) ; // (x1,y1,x2,y2,x3,y3,x4,y4)

// Courbes de bézier :
stroke (0,0,255) ;
bezier (60,510,10,420,360,460,310,560); // (x1,y1,ax1,ay1,ax2,ay2,x2,y2);
noFill() ; // Pas de couleur de remplissage
bezier (310,510,260,420,610,460,560,560);




