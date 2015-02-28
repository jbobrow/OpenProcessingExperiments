
color[ ] magenta;
magenta = new color [10];
size (400,400); 
background (random (100,200),random (100,200),random( 100,200), random (50,100)); 
smooth ();

for(int i = 0; i < 10; i++){
  magenta[i] = color(random(100,200),random(100,200),random(100,200),200);
}
int indice = 0;
for (int i = 0; i < 100; i++){
  indice = int (i / 10);


  noStroke ();
  fill (magenta [indice]);
  ellipse(random (width), random (height),random (20,50),random (20,50));

  stroke (0);
  line (0,160,400,160);
  line (0,240,400,240);

  noFill();
  curve (-200,1300, 0,240,240,0,200,200);
  //*CUERPO
  fill (0);
  curve (0,650,130,240,240,240,200,200);
  //*CABEZA
  curve (350,350,240,240,260,240,150,350);
  //*OREJAS
  curve (250,300,240,227,248,227,320,350);
  curve (200,320,250,227,258,227,300,350);
  //*BIGOTES
  line (246,235,220,237);
  line (218,245,246,237);
  line (256,237,285,246);
  line (256,235,285,235);
  //*COLA
  fill (0);
  curve (150,-200,130,240,140,240,150,-200);
  //*PATA
  curve (200,150,200,240,210,240,200,-100);

}





