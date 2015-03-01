
PImage Img1;
PImage Img2;
PImage Img3;
PImage Img4;

void setup() { 
  size(1000, 700); 
  smooth(); 

  Img2 = loadImage("dog-03.png");
  Img3 = loadImage("dog-04.png");
  Img4 = loadImage("dog-05.png");
}
void draw() { 
  tint(255,30);
  for (int a=-30; a<1000; a+=70) {
    for (int b=-30; b<700; b+=70) {
      if ((keyPressed == true) && (key == 'A')) {
        image(Img2, a, b);
      } else if ((keyPressed == true) && (key == 'B')) {
        image(Img3, a, b);
      } else if ((keyPressed == true) && (key == 'C')) { 
        image(Img4, a, b);
      }
      fill(237, 109, 0);
    }
  }


  textAlign(CENTER);
  text("try 'A','B','C'", width/2, height/4);
}



