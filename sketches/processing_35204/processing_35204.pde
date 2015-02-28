
size(720,480);
smooth ();

strokeWeight (2);

background (204);

ellipseMode(RADIUS);

//neck

stroke(102);  //set stroke to grey

line(266,257,266,162);  //left
line(276,257,276,162);  //middle
line(286, 257,286,162); //rigth

//antennae

line(276,155,246,112);   // small
line(276, 155, 306,56);   //tall
line(276, 155, 342,170);   // medium


//Body
 
noStroke ();   //disable stroke

fill(102);

 ellipse (264,377,33,33);  // set fill to gray
 
 fill (0);            // antigravity orb
 
 rect (219,257, 90, 120); 
 
 fill (102);
 
 rect (219, 274, 90, 6); 


//head

fill(0);
ellipse (276, 155,45,45); //cabeza
fill (255);
ellipse (288, 150, 14, 14);  // tamaño ojo
fill (0);    // setea relleno a negro
ellipse (288,150,3,3);  // pupila
fill (153);    // setea relleno a gris claro
ellipse (261,148,5,5); //ojo pequeño 1 
ellipse (296,130,4,4); //ojo pequeño 2
ellipse(305,162,3,3);  // ojo pequeño 3) 










