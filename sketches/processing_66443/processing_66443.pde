
int xsize = 800;
int ysize = 533;

PImage pointto;


void setup() {

  size(800, 533);
 noCursor();
 smooth();
 
}

void draw() {


 
  
  
  if (dist(width/2, height/2, mouseX, mouseY)<=(xsize/6)) {

    pointto = loadImage("CC.jpg");
    image (pointto, 0, 0, xsize, ysize);
  } 
  else if (mouseX<=width/2 && mouseX>=width/3 && mouseY<=height/2) {

    pointto = loadImage("CU.jpg");
    image (pointto, 0, 0, xsize, ysize);
  }else if (mouseX>=width/2 && mouseX<=(width-(width/3)) && mouseY<=height/2) {

    pointto = loadImage("CU.jpg");
    image (pointto, 0, 0, xsize, ysize);
  }
  
  else if (mouseX<=width/2 && mouseX>=width/3 && mouseY>=height/2) {

    pointto = loadImage("CD.jpg");
    image (pointto, 0, 0, xsize, ysize);
  }
  
  else if (mouseX>=width/2 && mouseX<=(width-(width/3)) && mouseY>=height/2) {

    pointto = loadImage("CD.jpg");
    image (pointto, 0, 0, xsize, ysize);
  }
  
  else if (mouseX<=width/2 && mouseY<=height/2) {

    pointto = loadImage("UL.jpg");
    image (pointto, 0, 0, xsize, ysize);
  }else if (mouseX>=width/2 && mouseY<=height/2) {

    pointto = loadImage("UR.jpg");
    image (pointto, 0, 0, xsize, ysize);
  }else if (mouseX<=width/2 && mouseY>=height/2) {

    pointto = loadImage("DL.jpg");
    image (pointto, 0, 0, xsize, ysize);
  }else if (mouseX>=width/2 && mouseY>=height/2) {

    pointto = loadImage("DR.jpg");
    image (pointto, 0, 0, xsize, ysize);
  }
  
  ellipse(mouseX, mouseY,10,10);
}


