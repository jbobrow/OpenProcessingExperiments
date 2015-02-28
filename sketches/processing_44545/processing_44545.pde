
PFont font; //declare variable
PImage myImage;
 
void setup(){
  size(800,600);
  myImage=loadImage("mail.jpg");
  font= loadFont ("Helvetica-Black-40.vlw");
  textFont(font); //variable font current and active
  smooth();
  textAlign(CENTER);
}
 
void draw(){
  image(myImage,0,0);//img location
  if (mousePressed==true) {//on mouse-pressed
  fill(random(100),random(20),random(100));// rainbow flash of colours
  text("PAY THE BILLS",random(mouseX),random(0,600),random(mouseY),random(0,800));
  }
}


