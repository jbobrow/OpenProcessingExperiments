
PImage stop;
String command;

void setup(){
  size (1024,768);
  fill (#7C7878);
  stop = loadImage ("download.jpg");
  fill (#000000);
  textAlign(CENTER,BOTTOM);
  textSize(68);
  command = " Press and Hold Any Key to Use ";
  text (command, 512,500);
}

void draw (){
  if (keyPressed==true){
  if (mousePressed){
    rectMode (CENTER);
    fill (#0E02CB);
    stroke (#000000);
    rect (512,384,mouseX,mouseY);
    fill (#FF1515);
    stroke (#FFFFFF);  
    ellipseMode (CENTER);
    ellipse (512,384,mouseX-20,mouseY-20);
  }
  else {
    stroke (#000000);
    fill (#FF8E03);
    rectMode (CENTER);
    rect (512,384,mouseX,mouseY);
    stroke (#FFFFFF);
    fill (#000000);
    ellipseMode (CENTER);
    ellipse (512,394,mouseX-20,mouseY-20);
  }
}
else {
  background (#7C7878);
  imageMode (CENTER);
  image (stop,mouseX,mouseY,248,200);
  textAlign (CENTER,BOTTOM);
  text (command,512, 500);
}
}
    


