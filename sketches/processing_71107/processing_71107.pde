
//Robb Godshaw 2012 www.robb.cc
//CAT
int pitch=4; 
int coordCount =0;
boolean click;
boolean drawn;
int[][] coord;
int clickCount = 0;
int upp = 0;
float xa = -4, ya = 204, 
xb = 44, yb = 196, 
xc = 108, 
xd = 164, 
xe = 220;


void setup() {
  size(512, 512);
  smooth();

  //PImage cat;
  //cat = loadImage("cat.png");  //This is the cat I traced. I don't need it anymore.
  //image (cat,0,0); //source: http://upload.wikimedia.org/wikipedia/en/thumb/e/ed/Nyan_cat_250px_frame.PNG/220px-Nyan_cat_250px_frame.PNG
  coord=new int [99][2];
  fill(254);
  text("Clicking adds stars.", width/2+40, int(height-10));
  noStroke();
  click = true;
}


void wave() {//animate this later.

  noFill();
  if (upp==1) {
    ya = ya +0.1;
  }
  else if ( upp==0 )
  {
    ya = ya -0.1;
  }
  if ( ya > 204) {
    upp = 0;
  }
  else if ( ya < 196) {
    upp=1;
  }

  yb= 200-(ya-200);


  beginShape();
  curveVertex(xa, ya);
  curveVertex(xa, ya);
  curveVertex(xb, yb);
  curveVertex(xc, ya);
  curveVertex(xd, yb);
  curveVertex(xe, ya);
  curveVertex(xe, ya);
  endShape();
}



void draw() {
  background(8, 35, 87);//blue!
  rainbow();//calls the rainbow
  initialCat();//calls the cat
  clickTrack();
  fill(255);

  stars();
}
void mouseReleased() {
  click = true;
}
void clickTrack() {
  if (mousePressed == true && click == true&& clickCount < coord.length) {
   

    coord[clickCount][0] = mouseX;
    coord[clickCount][1] = mouseY; 

    println("ClickCount" + clickCount);//prints the usable code that we start off with
    print("X" + coord[clickCount][0]);
    println("  Y"+coord[clickCount][1]);
    clickCount++;
    click=false;
    drawn = true;
  }
}

void stars() {
  for (int i = 0; i <clickCount; i = i+1) {
    c(coord[i][0]-pitch-(coord[i][0] % (2*pitch)), coord[i][1]-pitch-(coord[i][1] % (2*pitch))); //point on 10px grid near mouseY
  }
}


void c(float cX, float cY) {//this is a simlified rect function
  int dia = 8;
  rect(cX, cY, dia, dia);
}



void keyPressed() { // I used these to correct the generated rectangle code.
  if (key == 'X' || key == 'x') {
    println("Change Color....");
  }
  if (key == 'z' || key == 'Z') {
    println("Scratch That...");
  }
}

void rainbow() {//function for rainbow

    stroke(239, 0, 0);//RED
  strokeWeight(3*8);
  strokeCap(ROUND);
  wave();

  stroke(244, 137, 0);//ORANGE
  translate(0, 3*8);
  wave();

  stroke(254, 255, 0);//YELOW
  translate(0, 3*8);
  wave();

  stroke(82, 255, 0);//GREEN
  translate(0, 3*8);
  wave();

  stroke(30, 126, 255);//BLUE
  translate(0, 3*8);
  wave();

  stroke(74, 0, 255);//purple
  translate(0, 3*8);
  wave();
  noStroke();

  translate(0, -3*8*5);//this undoes the damage of all those translates above
}


