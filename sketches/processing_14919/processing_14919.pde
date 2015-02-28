
PImage groucho;

void setup(){
  size(300,300);
  groucho = loadImage("Groucho.jpg");
  
}

void draw(){
  //background(0);
  tint(255.50,50); //up to four numbers
  //image(groucho, 50, 50);
  image(groucho, mouseX, mouseY);
}


//EXPORT when using image, right click applet folder, "Compress", and Upload

