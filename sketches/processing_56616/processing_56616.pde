
size(400, 400);
 
// per posar una imatge al fons
// el document "fons.jpg" ha de tenir la mateixa mida que l'sketch
// i ha d'estar a la carpeta "data" dins de la carpeta de l'sketch
//
// PImage b;
// b = loadImage("fons.jpg");
// background(b);
size(600,600);
background(220, 220, 210);
smooth();
 
stroke(1);
line(width/4, 20, width/3+10, height-40);
line(width/3, 40, width/3-10, height-50);
line(width/3+10, height/4, width/3-10, height-10);
 
strokeWeight(2);
stroke(0, 0, 255);
noFill();
ellipse(0.3*width, 0.8*height, 80, 80);
noStroke();
fill(255, 0, 0);
ellipse(0.7*width+5, 0.8*height+7, 50, 50);
noStroke();
fill(255, 0, 0);
ellipse(0.7*width+5, 0.8*height+7, 50, 50);
 
stroke(0);
noFill();
ellipse(width/2-50, height/2-10, 80, 80);

//lins grogues
stroke(255, 255, 0);
strokeWeight(3);
line(20, height/2-30, 0.75*width, height/2-10);

stroke(255, 225, 0);
strokeWeight(3);
line(20, height/3-20, 0.75*width, height/3);

stroke(255, 225, 0);
strokeWeight(3);
line(20, 80, 0.75*width, height/6);

//cercles
noFill();
stroke(0,255,100);
ellipse(40, height/2-30, 40,40);

noFill();
stroke(0,255,150);
ellipse(40, height/3-20, 40,40);

noFill();
stroke(0,255,200);
ellipse(40, 80, 40,40);


noStroke();
fill(0,255,100);
ellipse(400, height/2-30, 40,40);

noStroke();
fill(0,255,150);
ellipse(400, height/3-20, 40,40);

noStroke();
fill(0,255,200);
ellipse(400, 80, 40,40);

