
/* @pjs preload="two.png","three.png","four.png","six.png","seven.png","eight.png"; */ 

PImage two; 
PImage three;
PImage four;
PImage six;
PImage seven;
PImage eight;
//PImage nine;
//PImage ten;
//PImage eleven;
//PImage twelve;
//PImage thirteen;
//PImage fourteen;


int i, x, y, w=1410, h=700;

float frameRate = 50;

boolean glitch = false;

void setup(){
size(1410, 700);
two=loadImage("two.png");
three=loadImage("three.png");
four=loadImage("four.png");
six=loadImage("six.png");
seven=loadImage("seven.png");
eight=loadImage("eight.png");
//nine=loadImage("nine.png");
//ten=loadImage("ten.png");
//eleven=loadImage("eleven.png");
//twelve=loadImage("twelve.png");
//thirteen=loadImage("thirteen.png");
//fourteen=loadImage("fourteen.png");

}

void draw(){

  if(glitch==false){
  background(0);
  image(two, 0, 0);
  image(three, 470, 0);
  image(four, 940, 0);
  image(six, 0, 350);
  image(seven, 470, 350);
  image(eight, 940, 350); 
  }
  
  if(glitch==true){
    if(mouseX < width/3 && mouseY < height/2){
      for(i=0;i++<w*h;)set((x=i%w)^mouseX,(y=i/w)^mouseY,two.get(x,y));
    }
    else if(mouseX > width/3 && mouseX < 2*width/3 && mouseY < height/2){
      for(i=0;i++<w*h;)set((x=i%w)^mouseX,(y=i/w)^mouseY,three.get(x,y));
    }
    else if(mouseX > 2*width/3 && mouseY < height/2){
      for(i=0;i++<w*h;)set((x=i%w)^mouseX,(y=i/w)^mouseY,four.get(x,y));
    }
    else if(mouseX < width/3 && mouseY > height/2){
      for(i=0;i++<w*h;)set((x=i%w)^mouseX,(y=i/w)^mouseY,six.get(x,y));
    }
    else if(mouseX > width/3 && mouseX < 2*width/3 && mouseY > height/2){
      for(i=0;i++<w*h;)set((x=i%w)^mouseX,(y=i/w)^mouseY,seven.get(x,y));
    }
    else if(mouseX > 2*width/3 && mouseY > height/2){
      for(i=0;i++<w*h;)set((x=i%w)^mouseX,(y=i/w)^mouseY,eight.get(x,y));
    }
  }
}

void mousePressed(){
  glitch=!glitch;
}

void keyPressed(){
 if(key == ' '){
  saveFrame();
 } 
}


