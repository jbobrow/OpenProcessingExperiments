

int x;
int y;
PImage miImagen;
size(800,400);
miImagen=loadImage("calaca.jpg");
image(miImagen,0,0);
loadPixels();//cargar de pixeles

//duplicar imagen lado derecho ventana
for(y=0;y<height;y+=1){
  for(x=0;x<width/2;x+=1){
    pixels[x+400+y*width]=pixels[x+y*width];
  }
}
// poner imagen en blanco y negro
for(y=0;y<height;y+=1){
  for(x=0;x<width/2;x+=1){
color tono=color(pixels[x+400+y*width]);
float gris=red(tono)+green(tono)+blue(tono)/3;
 pixels[x+400+y*width]=color(gris);

  }
}

//imagen izquierda ventana- poner rayas en la imagen de la derecha
for(y=0;y<height;y=y+8){
    for(x=400;x<width;x++){// para que ignore el resto de la ventana y solo use el ancho de la imagen
      pixels[x+y*800]=color(0,255,0);
  }
}
for(y=1;y<height;y=y+4){
    for(x=400;x<width;x++){
      pixels[x+y*800]=color(255,0,0);
  }
}
for(y=1;y<height;y=y+10){
    for(x=400;x<width;x++){
      pixels[x+y*800]=color(0,0,255);
  }
}


updatePixels();



