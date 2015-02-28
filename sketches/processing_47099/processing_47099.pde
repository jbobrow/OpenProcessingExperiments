
PImage foto;
PImage foto1;
PImage foto2;
void setup (){
  size(600,600);
  foto = loadImage("botticelli-young-woman.jpg");
  foto1 = loadImage("galaxia-roja.jpg");
  foto2 = loadImage("tumblr_loyuyv.jpg"); 
}

void draw(){
background (0);
 tint(121,90,78,250);
image  (foto,0,0,600,600);
{
  

 tint(190,137,58,190);
  image(foto,mouseX,mouseY,600,500);
 tint(110,17,108,200);
  image(foto1,0,mouseX,600,mouseY);
  tint(200,37,170,200);
  image(foto2,0,300,mouseX,mouseY);
   
}
}

