
PImage foto;
void setup(){
foto= loadImage("e9dfdd3de6cda3d1acb1b6aec3ab2cea-1.jpg");
size(700,400);
}
void draw(){
//image(foto,0,0);
color c= foto.get(mouseX,mouseY);
float brillo=brightness(c);
fill(c);

ellipse(mouseX,mouseY,brillo*0.07,brillo*0.07);
}


