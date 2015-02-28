
PImage foto1;
PImage foto2;
PImage foto3;
PImage foto4;
void setup (){
  size ( 800, 800);
   foto1 = loadImage ("foto1.jpg");
    foto2 = loadImage ("foto2.jpg");
     foto3 = loadImage ("foto3.jpg");
      foto4 = loadImage ("foto4.jpg");
}
void draw (){
  background(0);
  if (mouseX>=0 && mouseX<=400 && mouseY>=0 && mouseY<=400 ){
    fill (214,36,224);
    image (foto1,0, 0, 400, 400);
    
}else if (mouseX>=400 && mouseX<=800 && mouseY>=0 && mouseY<=400){
    fill (23, 211,144);
    image (foto2,400, 0, 400, 400);
  
}else if (mouseX>=400 && mouseX<=800 && mouseY>=400 && mouseY<=800){
    fill (241,242, 17);
    image (foto3,400, 400, 400, 400);

}else if (mouseX>=0 && mouseX<=400 && mouseY>=400 && mouseY<=800){
    fill (38,198,18);
    image (foto4,0, 400, 400, 400);
      }

}