void initialCat() {
  //the following code was generated with the print functions above, then copy/pasted here and lightly edited.

  fill(247, 192, 127);//poptart beige
  rect(188, 196, 332-188, 316-196);

  fill(241, 124, 255);//poptart ground pink
  rect(204, 212, 308-204, 292-212);

  c(212, 204);
  c(220, 204);
  c(220, 204);
  c(228, 204);
  c(236, 204);
  c(244, 204);
  c(244, 204);
  c(252, 204);
  c(260, 204);
  c(268, 204);
  c(276, 204);
  c(284, 204);
  c(292, 204);
  c(292, 204);
  c(300, 204);
  c(308, 212);
  c(308, 220);
  c(316, 212);
  c(316, 220);
  c(308, 220);
  c(308, 228);
  c(308, 236);
  c(316, 236);
  c(316, 228);
  c(196, 220);
  c(196, 228);
  c(196, 236);
  c(196, 244);
  c(196, 252);
  c(196, 260);
  c(196, 268);
  c(196, 276);
  c(196, 284);
  c(204, 292);
  c(212, 292);
  c(212, 300);
  c(220, 292);
  c(220, 300);
  c(228, 300);
  c(228, 292);
  c(244, 292);
  c(244, 300);
  c(236, 300);
  c(236, 292);
  c(252, 300);

  fill(135);//Grey
  c(324, 268);
  c(324, 260);
  c(364, 284);
  c(132, 252);
  c(140, 252);
  c(140, 260);
  c(148, 252);
  c(148, 260);
  c(156, 260);
  c(164, 260);
  c(164, 268);
  c(172, 268);
  c(164, 316);
  c(172, 316);
  c(204, 324);
  c(212, 324);
  c(276, 316);
  c(284, 316);
  c(316, 316);
  c(268, 228);
  c(276, 228);
  c(268, 236);
  c(276, 236);
  c(284, 236);
  c(268, 244);
  c(276, 244);
  c(284, 244);
  c(292, 244);
  c(268, 252);
  c(276, 252);
  c(284, 244);
  c(284, 244);
  c(284, 252);
  c(292, 252);
  c(276, 260);
  c(300, 252);
  c(308, 252);
  c(316, 252);
  c(324, 252);
  c(332, 252);
  c(332, 244);
  c(340, 236);
  c(348, 236);
  c(340, 244);
  c(340, 244);
  c(340, 244);
  c(340, 252);
  c(348, 228);
  c(356, 228);
  c(356, 236);
  c(356, 244);
  c(356, 252);
  c(348, 244);
  c(348, 252);
  c(348, 252);
  c(348, 260);
  c(356, 260);
  c(364, 260);
  c(356, 268);
  c(348, 268);
  c(364, 268);
  c(364, 276);
  c(356, 276);
  c(348, 276);
  c(340, 276);
  c(332, 276);
  c(324, 276);
  c(324, 284);
  c(332, 284);
  c(348, 300);
  c(340, 300);
  c(332, 300);
  c(324, 300);
  c(316, 300);
  c(308, 300);
  c(300, 300);
  c(292, 300);
  c(284, 300);
  c(276, 300);
  c(268, 300);
  c(284, 292);
  c(284, 284);
  c(260, 292);
  c(260, 276);
  c(260, 284);
  c(260, 260);
  c(268, 260);
  c(260, 268);
  c(268, 268);
  c(268, 276);
  c(268, 276);
  c(276, 276);
  c(276, 268);
  c(284, 276);
  c(292, 276);
  c(300, 284);
  c(308, 284);
  c(308, 276);
  c(300, 276);
  c(316, 276);
  c(308, 268);
  c(300, 268);
  c(300, 260);
  c(308, 260);
  c(316, 260);

  fill(241, 132, 132);//facepink
  c(268, 284);
  c(276, 284);
  c(276, 292);
  c(268, 292);
  c(348, 284);
  c(356, 284);
  c(356, 292);
  c(348, 292);

  fill(255);//eye white
  c(332, 260);
  c(284, 260);
  c(76, 28);
  c(92, 4);
  c(52, 4);
  c(292, 68);
  c(300, 60);
  c(300, 76);
  c(308, 68);
  c(364, 156);
  c(380, 140);
  c(404, 156);
  c(388, 180);
  c(308, 380);
  c(308, 388);
  c(308, 404);
  c(324, 404);
  c(332, 404);
  c(308, 420);
  c(308, 420);
  c(308, 420);
  c(308, 428);
  c(292, 404);
  c(284, 404);
  c(36, 484);

  fill(237, 6, 127);//poptart figure pink
  c(212, 220);
  c(244, 212);
  c(268, 212);
  c(300, 220);
  c(236, 236);
  c(220, 252);
  c(236, 260);
  c(204, 268);
  c(212, 284);
  c(228, 284);

  fill(1);
  c(188, 196);
  c(196, 188);
  c(196, 188);
  c(204, 188);
  c(204, 188);
  c(212, 188);
  c(220, 188);
  c(228, 188);
  c(236, 188);
  c(244, 188);
  c(252, 188);
  c(260, 188);
  c(268, 188);
  c(276, 188);
  c(284, 188);
  c(292, 188);
  c(292, 188);
  c(292, 188);
  c(300, 188);
  c(308, 188);
  c(316, 188);
  c(324, 196);
  c(332, 204);
  c(332, 212);
  c(332, 220);
  c(332, 228);
  c(332, 236);
  c(340, 228);
  c(348, 220);
  c(356, 220);
  c(364, 228);
  c(364, 236);
  c(364, 244);
  c(364, 252);
  c(372, 260);
  c(372, 268);
  c(372, 276);
  c(372, 284);
  c(364, 292);
  c(356, 300);
  c(348, 308);
  c(340, 308);
  c(332, 308);
  c(324, 308);
  c(316, 308);
  c(308, 308);
  c(300, 308);
  c(292, 308);
  c(292, 292);
  c(292, 284);
  c(292, 292);
  c(300, 292);
  c(300, 292);
  c(308, 292);
  c(316, 292);
  c(316, 284);
  c(324, 292);
  c(332, 292);
  c(340, 284);
  c(340, 292);
  c(340, 260);
  c(340, 268);
  c(332, 268);
  c(316, 268);
  c(284, 268);
  c(292, 268);
  c(292, 260);
  c(300, 244);
  c(308, 244);
  c(316, 244);
  c(324, 244);
  c(292, 236);
  c(284, 228);
  c(276, 220);
  c(268, 220);
  c(260, 228);
  c(260, 236);
  c(260, 244);
  c(260, 252);
  c(252, 260);
  c(252, 268);
  c(252, 276);
  c(252, 284);
  c(252, 292);
  c(260, 300);
  c(268, 308);
  c(276, 308);
  c(276, 308);
  c(284, 308);
  c(180, 204);
  c(180, 212);
  c(180, 228);
  c(180, 220);
  c(180, 236);
  c(180, 244);
  c(180, 252);
  c(180, 260);
  c(180, 268);
  c(180, 276);
  c(180, 276);
  c(180, 284);
  c(180, 292);
  c(180, 292);
  c(172, 260);
  c(172, 252);
  c(164, 252);
  c(156, 252);
  c(156, 244);
  c(132, 244);
  c(140, 244);
  c(148, 244);
  c(124, 252);
  c(124, 260);
  c(132, 260);
  c(140, 268);
  c(148, 268);
  c(156, 268);
  c(164, 276);
  c(172, 276);
  c(180, 300);
  c(180, 308);
  c(172, 300);
  c(172, 308);
  c(164, 308);
  c(156, 316);
  c(156, 324);
  c(164, 324);
  c(172, 324);
  c(180, 316);
  c(188, 316);
  c(188, 308);
  c(196, 316);
  c(204, 316);
  c(212, 316);
  c(220, 316);
  c(228, 316);
  c(236, 316);
  c(244, 316);
  c(252, 316);
  c(260, 316);
  c(196, 324);
  c(204, 332);
  c(212, 332);
  c(220, 332);
  c(220, 324);
  c(268, 316);
  c(276, 324);
  c(284, 324);
  c(292, 324);
  c(292, 316);
  c(308, 316);
  c(316, 324);
  c(324, 324);
  c(324, 316);
}

