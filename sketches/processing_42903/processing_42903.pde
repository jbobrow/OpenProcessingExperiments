
float bright1=0;
float bright2=0;
float bright3=0;
float bright4=0;

void setup() {
  size(600, 600);
}


void draw() {

background(0);

  if (mouseX < width/2 && mouseY < height/2) {
    bright1 = 255;
   }


else if (mouseX > width/2 && mouseY < height/2) {
     bright2 = 255;
}

else if (mouseX < width/2 && mouseY > height/2) {
  bright3 = 255;
}
else if (mouseX > width/2 &&mouseY > height/2) {
   bright4 = 255;
}

bright1 = bright1 - 1;
bright2 = bright2 - 1;
bright3 = bright3 - 1;
bright4 = bright4 - 1;

noStroke();

fill (bright1);
rect (0, 0, width/2, height/2);
fill (bright2);
rect (width/2, 0, width/2, height/2);
fill (bright3);
rect (0, height/2, width/2, height/2);
fill (bright4);
rect (width/2, height/2, width/2, height/2);

 //lines
 stroke(255);
  line (width/2, 0, width/2, height);
  line (0, height/2, width, height/2);

}

