
PFont f, f1, f2; 

Face myFace1; 
Face myFace2, myFace3, myFace4;
Glasses myGlasses1;
Glasses myGlasses2, myGlasses3, myGlasses4;

float y = 100;

int selectedKey = 1;

void setup() {
  size(900, 400);
  smooth();
  frameRate(30);
  f = createFont("ArialMT", 14, true);
  f1 = createFont("ArialMT", 30, true);
  f2 = createFont("ArialMT", 11, true);

  //Character 1
  myFace1 = new Face(50, 105, 20, 30, PI/2, PI, color(254, 245, 221), 
  100, 105, 100, 120, color(254, 245, 221), 
  100, 100, 5, 5, color(255), 50, 30, 
  100, 125, 2, 2, color(0), 
  100, 120, 55, 50, 0, PI/2, color(248, 113, 82));
  myGlasses1 = new Glasses(100, 100, 35, 35, 50);

  //Character 2
  myFace2 = new Face(250, 105, 20, 30, PI/2, PI, color(255, 238, 169), 
  300, 105, 100, 120, color(255, 238, 169), 
  300, 100, 3, 3, color(0), 50, 45, 
  300, 125, 2, 2, color(0), 
  300, 120, 35, 30, 0, PI/2, color(248, 113, 82));
  myGlasses2 = new Glasses(300, 100, 25, 25, 50);

  //Character 3
  myFace3 = new Face(450, 105, 20, 30, PI/2, PI, color(202, 153, 22), 
  500, 105, 100, 120, color(202, 153, 22), 
  500, 100, 3, 3, color(0), 50, 40, 
  500, 125, 2, 2, color(0), 
  500, 120, 70, 45, 0, PI/2, color(248, 113, 82));
  myGlasses3 = new Glasses(500, 100, 25, 25, 50);

  //Character 4
  myFace4 = new Face(650, 105, 20, 30, PI/2, PI, color(84, 63, 5), 
  700, 105, 100, 120, color(84, 63, 5), 
  700, 100, 3, 3, color(0), 50, 60, 
  700, 125, 2, 2, color(0), 
  700, 130, 20, 40, 30, PI/3, color(248, 113, 82));
  myGlasses4 = new Glasses(700, 100, 30, 30, 50);
}



void draw() {
  background(255);

  textFont(f2, 30);
  text("Hello.   ", width/2, 70); 

  pushMatrix(); 
  translate(78, 70);  

  textFont(f, 12);                 // STEP 4 Specify font to be used
  fill(0);                        // STEP 5 Specify font color 
  text("TOM*                                                       MIKE*                                                      STEVE                                                       MATT", 90, 205); 

  textFont(f2, 12);
  text("*Press w for sunglasses, q for glasses", 90, 275); 

  //Character 1
  myFace1.display();
  myGlasses1.display();
  myGlasses1.sunGlasses(selectedKey);

  //Character 2
  myFace2.display();
  //  myGlasses2.display();
  //  myGlasses2.sunGlasses(selectedKey);

  //Character 3
  myFace3.display();
  myGlasses3.display();
  myGlasses3.sunGlasses(selectedKey);

  //Character 4
  myFace4.display();
  //  myGlasses4.display();
  //  myGlasses4.sunGlasses(selectedKey);

  strokeWeight(2);
  line(51, y-5, 57, y-5);
  line(93, y-5, 107, y-5);
  line(143, y-5, 149, y-5);

  //  line(251, y-5, 263, y-5);
  //  line(287, y-5, 311, y-5);
  //  line(337, y-5, 350, y-5);
  
  line(450, y-5, 462, y-5);
  line(488, y-5, 512, y-5);
  line(538, y-5, 550, y-5);

  //  line(652, y-5, 660, y-5);
  //  line(690, y-5, 710, y-5);
  //  line(740, y-5, 748, y-5);

  strokeWeight(1);
  noFill();
  arc(275, 90, 18, 11, PI, TWO_PI-PI/2);
  arc(275, 90, 18, 11, TWO_PI-PI/2, TWO_PI);
  arc(325, 90, 18, 11, PI, TWO_PI-PI/2);
  arc(325, 90, 18, 11, TWO_PI-PI/2, TWO_PI);

  //   beginShape();
  //  vertex(50, 75);
  //  bezierVertex(120, 50, 100, 100, 50, 75);
  //  bezierVertex(100, 10, 100, 10, 50, 75);
  //  fill(0);
  //  endShape();

  popMatrix();
}


void keyPressed() {
  if (key =='q') {
    selectedKey = 1;
  }
  else if (key =='w') {
    selectedKey = 2;
  }
}


