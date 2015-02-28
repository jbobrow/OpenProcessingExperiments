
//var audioElement = document.createElement("audio");
PImage foto;
float A=mouseX;
float B=mouseY;
float p=40;
import gifAnimation.*;

//gif

Gif myAnimation;
void setup() {
  //gif
  background(0);
  	size(550,500);
	myAnimation = new Gif(this, "038.gif");
	myAnimation.play();
//foto
foto=loadImage("Ojo-1.png");
 //imageMode(CENTER);
 noCursor();
}

void draw() {
//gif	
 image(myAnimation, 0,0);
  //foto
image(foto,mouseX-210,mouseY-230,400,400);

}

  //void mousePressed(){
   //audioElement.setAttibute("src","sound.aif");
  //audioElement.play();
  //}
  


