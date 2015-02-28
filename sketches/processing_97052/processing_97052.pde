


// Variables//
float DiametreBlanc=30;
float DiametreNina=8;
float PosX=10;
float PosY=15;
float VelX=13;
float VelY=7;

void setup() {
  size(260, 260);
  frameRate(5);
}

void draw() {
  PosX=PosX+VelX;
  PosY=PosY+VelY;

  // Fons triangle blanc // 
  fill(255);
  triangle(0, height, width/2, 0, width, height);

  // Linies que formen la cara//
  strokeWeight(6);
  line(150, 240, 180, 240);
  line(150, 240, 120, 220);
  line(120, 220, 105, 180);
  line(105, 180, 90, 175);
  line(90, 175, 80, 140);
  line(80, 140, 95, 145);
  line(95, 145, 80, 100);
  line(180, 240, 210, 220);
  line(210, 220, 220, 150);


  // Barret // 
  fill(0);
  ellipse(160, 60, 180, 80);

  // fons taronja//
  noStroke();
  fill(240, 120, 7);
  triangle(0, 0, 130, 0, 0, 265);
  triangle(130, 0, 260, 0, 260, 260);

  // Linia d'abaix //
  strokeWeight(15);
  stroke(240, 120, 7);
  line(0, 260, 260, 260);

  // Triangle negre //
  noFill();
  strokeWeight(9);
  stroke(0);
  triangle(10, 250, 130, 10, 250, 250);

  // Linies que formen les pestanyes amb gruix 5//
  strokeWeight(5);
  line(PosX-130+130, PosY-130+155, PosX-130+130, PosY-130+105);
  line(PosX-130+105, PosY-130+130, PosX-130+155, PosY-130+130);
  line(PosX-130+110, PosY-130+140, PosX-130+150, PosY-130+120);
  line(PosX-130+120, PosY-130+150, PosX-130+140, PosY-130+110);
  line(PosX-130+150, PosY-130+140, PosX-130+110, PosY-130+120);
  line(PosX-130+120, PosY-130+110, PosX-130+140, PosY-130+150);

  if (mousePressed) {
    strokeWeight(4);
    fill(PosX, PosY, 0, 250);
    triangle ( PosX-DiametreBlanc+12, PosY+DiametreBlanc-18, PosX, PosY-DiametreBlanc+10, PosX+DiametreBlanc-12, PosY+DiametreBlanc-18);
    strokeWeight(3); 
    fill(0);
    ellipse(PosX, PosY, 8, 8);
  }
  else {

    // El·lipse que forma l'ull blanc//
    fill(PosX, PosY, 0, 255);
    ellipse(PosX, PosY, DiametreBlanc, DiametreBlanc);

    // El·lipse que forma la nina de l'ull//
    fill(0);
    ellipse(PosX, PosY, 8, 8);

    if ((PosX>=width/2)&&(PosY>=height/2)) {
      fill(102, 204, 240);
      ellipse(PosX, PosY, DiametreBlanc, DiametreBlanc);
      fill(0);
      ellipse(PosX, PosY, 8, 8);
    }

    if ((PosX<=width/2)&&(PosY>=height/2)) {
      fill(42, 216, 92);
      ellipse(PosX, PosY, DiametreBlanc, DiametreBlanc);
      fill(0);
      ellipse(PosX, PosY, 8, 8);
    }

    if ((PosX<=width/2)&&(PosY<=height/2)) {
      fill(173, 180, 170);
      ellipse(PosX, PosY, DiametreBlanc, DiametreBlanc);
      fill(0);
      ellipse(PosX, PosY, 8, 8);
    }

    if ((PosX>=width/2)&&(PosY<=height/2)) {
      fill(155, 93, 12);
      ellipse(PosX, PosY, DiametreBlanc, DiametreBlanc);
      fill(0);
      ellipse(PosX, PosY, 8, 8);
    }
  }

  if (PosX+DiametreBlanc+20>=width) {
    VelX=-VelX;
    PosX= width-DiametreBlanc;
  }

  if (PosX-DiametreBlanc/2<=0) {
    VelX=-VelX;
  }

  if (PosY+DiametreBlanc/2+20>=height) {
    VelY=-VelY;
  }
  if (PosY-DiametreBlanc/2<=0) {
    VelY=-VelY;
  }
  PosX=PosX+VelX;
  PosY=PosY+VelY;

  if (PosX+DiametreNina/2>=width) {
    VelX=-VelX;
    PosX= width-DiametreNina/2;
  }
  if (PosX-DiametreNina/2<=0) {
    VelX=-VelX;
  }
  if (PosY+DiametreNina/2>=height) {
    VelY=-VelY;
  }
  if (PosY-DiametreNina/2<=0) {
    VelY=-VelY;
  }
  
}

//Funció mousePressed per variar la possició//

void mousePressed() {


  PosX=mouseX;
  PosY=mouseY;
  
}


