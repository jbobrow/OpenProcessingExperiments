
PFont Zapfinio;
PFont Herculanum;
PImage myImage;
PImage myImage2;
void setup () {
  size (700,700);
background(0,0,0);
  Zapfinio = loadFont("Zapfino-24.vlw");
  Herculanum = loadFont("Herculanum-48.vlw");
  myImage = loadImage("mrbond.jpg");
  myImage2 = loadImage("bullet.jpg");
}

 

void draw(){
  

  
  tint(200,0,0,255);
  image(myImage,0,0);
  
  tint(150,50,50,200);
  image(myImage2,570,55,20,20);
  
  fill(255,0,0,200);
  textFont(Zapfinio);
  text ("!",mouseX,mouseY);
  
  fill(0,100,100,200);
  textFont(Herculanum);
  text ("hello",20,50);
}

