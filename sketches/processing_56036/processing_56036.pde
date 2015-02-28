
//----------------------
// by lali barriere 2012
//----------------------

size(400, 400);

// per posar una imatge al fons
// el document "fons.jpg" ha de tenir la mateixa mida que l'sketch
// i ha d'estar a la carpeta "data" dins de la carpeta de l'sketch
//
// PImage b;
// b = loadImage("fons.jpg");
// background(b);

background(220, 220, 210);
smooth();

stroke(0);
line(width/4, 20, width/3+10, height-40);
line(width/3, 40, width/3-10, height-50);
line(width/3+10, height/4, width/3-10, height-10);

strokeWeight(2);
stroke(0, 0, 255);
noFill();
ellipse(0.7*width, 0.8*height, 80, 80);
noStroke();
fill(255, 0, 0);
ellipse(0.7*width+5, 0.8*height+7, 50, 50);

stroke(0);
noFill();
ellipse(width/2-50, height/2-10, 80, 80);

stroke(255, 255, 0);
strokeWeight(3);
line(20, height/2-30, 0.75*width, height/2-10);

