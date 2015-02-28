
PImage miImagen;
size(800,400);
miImagen=loadImage("Lenna.jpg");
image(miImagen,0,0);
loadPixels();
for(int i=0;i<400;i++){
  for(int j=0;j<400;j++){
  pixels[i*800+799-j]=pixels[i*800+j];
}
}
updatePixels();


