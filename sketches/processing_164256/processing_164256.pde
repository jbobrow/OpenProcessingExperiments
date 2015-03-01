
size (400, 400);

noStroke ();
fill (#FF008D);
rect (0, 0, 400, 400);
fill (#FF31A3);
rect (21, 21, 357.5, 357.5);
fill (#FF48AD);
rect (42, 42, 315, 315);
fill (#FF5FB7);
rect (63, 63, 273.5, 273.5);
fill (#FF6CBD);
rect (84, 84, 230, 230);
fill (#FF81C6);
rect (105, 105, 187.5, 187.5);
fill (#FF9DD3);
rect (126, 126, 145, 145);


translate (-3, 68); //Necesitaba mover la cara para centrarla


//Huecos llenados
fill (255);
rect (102, 60, 188, 60);

stroke (0);
strokeWeight (8);
  //orejas
    //derecha
bezier (250, 50, 300, 25, 300, 50, 294, 100);
    //izquierda
bezier (106, 100, 90, 40, 110, 40, 150, 60);


//CONTORNO CARA
bezier (294, 100, 350, 230, 50, 250, 110, 90); 
arc (200, 130, 200, 160, radians (240), radians (300));
  

noFill ();

  //bigotes
strokeWeight (6.5);
    //derecha
arc (350, 170, 200, 100, radians (230), radians (260));
arc (275, 195, 200, 100, radians (280), radians (300));
arc (222, 202, 200, 100, radians (310), radians (335));
    //izquierda
arc (54, 170, 200, 100, radians (280), radians (310));
arc (129, 195, 200, 100, radians (240), radians (260));
arc (182, 202, 200, 100, radians (205), radians (230));

//CARA
  //ojos
strokeWeight (3.5);
fill (0);
ellipse (150, 145, 10, 18);
ellipse (250, 145, 10, 18);

  //boca
strokeWeight (5);
fill (#EAB800);
ellipse (200, 165, 22, 14);

  //FLOR
noStroke();
fill (#FF40AA);
ellipse (225,80,45,45);
  
stroke(0);
fill (#EAB800);
ellipse (228, 80, 15, 15);

strokeWeight (6);
fill (#FF40AA);
bezier (230, 60, 240, 25, 285, 55, 245, 75);
bezier (245, 75, 286, 85, 260, 125, 236, 95);
bezier (236, 95, 239, 140, 201, 120, 214, 95);
bezier (214, 95, 180, 105, 176, 73, 211, 72);
bezier (211, 72, 180, 40, 220, 32, 230, 60);
