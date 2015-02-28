
PFont font1, font2, font3; 

String p1 = "Do you need a friend?"; 
String p2 = "Why do we need friends?"; 
String p3 = "you know what?? we don't need them!"; 
String p4 = "so beat it"; 
String p5 = "as a result"; 
String p6 = "luv me"; 
 
int page = 0;
PImage image1, image2, image3, image4;


void setup() {
  size(480, 800); 
  font1 = loadFont("BritannicBold-48.vlw");
  font2 = createFont("ArialMT-48.vlw", 100);
  font3 = createFont("Aparajita-Bold-48.vlw", 80);

  image1 = loadImage("1.jpg");
    image2 = loadImage("2.jpg");
      image3 = loadImage("3.jpg");
      image4 = loadImage("4.jpg");
      }

      void draw() {
        textAlign(CENTER);

        if (page ==0) {
          background(183, 224, 255); 
          image(image1, 0, 0);
          fill(173, 0, 104);
          textFont(font2, 40); 
          text(p1, width/2, height/2);
        }
        else if (page ==1) {
          background(0); 
          image(image2, 0, 0);
          fill(34, 172, 0);
          textFont(font1, 34); 
          text(p2, width/2, 200);
        }  
        else if (page ==2) {
          background(239, 209, 255); 
          image(image3, 0,0);
          fill(169, 0, 255);
          textFont(font1, 26); 
          text(p3, width/2, 600);
        }
        else if (page ==3) {
          background(255, 209, 210); 
          image(image4, 0, 0);
          fill(0);
          textFont(font1, 70); 
          text(p4, width/2, 700);
          //rect(100, 100, 100, 100);
        }
      }


void mousePressed() {
  if ( page  == 0) {
    page  = 1;
  }
  else if ( page  == 1) {
    page  = 2;
  }
  else if ( page  == 2) {
    page  = 3;
  }
  else if ( page  == 3) {
    page =0;
  }
  //....
  println(page);
}
