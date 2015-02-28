
PImage akira ;
PImage hitler;



void setup(){
  size(900,900);
  akira = loadImage("images.jpg");
  
  hitler= loadImage("images-2.jpg");
}


void draw(){

  tint(90,90);
  image(akira,200,200);

  
  image(hitler,200,200);

  fill(4545,4540);

  
}
void mousePressed()  {

 image(akira,mouseX,mouseY,200,200);
 image(hitler,mouseX,mouseY,200,200);


}



