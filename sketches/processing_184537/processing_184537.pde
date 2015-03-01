
/* @pjs preload="img.jpg"; */
/* @pjs preload="imgJ.jpg"; */
/* @pjs preload="imgN.jpg"; */

PImage img, imgJ, imgN;


void setup () {
  size(426, 547);
  img = loadImage("img.jpg");
  imgJ = loadImage("imgJ.jpg");
  imgN = loadImage("imgN.jpg");
}


void draw () {
  if (mouseX>=70 && mouseX<=165 && mouseY>=430 && mouseY<=520) {
    image(imgJ, 0, 0);
  } else if (mouseX>=260 && mouseX<=380 && mouseY>=465 && mouseY<=520) {
    image(imgN, 0, 0);
  } else {
    image(img, 0, 0);
  }
}
void mousePressed() {
  link("mailto:abel_schupp@hotmail.com");
}



