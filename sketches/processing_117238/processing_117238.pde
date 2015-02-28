
PFont font1, font2, font3; 
PImage img1, img2, img3, img4, img5,img0;
 

String p1 = "I want be your friend"; 
String p2 = "But he dosen't like me"; 
String p3 = "I want be your friend"; 
String p4 = "He is playing with me like a toy."; 
String p5 = "And he killed me using a tool"; 
String p6 = "I'll revenge "; 

//.... 
int page = 0;


void setup() {
  size(500, 700); 
  font1 = loadFont("Dialog.plain-48.vlw");
  font2 = createFont("8PinMatrix-48.vlw", 100);
  font3 = createFont("Georgia", 80);

  img0 = loadImage("0.jpg");
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");
  img5 = loadImage("5.jpg");


}
void draw() {
  textAlign(CENTER);

  if (page ==0) {
  image(img0, 0, 0);
    
    textFont(font2, 30); 
    text(p1, width/2, height/2);
  }
  else if (page ==1) {

   image(img1, 0, 0);
 
    fill(255, 255, 0);
    textFont(font1, 50); 
    text(p2, width/2, 100);
  }  
  else if (page ==2) {
    image(img2, 0, 0);
    fill(255, 255, 0);
    textFont(font3, 50); 
    text(p3, width/2, 700);
  }
  else if (page ==3) {
    image(img3, 0, 0);
    fill(0);
    textFont(font3, 30); 
    text(p4, width/2, 700);
    
  }
 
 else if (page ==4) {
     image(img4, 0, 0);
    fill(255, 0, 0);
    textFont(font2, 30); 
    text(p5, width/2, height/2);
  }
   
 else if (page ==5) {
    image(img5, 0, 0);
    fill(255, 0, 0);
    textFont(font2, 100); 
    text(p6, width/2, height/2);
  }

  

}


void mousePressed() {
  if ( page  == 0) {
    page  = 1;
  }
  else if ( page  == 1) {
    page  = int(random(2, 4));
  }
  else if ( page  == 2) {
    page  = int(random(1, 5));
  }
  else if ( page  == 3) {
    page =0;
  }
  
    else if ( page  == 4) {
    page =0;
  }
  
      else if ( page  == 5) {
    page =0;
  }
  //....
  println(page);
} 




