
PImage img1;
PImage img2;
PImage img3;
PImage img4;

void setup(){
  size(340, 350);
  
  img1 = loadImage("http://3.bp.blogspot.com/__lKAPG3mt5k/TEdJdTf0snI/AAAAAAAAALc/ut8Dh8JQOmw/s400/Seamless+Texture.jpg");
  img2 = loadImage("http://www.aforgenet.com/framework/features/imaging/textile_texture.jpg");
  img3 = loadImage("http://www.ecosystem3d.com/corsi/moduloa/Lezione051/Stripes5.jpg");
  img4 = loadImage("http://us.123rf.com/400wm/400/400/troyka/troyka1109/troyka110900012/10616354-seamless-con-texture-geometrica.jpg");
}

void draw(){
  
  colorMode(HSB, 500); 
  background(0, 0, mouseX+mouseY/2);
   
  image(img1, 250, mouseY/2, 250, 250);
  image(img2, 0, mouseY/2, 250, 250);
  image(img4, mouseX/2, 250, 250, 250);
  image(img3, mouseX/2, 0, 250, 250);

  // image(imageVariable, x, y);
  image(img2, width/2, 0);
  image(img3, 0, height/2);
  image(img4, 0, 0, width/2, height/2);
  image(img1, 0, 0, mouseX, mouseY);
}
