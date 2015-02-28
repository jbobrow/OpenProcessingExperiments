
PImage cake;
PImage bg;
PImage cakecopy;




void setup () {
  size (1000,600);
  background (255,148,213);  

  cake = loadImage("cake.png");
  bg= loadImage ("bg.png");
  cakecopy= loadImage ("cakecopy.png");
}




void draw () {
  imageMode (CORNER);
  bg.resize (1000,600);
  image (bg, 0,0);

  //cake.resize (75,55) ;
  //scale (2);
  

        imageMode (CENTER);
         image (cake,mouseX,mouseY);
  if (mousePressed) {
    imageMode (CENTER);
         image (cakecopy,mouseX,mouseY);
   }
   else{
   }
   
   if (keyPressed) {
   if (key == 's') {
     saveFrame ("ca_########.jpg");
   }  
   }
}



