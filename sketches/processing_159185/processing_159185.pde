
PImage foto;
void setup(){
foto= loadImage("chica.jpg");
size(foto.width,foto.height);
}
void draw(){
  for(int x=0;x<width;x+=5)
  for(int y=0;y<height;y+=10){
    color c = foto.get (x,y);
    float brillo =brightness(c);
    fill(c);
  ellipse(x,y,brillo/3,brillo/3);
  }
}


