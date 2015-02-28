
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/76944*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage img0; PImage img1; PImage img2; PImage img3;

void setup(){
  size (804,600);
  img0 = loadImage("back.jpg");
  img1 = loadImage("Teacup.png");
  img2 = loadImage("back2.jpg");
  img3 = loadImage("back3.jpg");
}

void draw(){
  image(img0,-75+mouseX/10,-100+mouseY/10);
  if (key == '1' || key == '!'){
    image(img2,-75+mouseX/10,-100+mouseY/10);
  } 
  else if (key == '2' || key == '@'){
    image(img3,-75+mouseX/10,-100+mouseY/10);
  } 
  image(img1,0+mouseX, 15+pmouseY); 
}
 

