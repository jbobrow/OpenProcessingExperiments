

PImage[] img = new PImage[10];

PImage imeg1, imeg2, imeg3, imeg4, imeg5, imeg6, imeg7, imeg8;

int copy = 50;
float angle =0;


void setup() {
  size(800, 400);
  background(255);

  imeg1 = loadImage ("95.png");
  //imeg2 = loadImage ("92.png");
  imeg3 = loadImage("94.png");
  imeg4 = loadImage("93.png");
  imeg5 = loadImage("97.png");
  imeg6 = loadImage("98.png");
  imeg7 = loadImage("99.png");
  imeg8 = loadImage("91.png");

  for (int i = 0; i<10; i++) {
    // alpha(50);

    img[i] = loadImage (i+".png");
  }
}


void draw() {


  float a = random(-100, 400);
  float b = random(0, 400);

  for (int i=0; i<10; i++) {
    image(img[i], random(0, 800), random(0, 400), 100, 100);
  }

  /*pushMatrix();
   translate(width/2, height/2);
   rotate(angle);
   //image (imeg2, 0, 0);//grunge
   //image (imeg3, 0,0, 200,200);
   //image (imeg4, 20,20, 200,200);
   //image (imeg5, 140,40, 160,120);
   image (imeg6, 60, 20, 200, 200);
   image (imeg8, 115, 65, 100, 100);
   angle += 0.01;
   popMatrix(); 
   
   
   pushMatrix();
   translate(width/2, height/2);
   image (imeg7, 0, -40, 240, 160);
   image (imeg7, -225, -40, 240, 160);
   image (imeg5, 20, 30, 160, 120);
   image (imeg5, 0, 40, 160, 120);
   image (imeg5, -70, 60, 160, 120);
   image (imeg5, -140, 40, 160, 120);
   image (imeg5, -160, 30, 160, 120);
   popMatrix(); 
   
   //image (imeg3, mouseX,mouseY, 60,60);
   image (imeg1, 250, 50, 300, 300);//skull
   image (imeg3, 290, 130, 130, 100);
   image (imeg4, 400, 140, 100, 100);
   */
}



