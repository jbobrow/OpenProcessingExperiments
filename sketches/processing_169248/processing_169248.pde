
PFont letra;
letra = loadFont("AvenirNext-UltraLight-48.vlw");
textFont(letra, 30);
float dim = 100;
float gradient = 25;
size (1200, 175);
noStroke();
for (int i = 0; i < 255 ; i++){

     fill (i * gradient);
      
     rect (i * dim, 0 , dim, dim);
      
     fill (0);
     float  redondea = i * gradient;
     
     int rz = round (redondea);
     
     text( rz , i * dim + 30, 150);

}


