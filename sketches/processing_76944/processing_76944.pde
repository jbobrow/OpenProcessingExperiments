
PImage img0; PImage img1; PImage img2; PImage img3;

void setup(){
  size (320,300);
  img0 = loadImage("back.png");
  img1 = loadImage("deer.png");
  img2 = loadImage("back2.png");
  img3 = loadImage("back3.png");
}

void draw(){
  image(img0,-75+mouseX/10,-100+mouseY/10);
  if (key == '1' || key == '!'){
    image(img2,-75+mouseX/10,-100+mouseY/10);
  } 
  else if (key == '2' || key == '@'){
    image(img3,-75+mouseX/10,-100+mouseY/10);
  } 
  image(img1,-80+mouseX/4, 15); 
}
 

