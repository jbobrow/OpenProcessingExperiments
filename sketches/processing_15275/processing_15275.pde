
PImage texture1;
PImage texture2;
PImage texture3;

void setup(){
  size(700,600);
  texture1 = loadImage("Texture1.jpg");
  texture2 = loadImage("Texture2.jpg");
  texture3 = loadImage("Texture3.jpg");
  
}

void draw(){
  tint(100,200,100,60); //up to four numbers
  image(texture1, mouseX, mouseY);

  tint(255,50,100,30); //up to four numbers
  image(texture3, 0, 0);

  tint(255,50,100,50); //up to four numbers
  image(texture2, 0, 0);

  
}


//EXPORT when using image, right click applet folder, "Compress", and Upload

