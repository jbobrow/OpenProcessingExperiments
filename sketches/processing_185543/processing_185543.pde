
PImage head;
PImage body;
PImage armL;
PImage armR;
PImage green;
PImage space;
void setup(){
  size(900,600);
  imageMode(CENTER);
  head =loadImage("eva_head.png");
  body =loadImage("eva_body.png");
  armL =loadImage("eva_armL.png");
  armR =loadImage("eva_armR.png");
  green = loadImage("eva_green.png");
  space = loadImage("outerspace.jpg");
  smooth();
  frameRate(30);
}
void draw (){
  background(0);
  image(space,width/2,height/2);
image(armR,mouseX+140,pmouseY-20);
image(body,mouseX,mouseY);
image(armL,mouseX-95,pmouseY+22);
image(head,pmouseX,pmouseY-190);


if (keyPressed){
  image(green,mouseX,mouseY-50,45,45);
}

}



