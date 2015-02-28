
PImage ImagenEspejo;
size(400,200);
ImagenEspejo=loadImage("lena.jpg");
image(ImagenEspejo,0,0);
loadPixels();
for(int i=0;i<200;i++){
  for(int j=0;j<200;j++){
  pixels[i*400+399-j]=pixels[i*400+j];
}
}
updatePixels();


