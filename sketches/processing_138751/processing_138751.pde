
void setup(){
size(500,500);
}
void draw (){
loadPixels();
for(int i = 0 ; i < pixels.length; i++){
  pixels[i]= color(random(255),0,0);
}
updatePixels();
}

