
void setup () {
size (500, 500);
smooth ();

}


void draw () { 
  
//Fondo
noStroke ();
fill (#FF008D);
rect (0, 0, 500, 500);
fill (#FF31A3);
rect (29.15, 29.15, 441.7, 441.7);
fill (#FF48AD);
rect (58.3, 58.3, 383.4, 383.4);
fill (#FF5FB7);
rect (87.45, 87.45, 325.1, 325.1);
fill (#FF6CBD);
rect (116.6, 116.6, 266.8, 266.8);
fill (#FF81C6);
rect (145.75, 145.75, 208.5, 208.5);
fill (#FF9DD3);
rect (174.9, 174.9, 150.2, 150.2);


  noCursor ();
  
//Huecos llenados
fill (255);
rect (mouseX-101, mouseY-72, 188, 60);

stroke (0);
strokeWeight (8);
  //orejas
    //derecha
bezier (mouseX+50, mouseY-74, mouseX+97, mouseY-107, mouseX+97, mouseY-82, mouseX+91, mouseY-32);
    //izquierda
bezier (mouseX-97, mouseY-32, mouseX-113, mouseY-92, mouseX-93, mouseY-92, mouseX-53, mouseY-72);


//CONTORNO CARA
bezier (mouseX+91, mouseY-32, mouseX+147, mouseY+98, mouseX-153, mouseY+118, mouseX-93, mouseY-42); 
arc (mouseX-3, mouseY-2, 200, 160, radians (240), radians (300));
  
  
noFill ();

  //bigotes
strokeWeight (6.5);
    //derecha
arc (mouseX+147, mouseY+38, 200, 100, radians (230), radians (260));
arc (mouseX+72, mouseY+63, 200, 100, radians (280), radians (300));
arc (mouseX+19, mouseY+70, 200, 100, radians (310), radians (335));
    //izquierda
arc (mouseX-149, mouseY+38, 200, 100, radians (280), radians (310));
arc (mouseX-74, mouseY+63, 200, 100, radians (240), radians (260));
arc (mouseX-21, mouseY+70, 200, 100, radians (205), radians (230));

//CARA
  //ojos
strokeWeight (3.5);
fill (0);
ellipse (mouseX-53, mouseY+13, 10, 18);
ellipse (mouseX+47, mouseY+13, 10, 18);

  //boca
strokeWeight (5);
fill (#EAB800);
ellipse (mouseX-3, mouseY+33, 22, 14);

  //FLOR
noStroke();
fill (#FF40AA);
ellipse (mouseX+22, mouseY-52, 45, 45);
  
stroke(0);
fill (#EAB800);
ellipse (mouseX+25, mouseY-52, 15, 15);

strokeWeight (6);
fill (#FF40AA);
bezier (mouseX+27, mouseY-72, mouseX+37, mouseY-107, mouseX+82, mouseY-77, mouseX+42, mouseY-57);
bezier (mouseX+42, mouseY-57, mouseX+83, mouseY-47, mouseX+57, mouseY-7, mouseX+33, mouseY-37);
bezier (mouseX+33, mouseY-37, mouseX+36, mouseY+8, mouseX-2, mouseY-12, mouseX+11, mouseY-37);
bezier (mouseX+11, mouseY-37, mouseX-23, mouseY-27, mouseX-27, mouseY-59, mouseX+8, mouseY-60);
bezier (mouseX+8, mouseY-60, mouseX-23, mouseY-92, mouseX+17, mouseY-100, mouseX+27, mouseY-72);


println(mouseX + ", " + mouseY);
}
