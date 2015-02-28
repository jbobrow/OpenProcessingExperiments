
PImage img;

void setup () {;
size (250,250);
img = loadImage("image.jpg");

}

void draw () {
  
noCursor ();
  noStroke ();
  background (0); //(#000000);
  image(img,0,0);
 
 
 //not clicked
 if (mousePressed == false) {
    stroke (#F7FF15,100);
      for (int x = 0; x < 255; x+=10){
    line (x,250, mouseX, mouseY);
    line (250,x, mouseX, mouseY);
    line (x,0,mouseX,mouseY);
    line (0,x,mouseX,mouseY);
    line (mouseX,0,mouseY,250);
    line(0,mouseX, 250, mouseY);

    
    ellipseMode (CENTER);
    noFill ();
    ellipse (mouseX,mouseY,80,80);
    ellipse (mouseX,mouseY,80,80);
    ellipse (mouseX,mouseY,60,60);
    ellipse (mouseX,mouseY,40,40);
    ellipse (mouseX, mouseY, 20,20);
        fill (#818181,10);
      }
      
      //clicked
  } else {
  if (mousePressed == true) {
      stroke (#B71E1E,100);
  for (int x = 0; x < 255; x+=10){
    line (x,250, mouseX, mouseY);
    line (250,x, mouseX, mouseY);
    line (x,0,mouseX,mouseY);
    line (0,x,mouseX,mouseY);
    line (250,mouseY,0,mouseY);
    line (mouseX,0,mouseX,250);

    line(0,mouseX, 250, mouseY);
   
    rectMode (CENTER);
    noFill ();
    rect (mouseX,mouseY,45,45);
     rect (mouseX,mouseY,65,65);
      rect (mouseX,mouseY,85,85);
    ellipse (mouseX, mouseY, 20,20);
    fill (#818181,10);
  }
}
}
}


