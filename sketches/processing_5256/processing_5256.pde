
PImage img;
PImage face;
PFont poke;
PShape toast;

String s="YEAAAH YOU'RE MAH BEST FRIEND";
int red;
int green;
int blue;
int count;
void setup() {
  size(1024,768);
  img= loadImage("dance.png");
 face=loadImage("poke.jpg");
 background(face);
 toast=loadShape("toast.svg");

}

  void draw(){
 
   
  }
  
  
  void mouseMoved(){
    tint(255,count);
    image(img,mouseX,mouseY);
    tint(red,blue,green);
    red+=5;
    blue+=3;
    green+=7;
     poke= loadFont("Verdana-Bold-30.vlw");
 textFont(poke);
 stroke(2);
 fill(mouseX,mouseY,0);
 
 text(s,mouseY,mouseX);
// shape (toast,100,200,400 ,400);
    count++;
  }
  
//  void mouseDragged(){
//    image(face,mouseX,mouseY);
//  }

