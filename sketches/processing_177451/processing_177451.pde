
//working with image

//declare PImage
PImage compoImage1;
PImage compoImage2;

//load an image from HDD

void setup () {
 size(800, 800);
 compoImage1=loadImage("compoImage1.png");
 compoImage2=loadImage("compoImage2.png");
  
}

// draw image on screen at (0,0)

void draw (){
  //float dy = (mouseY) ;
  //float dx = (mouseX) ;
  //println(dy);
  //println(compoImage1.height/2);
  //println(mouseY);
  image(compoImage2, 0, 0, 800, 800);
  tint(255,mouseX/4);  // Apply transparency without changing color
  image(compoImage1, 0, 0, 800, 800);  
  tint(255,mouseY/4);  // Apply transparency without changing color
  
}

