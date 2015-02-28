
import netscape.javascript.*;



PFont font1, font2; 
PImage img0, img1, img2, img3, img4, img5, img6, img7, img8, img9;
String p0 = "leave on a trip of the 2 ending poem."; 
String p1 = "The year's at the spring,"; 
String p2 = "And day's at the morn"; 
String p3 = "Morning's at seven";
String p4 = "The hill-side's dew-pearled";
String p5 = "The lark's on the wing";
String p6 = "The snail's on the thorn";
String p7 = "God's in his heaven";
String p8 = "All's right with the world.";
String p9 = "but, All's dark with the world.";



int poem = 0; 
//int poem = 1; 
//int poem = 2; 
//int poem = 3; 
//int poem = 4; 
//int poem = 5; 
//int poem = 6; 
//int poem = 7; 
//int poem = 8; 
//int poem = 9; 
//int textX = 580;
//int textY = 430;


void setup() {
  img0 = loadImage("0.jpg");
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");
  img5 = loadImage("5.jpg");
  img6 = loadImage("6.jpg");
  img7 = loadImage("7.jpg");
  img8 = loadImage("8.jpg");
  img9 = loadImage("9.jpg");


  size(800, 600);
  font1 = loadFont("BrainFlower-100.vlw");
  font2 = loadFont("JellykaCuttyCupcakes-100.vlw");
}

void draw() {
  textAlign(CENTER);
  if (poem == 0) {
    image(img0, 0, 0);
    //background(255, 0, 100);
    textFont(font2, 90);
    text(p0, width/2+20, height/2+250);
    /*   
     code here to draw something for the first poem,     
     or create poem funtions such as 
     cardOne();
     
     */
  }  
  else if (poem == 1) {  
    image(img1, 0, 0);
    fill(137, 252, 164);
    textFont(font1, 100);
    text(p1, width/2, height/2-100);
  }  
  else if (poem == 2) {  
    image(img2, 0, 0);
    textFont(font1, 100);
    text(p2, width/2, height/2-100);
  } 
  else if (poem  == 3) {  
    image(img3, 0, 0);
    fill(255, 189, 237);
    textFont(font1, 100);
    text(p3, width/2, height/2-100);
  }
  else if (poem  == 4) { 
    image(img4, 0, 0);
    textFont(font1, 100);
    text(p4, width/2, height/2+100);
  }
  else if (poem  == 5) {  
    image(img5, 0, 0);
    fill(92, 244, 254);
    textFont(font1, 100);
    text(p5, width/2, height/2);
  } 
  else if (poem  == 6) {  
    image(img6, 0, 0);
    textFont(font1, 100);
    text(p6, width/2, height/2);
  } 
  else if (poem  == 7) {  
    image(img7, 0, 0);
    fill(255, 255, 255);
    textFont(font1, 100);
    text(p7, width/2, height/2-100);
  } 
  else if (poem == 8) {  
    image(img8, 0, 0);
    textFont(font1, 100);
    text(p8, width/2, height/2-100);
  }
  else if (poem == 9) {  
    image(img9, 0, 0);
    textFont(font1, 80);
    text(p9, width/2, height/2-100);
  }
}


void mousePressed() {  

  if (poem == 0) {  
    poem = 1;
  } 
  else if (poem == 1) {  
    poem = 2;
  }
  else if (poem == 2) {
    poem = int(random(3, 9));
  }
  else if (poem == 3) {
    poem = int(random(9, 4));
  }  
  else if (poem == 4) {
    poem = 5;
  }  
  else if (poem == 5) {
    poem = int(random(0, 8));
  } 
  else if (poem == 6) {
    poem = 7;
  }
  else if (poem == 7) {
    poem = 8;
  }
  else if (poem == 8) {
    poem = int(random(0, 9));
  }
  else if (poem == 9) {
    poem = 0;
  }
  println(poem);
}




