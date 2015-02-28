
PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10;
PImage img11, img12, img13, img14, img15, img16, img17, img18, img19, img20;
float angle = 0; 
int x = 360;
int y = 360;
int w = 80;
int h = 80;

void setup() {
  size(538, 372); 
  img19 = loadImage("17.png");
  img20 = loadImage("18.png");
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("6.png");
  img7 = loadImage("7.png");
  img8 = loadImage("8.png");
  img9 = loadImage("9.png");
  img10 = loadImage("10.png");
  img11 = loadImage("11.png");
  img12 = loadImage("12.png");
  img13 = loadImage("13.png");
  img14 = loadImage("14.png");
  img15 = loadImage("15.png");
  img16 = loadImage("16.png");
  img17 = loadImage("19.png");
  img18 = loadImage("20.png");
  frameRate(10);
}

void draw() {
  image(img19, 0, 0);
  
  tint(255,random(200));
  image(img20, 0, 0);

  tint(255,300);
  image(img12,380,230,200,150);
  image(img1, 70, 120);
  image(img2, 100,190);
  image(img3, 250,230);
  image(img4,350,130);
  image(img5,10,200);
  image(img6,10,250);
  image(img7,270,100);
  image(img8,300,200);
  image(img9,60,100);
  image(img11,150,280);
  image(img14,257,120);
  image(img15,430,150,40,90);
  image(img16,400,20);
  image(img17,20,20,70,70);
  
 if (mousePressed && mouseX>20 && mouseX<90 && mouseY>20 && mouseY<90) {
  tint(random(255));
  image(img17,20,20,70,70);
}

  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(img13, 0, 0);
  popMatrix();  

  image(img10, mouseX, mouseY);
  angle += 0.1;
  
    if (mousePressed == true) {
    tint(random(255),random(300));
    image(img18,mouseX,mouseY,80,80);
    image(img18,mouseX+100,mouseY+100,80,80);
    image(img18,mouseX-100,mouseY-100,80,80);
    image(img18,mouseX+100,mouseY-100,80,80);
    image(img18,mouseX -100,mouseY+100,80,80);
    image(img18,mouseX+200,mouseY,80,80);
    image(img18,mouseX -200,mouseY,80,80);
    image(img18,mouseX,mouseY+200,80,80);
    image(img18,mouseX,mouseY-200,80,80);
  }
}
 
void keyPressed() {
  save("test.png");
}

