
PImage myimage;
PImage secondimage;

void setup(){
 size(400, 400);
 myimage = loadImage("pic.jpg");
 secondimage = loadImage("tree5.jpg");
 frameRate(5);  //how fast DRAW runs the program
}

void draw(){
  //image(image name, top left x, top left y);
  
  tint(255, 50); //changes brightness
  image(myimage, 0, 0, width, height);
  
  tint(255, random(200), random(200), 100);
  image(secondimage, random(200), random(200));
  
  
}

