
PImage img;
PImage img1;
PImage img2;
PFont font;

int x =0;
int y=0;


void setup(){
  size(600,400);
  img=loadImage("todolist.jpg");
  img1=loadImage("checkmark.png");
  img2=loadImage("checkmarkun.png");
  font=loadFont("prophecyscript20.vlw");
  textFont(font);
  fill(0);
  
  image(img, 0,0);
  text("wash up", 200, 150);
  text("brush teeth", 200, 185);
  text("blowdry hair", 200, 220);
  text("pick out what to wear", 200, 255);
}

void draw(){
  smooth();

  
   if(mousePressed){
image(img1,mouseX,mouseY);
 

} 

else if (mousePressed && (mouseButton == RIGHT)) {
    image(img,0,0);  
} 
}



