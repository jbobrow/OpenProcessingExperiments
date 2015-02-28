
PImage img;
PImage img2;


void setup(){
  size(462,600);
  background(0);
  img = loadImage("regular.jpg");
  img2 = loadImage("redeyes.jpg");

}
 
void draw(){
  
  if ((mouseX > 400 || mouseX < 150 || mouseY < 200 || mouseY > 300 )){
     image(img, 0, 0);
  }

  else if((mouseX<300 )){
      image(img2, 0, 0);
  }
 
}



