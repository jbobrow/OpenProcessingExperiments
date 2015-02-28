
PFont font1, font2, font3, font4;
PImage img0, img1, img2, img3;

String p1 = "TO A SKYLARK";

String p2 = " Percy Bysshe Shelley";

String p3 = " Hail to thee, blithe Spirit!";
String p4 = " Bird thou never wert,";
String p5 = " That from Heaven, or near it,";
String p6 = " Pourest thy full heart";
String p7 = " In profuse strains of unpremeditated art.";
String p8 = " Higher still and higher";
String p9 = " From the earth thou springest";
String p10 = " Like a cloud of fire;";
String p11 = " The blue deep thou wingest";
String p12 = " And singing still dost soar, and soaring ever singest.";

int page =0;

void setup() {
  size(480, 750);
  font1 = loadFont("Myra4FCaps-48.vlw");
  font2 = loadFont("Mosaicleaf-100.vlw");
  font3 = loadFont("Magnolia-Regular-48.vlw");
  font4 = loadFont("Courier-100.vlw");

  img0 = loadImage("P1.jpg");
  img1 = loadImage("P2.jpg");
  img2 = loadImage("P3.jpg");
  img3 = loadImage("P4.jpg");
}

void draw() {

  background(255, 0, 0);

  if (page == 0) {
    background(180, 240, 219);

    textFont(font1, 40);
    text(p1, width/6, height/5);
    textFont(font1, 20);
    text(p2, width/4, height/4);
  }
  else if (page ==1) {
    image(img3, 0, 0);
    fill(255);
    textFont(font4, 20);
    text(p3, width/15, 80);
    stroke(255);
    strokeWeight(2);
    line(width/4, 190, 390, 190);
    text(p4, width/4, height/4);
  }
  else if (page ==2) {
    background(0);
    image(img2, 0, 0);
    textFont(font4, 18);
    text(p5, 20, 600);
    text(p6, 20, 620);
     text(p7, 20, 660);
  }
  else if (page ==3) {
 image(img2, 0, 0);
    textFont(font3, 30);
    text(p8, 10, 375);
  }
  else if (page ==4) {
    image(img0, 0, 0);
    
    textFont(font3, 50);
    text(p9, 0, 550);
    text(p9, -540, 620);
    text(p10, 0, 690);
     text(p10, -470, 760);
    
  }
  else if (page ==5) {
     image(img1, 0, 0);

    textFont(font3, 50);
    text(p11, 8, 550);
    text(p11, -460, 610);
  }
  else if (page ==6) {
    image(img1, 0, 0);
    textFont(font4, 20);
    text(p12, 10, 200);
    text(p12, -300, 230);
  }
  else if (page ==7) {
    background(0);
   
  textFont(font1, 40);
    text(p1, width/6, height/5);
  
    
  }
}
void mousePressed() {
  if (page == 0) {
    page =1;
  } 
  else if  (page == 1) {
    page =2;
  }
  else if  (page == 2) {
    page =3;
  }
  else if  (page == 3) {
    page =4;
  }
  else if  (page == 4) {
    page =5;
  }
  else if  (page == 5) {
    page =6;
  }
  else if  (page == 6) {
    page =7;
  }
  else if  (page == 7) {
    page =8;
  }
  else if  (page == 8) {
    page =9;
  }
}



