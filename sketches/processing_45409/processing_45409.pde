
size (650, 650);

background (0);

stroke (240,210,39);      // color del trazo

strokeWeight (1);    // ancho del pincel

strokeWeight (2); 
for (int i=0; i<650; i+= 10){ 
  line (325,i,0,325);     // linea line
}

for (int i=0; i<650; i+= 10){ 
  line (650,325,325,i);     // linea line
}
                
