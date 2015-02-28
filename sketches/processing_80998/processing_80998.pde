
PImage miImagen;

void setup(){
size(400,800);
}

void draw(){

miImagen=loadImage("Lenna.jpg");
image(miImagen,0,0);
loadPixels();
int j=0;
for(int i=159999;i>=0;i--){
  pixels[160000+j]=pixels[i];
j++;
}

for(int i=1; i<320000;i=i+3){
  pixels[i]= color (random(255),0,0);
}
updatePixels();
}

